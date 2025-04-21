import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:reachify/Model/userModel.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterWithEmail>((event, emit) async {
      try {
        emit(RegisterLoadingState());

        await firebaseAuth.createUserWithEmailAndPassword(
          email: event.userModel.email,
          password: event.userModel.confPassword,
        );
        emit(RegisterDoneState());
      } on FirebaseAuthException catch (e) {
        switch (e.code) {
          case "invalid-email":
            emit(RegisterErrorState("Invalid email format."));
            break;

          case "email-already-in-use":
            emit(RegisterErrorState("This email is already in use."));
            break;

          case "weak-password":
            emit(RegisterErrorState("Your password is weak."));
            break;

          case "invalid-credential":
            emit(RegisterErrorState("The credentials provided are invalid."));
            break;

          case "network-request-failed":
            emit(RegisterErrorState("Network error. Check your connection."));
            break;

          case "user-disabled":
            emit(
              RegisterErrorState(
                "The user's account has been disabled by an admin.",
              ),
            );
            break;

          case "internal-error":
            emit(
              RegisterErrorState("An internal database server issue occurred."),
            );
            break;

          default:
            emit(RegisterErrorState("An error occurred: ${e.message}"));
            break;
        }
      } catch (e) {
        emit(
          RegisterErrorState("An unexpected error occurred ${e.toString()}"),
        );
      }
    });
    on<RegisterButtonPressEvent>((event, emit) {
      emit(RegisterButtonPressedState());
    });
  }
}

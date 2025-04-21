import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:reachify/Model/userModel.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  LoginBloc() : super(LoginInitial()) {
    on<LoginUserDetailsEvent>((event, emit) async {
      try {
        emit(LoginLoadingState());
        await firebaseAuth.signInWithEmailAndPassword(
          email: event.userModel.email,
          password: event.userModel.password,
        );

        emit(LoginDoneState());
      } on FirebaseAuthException catch (e) {
        switch (e.code) {
          case "invalid-email":
            emit(LoginErrorState("The email address provided is not valid"));
            break;
          case "user-not-found":
            emit(LoginErrorState("User not found"));
            break;
          case "wrong-password":
            emit(LoginErrorState("Incorrect password."));
            break;
          case "too-many-requests":
            emit(
              LoginErrorState("Due to unusual activity login failed try later"),
            );
            break;
          case "internal-error":
            emit(LoginErrorState("An unexpected database server error"));
            break;

          default:
            emit(
              LoginErrorState("An unexpected error occurred: ${e.toString()}"),
            );
        }
      } catch (e) {
        emit(LoginErrorState("An error occurred: ${e.toString()}"));
      }
    });
    on<LoginButtonEvent>((event, emit) {
      emit(LoginButtonPressedState());
    });
    on<LogoutEvent>((event, emit) async {
      try {
        await firebaseAuth.signOut();
        emit(LogoutState());
      } catch (e) {
        emit(LoginErrorState("Logout failed: ${e.toString()}"));
      }
    });
  }
}

part of 'register_bloc.dart';

abstract class RegisterState {}

final class RegisterInitial extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterDoneState extends RegisterState {}

class RegisterErrorState extends RegisterState {
  String message;
  RegisterErrorState(this.message);
}

class RegisterButtonPressedState extends RegisterState {}

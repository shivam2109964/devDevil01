part of 'login_bloc.dart';

abstract class LoginState {}

final class LoginInitial extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginDoneState extends LoginState {}

class LoginErrorState extends LoginState {
  String message;
  LoginErrorState(this.message);
}

class LoginButtonPressedState extends LoginState {}

class LogoutState extends LoginState {}

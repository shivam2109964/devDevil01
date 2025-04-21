part of 'login_bloc.dart';

abstract class LoginEvent {}

class LoginUserDetailsEvent extends LoginEvent {
  UserModel userModel;
  LoginUserDetailsEvent(this.userModel);
}

class LoginButtonEvent extends LoginEvent {}

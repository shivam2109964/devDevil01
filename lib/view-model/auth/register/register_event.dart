part of 'register_bloc.dart';

abstract class RegisterEvent {}

class RegisterWithEmail extends RegisterEvent {
  UserModel userModel;
  RegisterWithEmail(this.userModel);
}

class RegisterButtonPressEvent extends RegisterEvent {}

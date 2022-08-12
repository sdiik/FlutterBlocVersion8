part of 'login_bloc.dart';

abstract class LoginEvent {
  const LoginEvent();
}

class LoginUsernameChanged extends LoginEvent {
  LoginUsernameChanged(this.username);
  final String? username;
}

class LoginPasswordChanged extends LoginEvent {
  LoginPasswordChanged(this.password);
  final String? password;
}

class LoginIsLoading extends LoginEvent {
  LoginIsLoading();
}

class LoginIsLoaded extends LoginEvent {
  LoginIsLoaded();
}

class LoginSubmitted extends LoginEvent {
  LoginSubmitted();
}

class LoginErrorHasRetrive extends LoginEvent {
  LoginErrorHasRetrive();
}
part of 'login_bloc.dart';

class LoginState extends Equatable {
  final String? username;
  final String? password;
  final bool? loading;
  final bool? isAuthenticated;
  final LoginErrorModel? error;

  LoginState({
    this.username,
    this.password,
    this.loading,
    this.isAuthenticated,
    this.error
  });

  var loginErrorModel = new LoginErrorModel(
      status: false,
      value: null
  );

  LoginState copyWith({
    username,
    password,
    loading,
    isAuthenticated,
    error
  }) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      loading: loading ?? this.loading,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      error: error ?? this.error ?? loginErrorModel
    );
  }

  @override
  List<Object?> get props => [username, password, loading, isAuthenticated, error];
}
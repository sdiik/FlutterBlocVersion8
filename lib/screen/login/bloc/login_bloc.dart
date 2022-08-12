import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_model.dart';
import 'login_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  LoginBloc() : super(LoginState()) {
    on<LoginUsernameChanged>((event, emit) =>
        _mapUsernameChangedToState(event, emit));
    on<LoginPasswordChanged>((event, emit) =>
        _mapPasswordChangedToState(event, emit));
    on<LoginSubmitted>((event, emit) => _mapLoginSubmittedToState(event, emit));
    on<LoginErrorHasRetrive>((event, emit) =>
        _mapLoginErrorHasRetrieveToState(event, emit));
  }

  void _mapUsernameChangedToState(LoginUsernameChanged event,
      Emitter<LoginState> emit) {
    final String username = event.username ?? "";
    return emit(state.copyWith(username: username, isAuthenticated: false));
  }

  void _mapPasswordChangedToState(LoginPasswordChanged event,
      Emitter<LoginState> emit) {
    final String password = event.password ?? "";
    return emit(state.copyWith(password: password, isAuthenticated: false));
  }

  void _mapSuccesLogin(UserInfo userInfo) {
    var isAuthenticated = true;
    var error = new LoginErrorModel();
    error.status = false;
    error.value = 'Username dan password is correct';
    emit(state.copyWith(loading: false, error: error, isAuthenticated: isAuthenticated));
  }

  void _mapFailedLogin(String message) {
    var error = new LoginErrorModel();
    error.status = true;
    error.value = message;
    emit(state.copyWith(loading: false, error: error, isAuthenticated: false));
  }

  Future<void> _mapLoginSubmittedToState(LoginSubmitted event, Emitter<LoginState> emit) async {
    emit(state.copyWith(loading: true));
    try {
      final response = await LoginRepository().submitLogin(state);
      _mapSuccesLogin(response!);
    } catch(error) {
      _mapFailedLogin(error.toString());
    }
  }

  Future<void> _mapLoginErrorHasRetrieveToState(LoginErrorHasRetrive event, Emitter<LoginState> emit) async {
    var error = new LoginErrorModel();
    error.status = false;
    error.value = null;
    emit(state.copyWith(error: error));
  }

}
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_project/screen/register/bloc/register_event.dart';
import 'package:flutter_bloc_project/screen/register/bloc/register_model.dart';
import 'package:flutter_bloc_project/screen/register/bloc/register_repository.dart';
import 'package:flutter_bloc_project/screen/register/bloc/register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterState()) {
    on<RegisterNameChanged>((event, emit) => _mapNameChanged(event, emit));
    on<RegisterPasswordChanged>(
        (event, emit) => _mapPasswordChanged(event, emit));
    on<RegisterEmailChanged>((event, emit) => _mapEmailChanged(event, emit));
    on<RegisterPhoneChanged>((event, emit) => _mapPhoneChanged(event, emit));
    on<RegisterCallingCodeChanged>(
        (event, emit) => _mapCallingCodeChanged(event, emit));
    on<RegisterSubmitted>((event, emit) => _mapRegister(event, emit));
  }

  void _mapNameChanged(RegisterNameChanged event, Emitter<RegisterState> emit) {
    final String name = event.name ?? "";
    return emit(state.copyWith(name: name));
  }

  void _mapPasswordChanged(
      RegisterPasswordChanged event, Emitter<RegisterState> emit) {
    final String password = event.password ?? "";
    return emit(state.copyWith(password: password));
  }

  void _mapEmailChanged(
      RegisterEmailChanged event, Emitter<RegisterState> emit) {
    final String email = event.email ?? "";
    return emit(state.copyWith(email: email));
  }

  void _mapPhoneChanged(
      RegisterPhoneChanged event, Emitter<RegisterState> emit) {
    final String phone = event.phone ?? "";
    return emit(state.copyWith(phone: phone));
  }

  void _mapCallingCodeChanged(
      RegisterCallingCodeChanged event, Emitter<RegisterState> emit) {
    final String callingCode = event.callingCode ?? "";
    return emit(state.copyWith(callingCode: callingCode));
  }

  void _mapFailedRegister(String message) {
    var error = new RegisterErrorModel();
    error.status = true;
    error.value = message;
    emit(state.copyWith(loading: false, registerErrorModel: error));
  }

  void _mapSuccesRegister(RegisterModel registerModel) {
    emit(state.copyWith(
        loading: false,
        registerErrorModel: null,
        registerModel: registerModel));
  }

  Future<void> _mapRegister(
      RegisterEvent event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(loading: true));
    try {
      final response = await RegisterRepository().signup(state);
      _mapSuccesRegister(response!);
    } catch (error) {
      _mapFailedRegister(error.toString());
    }
  }
}

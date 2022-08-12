import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_project/screen/register/bloc/register_model.dart';

class RegisterState extends Equatable {
  final String? name;
  final String? password;
  final String? email;
  final String? phone;
  final String? callingCode;
  final bool? loading;
  final RegisterErrorModel? registerErrorModel;
  final RegisterModel? registerModel;

  RegisterState(
      {this.name,
      this.password,
      this.email,
      this.phone,
      this.callingCode,
      this.loading,
      this.registerErrorModel,
      this.registerModel});

  RegisterState copyWith(
      {name,
      password,
      email,
      phone,
      callingCode,
      loading,
      registerErrorModel,
      registerModel}) {
    return RegisterState(
        name: this.name,
        password: this.password,
        email: this.email,
        phone: this.phone,
        callingCode: this.callingCode,
        loading: this.loading,
        registerErrorModel: this.registerErrorModel,
        registerModel: this.registerModel);
  }

  @override
  List<Object?> get props => [
        name,
        password,
        email,
        phone,
        callingCode,
        loading,
        registerErrorModel,
        registerModel
      ];
}

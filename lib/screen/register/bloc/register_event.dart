abstract class RegisterEvent {
  const RegisterEvent();
}

class RegisterNameChanged extends RegisterEvent {
  const RegisterNameChanged({this.name});

  final String? name;
}

class RegisterEmailChanged extends RegisterEvent {
  const RegisterEmailChanged({this.email});

  final String? email;
}

class RegisterPasswordChanged extends RegisterEvent {
  RegisterPasswordChanged({this.password});

  final String? password;
}

class RegisterCallingCodeChanged extends RegisterEvent {
  RegisterCallingCodeChanged({this.callingCode});

  final String? callingCode;
}

class RegisterPhoneChanged extends RegisterEvent {
  RegisterPhoneChanged({this.phone});

  final String? phone;
}

class RegisterSubmitted extends RegisterEvent {
  RegisterSubmitted();
}

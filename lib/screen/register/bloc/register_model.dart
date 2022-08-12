class RegisterModel {
  final int id;
  final String name, email, language, provider, phone, birthday, callingCode;
  final String accessToken, refreshToken;

  RegisterModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.language,
      required this.provider,
      required this.phone,
      required this.birthday,
      required this.callingCode,
      required this.accessToken,
      required this.refreshToken});

  factory RegisterModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterModelToJson(this);
}

RegisterModel _$RegisterModelFromJson(Map<String, dynamic> json) =>
    RegisterModel(
        id: json["id"] as int,
        name: json["name"] as String,
        email: json["email"] as String,
        language: json["language"] as String,
        provider: json["provider"] as String,
        phone: json["phone"] as String,
        birthday: json["birthday"] as String,
        callingCode: json["calling_code"] as String,
        accessToken: json["access_token"] as String,
        refreshToken: json["refresh_token"] as String);

Map<String, dynamic> _$RegisterModelToJson(RegisterModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'language': instance.language,
      'provider': instance.provider,
      'phone': instance.phone,
      'birthday': instance.birthday,
      'calling_code': instance.callingCode,
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken
    };

class RegisterErrorModel {
  bool? status;
  String? value;

  RegisterErrorModel({this.status, this.value});
}

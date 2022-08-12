class LoginErrorModel {
  bool? status;
  String? value;

  LoginErrorModel({this.status, this.value});
}

class UserInfo {
  final int id;
  final String name, email, phone;

  UserInfo({
    required this.id,
    required this.name,
    required this.email,
    required this.phone
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) => _$UserInfoFromJson(json);
  Map<String, dynamic> toJson() => _$PersonToJson(this);
}

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) => UserInfo (
  id: json['id'] as int,
  name: json['name'] as String,
  email: json['email'] as String,
  phone:  json['phone'] as String
);

Map<String, dynamic> _$PersonToJson(UserInfo instance) => <String, dynamic> {
  'id': instance.id,
  'name': instance.name,
  'email': instance.email,
  'phone': instance.phone
};
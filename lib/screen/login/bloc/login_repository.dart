import 'package:flutter_bloc_project/component/tools/api.dart';
import 'package:flutter_bloc_project/component/tools/constants.dart';
import 'login_bloc.dart';
import 'login_model.dart';

class LoginRepository {
  Future<UserInfo?> submitLogin(LoginState value) async {
    UserInfo? retrievedUser;

    try {
      var login = dio;
      login.options.headers['content-Type'] = 'application/json';
      login.options.headers['X-HH-Language'] = 'th-TH';

      var params = Map<String, dynamic>();
      params["grant_type"] = "password";
      params["username"] = value.username;
      params["password"] = value.password;

      final response = await login.post(Api.getEndpoint(EndpointType.login),
          data: params, options: options);
      retrievedUser = UserInfo.fromJson(response.data["data"]);
      return retrievedUser;
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}

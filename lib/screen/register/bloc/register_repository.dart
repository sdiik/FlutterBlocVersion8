import 'package:flutter_bloc_project/component/tools/api.dart';
import 'package:flutter_bloc_project/component/tools/constants.dart';
import 'package:flutter_bloc_project/screen/register/bloc/register_model.dart';
import 'package:flutter_bloc_project/screen/register/bloc/register_state.dart';

class RegisterRepository {
  Future<RegisterModel?> signup(RegisterState state) async {
    RegisterModel? retrievedRegister;

    try {
      var register = dio;
      register.options.headers['content-Type'] = 'application/json';
      register.options.headers['X-HH-Language'] = 'th-TH';

      var params = Map<String, dynamic>();
      params["minor_version"] = minorVersion;
      params["name"] = state.name;
      params["password"] = state.password;
      params["email"] = state.email;
      params["phone"] = state.phone;
      params["calling_code"] = state.callingCode;
      params["r_code"] = "REF-QAZYQ";
      params["provider"] = "hungryhub";
      params["language"] = "en-US";

      final response = await register.post(
          Api.getEndpoint(EndpointType.register),
          data: params,
          options: options);
      retrievedRegister = RegisterModel.fromJson(response.data["data"]);
      return retrievedRegister;
    } catch (error) {
      throw Exception(error);
    }
  }
}

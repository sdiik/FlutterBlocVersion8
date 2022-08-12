
import 'package:dio/dio.dart';
import 'package:flutter_bloc_project/component/tools/constants.dart';

enum EndpointType {
  login,register;
}

class Api {
  static getEndpoint(EndpointType endpoint) {
    switch (endpoint) {
      case EndpointType.login:
        return "${stagingURL}/oauth/token.json";
      case EndpointType.register:
        return "${stagingURL}/users.json";
      default:
        break;
    }
  }

  static getHeaders(EndpointType endpoint) {
    switch (endpoint) {
      case EndpointType.login:
        return {"Content-Type": contentType, "X-HH-Language": "th-TH"};
      case EndpointType.register:
        return {"Content-Type": contentType};
      default:
        break;
    }
  }


}
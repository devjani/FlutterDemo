import 'dart:async';

import 'package:flutter_app_splashscreen/utils/network_util.dart';
import 'package:flutter_app_splashscreen/models/LoginResponse.dart';

class RestDatasource {
  NetworkUtil _netUtil = new NetworkUtil();
  static final BASE_URL = "m1api.testapplication4.com/api/";
  static final LOGIN_URL = BASE_URL + "Account/Login";

  Future<LoginRequest> login(String username, String password) {
    return _netUtil.post(LOGIN_URL, body: {
      "username": username,
      "password": password
    }).then((dynamic res) {
      print(res.toString());
      if(res["error"]) throw new Exception(res["error_msg"]);
      return new LoginRequest.map(res["user"]);
    });
  }
}
import 'dart:convert';

import 'package:http/http.dart' as Http;
import 'package:http/http.dart';
import 'package:prueba/common/app_bloc.dart';

class LoginProviders {
  login(String email, String password) async {
    print("${appBloc.baseUrl}/login");
    Response httpResponse = await Http.post(
        Uri.parse("${appBloc.baseUrl}/login"),
        body: {"email": email, "password": password});
    Map<String, dynamic> response = jsonDecode(httpResponse.body);
    if (httpResponse.statusCode != 200) {
      return null;
    } else {
      return response;
    }
  }
}

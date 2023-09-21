import 'dart:convert';

import 'package:http/http.dart' as Http;
import 'package:http/http.dart';
import 'package:prueba/common/app_bloc.dart';

class RegisterProviders {
  register(String name, String email, String password) async {
    Response httpResponse = await Http.post(
        Uri.parse("${appBloc.baseUrl}/register"),
        body: {"name": name, "email": email, "password": password});
    Map<String, dynamic> response = jsonDecode(httpResponse.body);
    if (httpResponse.statusCode != 200) {
      return null;
    } else {
      return response;
    }
  }
}

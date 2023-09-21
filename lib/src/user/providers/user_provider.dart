import 'dart:convert';

import 'package:http/http.dart' as Http;
import 'package:http/http.dart';
import 'package:prueba/common/app_bloc.dart';

class UserProvider {
  getUser() async {
    Response httpResponse = await Http.get(Uri.parse("${appBloc.baseUrl}/user"),
        headers: {"access-token": appBloc.token ?? ""});
    Map<String, dynamic> response = jsonDecode(httpResponse.body);
    if (httpResponse.statusCode != 200) {
      return null;
    } else {
      return response;
    }
  }
}

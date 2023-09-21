import 'dart:convert';

import 'package:http/http.dart' as Http;
import 'package:http/http.dart';
import 'package:prueba/common/app_bloc.dart';

class TaskProvider {
  createTasks(String title, String description, String date) async {
    Response httpResponse =
        await Http.post(Uri.parse("${appBloc.baseUrl}/task"), headers: {
      "access-token": appBloc.token ?? ""
    }, body: {
      "title": title,
      "description": description,
      "expiration_date": date
    });
    Map<String, dynamic> response = jsonDecode(httpResponse.body);
    if (httpResponse.statusCode != 200) {
      return null;
    } else {
      return response;
    }
  }

  editTask(int id, String title, String description, String expiration_date,
      String status) async {
    print(id);
    Response httpResponse =
        await Http.put(Uri.parse("${appBloc.baseUrl}/task"), headers: {
      "access-token": appBloc.token ?? ""
    }, body: {
      "id": "$id",
      "title": title,
      "description": description,
      "expiration_date": expiration_date,
      "status": status
    });
    Map<String, dynamic> response = jsonDecode(httpResponse.body);
    print(response);
    if (httpResponse.statusCode != 200) {
      return null;
    } else {
      return response;
    }
  }

  deleteTask(int id) async {
    Response httpResponse =
        await Http.delete(Uri.parse("${appBloc.baseUrl}/task/$id"), headers: {
      "access-token": appBloc.token ?? ""
    });
    Map<String, dynamic> response = jsonDecode(httpResponse.body);
    print(response);
    if (httpResponse.statusCode != 200) {
      return null;
    } else {
      return response;
    }
  }
}

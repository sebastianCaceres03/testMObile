import 'package:shared_preferences/shared_preferences.dart';

class AppBloc {

  String baseUrl = 'http://localhost:4000/api';
  String? token = '';

  setTokenLogin(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

  Future<bool> isLogin() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? action = prefs.getString('token');
    token = action;
    return action == null ? false : true;
  }
}

final AppBloc appBloc = AppBloc();

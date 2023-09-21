// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:prueba/common/app_bloc.dart';
import 'package:prueba/common/notification_service.dart';
import 'package:prueba/src/login/blocs/validateFields.dart';
import 'package:prueba/src/login/providers/login_providers.dart';
import 'package:rxdart/rxdart.dart';

class LoginEmailBloc with ValidatorsFields {
  //email
  final BehaviorSubject<String> _emailBlocCollection = BehaviorSubject<String>();
  String? email;

  //password
  final BehaviorSubject<String> _passwordBlocCollection = BehaviorSubject<String>();
  String? password;


  //provider
  final provider = LoginProviders();

  //cambiar data
  void emailChange(String newEmail) async {
    email = newEmail;
    _emailBlocCollection.sink.add(email ?? "");
  }

  void passwordChange(String newPassword) async {
    password = newPassword;
    _passwordBlocCollection.sink.add(password ?? "");
  }

  Future<bool> login() async{
    var response = await provider.login(email ?? "", password ?? "");
    if (response == null) {
      _showToast("verifique los datos",TypeSnackBar.alert);
      return false;
    } else {
      appBloc.setTokenLogin(response['token']);
      return true;
    }
  }

  

  // ignore: unused_element
  _showToast(String? msg, TypeSnackBar typeSnackBar) {
    NotificationService.showSnackBar(msg, typeSnackBar);
  }

  //recuperar data
  Stream<String> get emailStream =>
      _emailBlocCollection.stream.transform(validateEmail);

  Stream<String> get passwordStream => _passwordBlocCollection.stream;

  Stream<bool> get OnSubmit =>
      Rx.combineLatest2(emailStream, passwordStream, (dynamic a, dynamic b) {
        if (a == "" || b == "") {
          return false;
        }
        return true;
      });

  //constructor
  LoginEmailBloc() {
    //passwordChange('');
    // confirmPasswordChange('');
  }

  void dispose() {
    _emailBlocCollection.close();
    _passwordBlocCollection.close();
  }
}
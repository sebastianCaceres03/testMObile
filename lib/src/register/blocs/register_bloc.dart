import 'package:prueba/common/app_bloc.dart';
import 'package:prueba/common/notification_service.dart';
import 'package:prueba/src/login/blocs/validateFields.dart';
import 'package:prueba/src/register/providers/register_provider.dart';
import 'package:rxdart/rxdart.dart';

class RegisterBloc with ValidatorsFields {
  //name
  final BehaviorSubject<String> _nameBlocCollection = BehaviorSubject<String>();
  String? name;

  //email
  final BehaviorSubject<String> _emailBlocCollection = BehaviorSubject<String>();
  String? email;

  //password
  final BehaviorSubject<String> _passwordBlocCollection = BehaviorSubject<String>();
  String? password;


  //provider
  final provider = RegisterProviders();

  //cambiar data
  void nameChange(String newname) async {
    name = newname;
    _nameBlocCollection.sink.add(name ?? "");
  }

  void emailChange(String newEmail) async {
    email = newEmail;
    _emailBlocCollection.sink.add(email ?? "");
  }

  void passwordChange(String newPassword) async {
    password = newPassword;
    _passwordBlocCollection.sink.add(password ?? "");
  }

  Future<bool> register() async{
    var response = await provider.register(name ?? "", email ?? "", password ?? "");
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

  Stream<String> get nameStream => _nameBlocCollection.stream;

  void dispose() {
    _emailBlocCollection.close();
    _passwordBlocCollection.close();
    _nameBlocCollection.close();
  }
}
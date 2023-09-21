import 'package:prueba/common/notification_service.dart';
import 'package:prueba/src/login/blocs/validateFields.dart';
import 'package:prueba/src/login/providers/login_providers.dart';
import 'package:prueba/src/task/providers/task_provider.dart';
import 'package:rxdart/rxdart.dart';

class CreateTaskBloc with ValidatorsFields {
  //email
  final BehaviorSubject<String> _titleBlocCollection = BehaviorSubject<String>();
  String? title;

  //password
  final BehaviorSubject<String> _descriptionBlocCollection = BehaviorSubject<String>();
  String? description;

   final BehaviorSubject<String> _dateBlocCollection = BehaviorSubject<String>();
  String? date;


  //provider
  final provider = TaskProvider();

  //cambiar data
  void titleChange(String newTitle) async {
    title = newTitle;
    _titleBlocCollection.sink.add(title ?? "");
  }

  void descriptionChange(String newdescription) async {
    description = newdescription;
    _descriptionBlocCollection.sink.add(description ?? "");
  }

  void dateChange(String newdate) async {
    date = newdate;
    _dateBlocCollection.sink.add(date ?? "");
  }

  Future<bool> createTask() async{
    var response = await provider.createTasks(title ?? "", description ?? "", date ?? "");
    if (response != null) {
      return true;
    }
    return false;
  }

  // Future<bool> login() async{
  //   var response = await provider.login(email ?? "", password ?? "");
  //   if (response == null) {
  //     _showToast("verifique los datos",TypeSnackBar.alert);
  //     return false;
  //   } else {
  //     appBloc.setTokenLogin(response['token']);
  //     return true;
  //   }
  // }

  // ignore: unused_element
  _showToast(String? msg, TypeSnackBar typeSnackBar) {
    NotificationService.showSnackBar(msg, typeSnackBar);
  }

  //recuperar data
  Stream<String> get titleStream =>
      _titleBlocCollection.stream.transform(validateEmail);

  Stream<String> get descriptionStream => _descriptionBlocCollection.stream;
   
  Stream<String> get dateStream => _dateBlocCollection.stream;

  Stream<bool> get OnSubmit =>
      Rx.combineLatest3(titleStream, descriptionStream,dateStream, (dynamic a, dynamic b, dynamic c) {
        print(a);
        print(b);
        print(c);
        if (a == "" || b == "" || c == "") {
          return false;
        }
        return true;
      });

  //constructor
  CreateTaskBloc() {
    //passwordChange('');
    // confirmPasswordChange('');
  }

  void dispose() {
    _titleBlocCollection.close();
    _descriptionBlocCollection.close();
    _dateBlocCollection.close();
  }
}
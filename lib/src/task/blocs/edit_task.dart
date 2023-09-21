import 'package:prueba/src/login/blocs/validateFields.dart';
import 'package:prueba/src/task/models/task_model.dart';
import 'package:prueba/src/task/providers/task_provider.dart';

class EditTaskBloc with ValidatorsFields {



  //provider
  final provider = TaskProvider();

  //cambiar data
  Future<bool> updateTask(Tasks tasks) async {
    var response = await provider.editTask(tasks.id ?? 0, tasks.title ?? "", tasks.description ?? "", tasks.expirationDate ?? "", tasks.status ?? "");
    if (response != null) {
      return true;
    }
    return false;
  }


Future<bool> deleteTask(Tasks tasks) async {
    var response = await provider.deleteTask(tasks.id ?? 0);
    if (response != null) {
      return true;
    }
    return false;
  }
  void dispose() {
    
  }
}
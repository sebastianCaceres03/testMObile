
import 'package:prueba/src/home/models/tasks_model.dart';
import 'package:prueba/src/home/providers/home_provider.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc {
  //email
  final BehaviorSubject<ListTasks> _tasksBlocCollection = BehaviorSubject<ListTasks>();
  Stream<ListTasks> get listTaskStream => _tasksBlocCollection.stream;
  late ListTasks tasks;


  //provider
  final provider = HomeProvider();

  //cambiar data
  void getTasks() async {
    var results = await provider.getTasks();
    if (results != null) {
      tasks = ListTasks.fromJson(results);
      _tasksBlocCollection.sink.add(tasks);
    } else {
      
    }
  }

  void dispose() {
    _tasksBlocCollection.close();
  }
}
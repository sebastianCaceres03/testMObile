import 'package:prueba/src/task/models/task_model.dart';

class ListTasks {
  final List<Tasks>? tasks;

  ListTasks({
    this.tasks,
  });

  ListTasks.fromJson(Map<String, dynamic> json)
    : tasks = (json['tasks'] as List?)?.map((dynamic e) => Tasks.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'tasks' : tasks?.map((e) => e.toJson()).toList()
  };
}


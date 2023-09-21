// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:prueba/services/redirect_service.dart';
import 'package:prueba/src/task/blocs/edit_task.dart';
import 'package:prueba/src/task/models/task_model.dart';
import 'package:prueba/src/task/screens/edit_task.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key, required this.tasks, required this.status, required this.function});

  final List<Tasks> tasks;
  final String status;
  final Function function;



  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      child: ListView.separated(
        itemCount: tasks.length,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 8.0,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          if (tasks[index].status != status) {
            return const SizedBox.shrink();
          }
          return ListTile(
            leading: const Icon(Icons.text_snippet_sharp),
            title: Text("${tasks[index].title}"),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${tasks[index].expirationDate}"),
                Text("${tasks[index].description}"),
              ],
            ),
            trailing: status == 'completed'
                ? null
                : PopupMenuButton(
                    icon: const Icon(Icons.more_vert_outlined),
                    onSelected: (value) {
                      if (value == 1) {
                        RedirectService.goTo(
                            context,
                            EditTask(
                              task: tasks[index],
                            ),
                            function: function);
                      } else if (value == 2) {
                        EditTaskBloc editTaskBloc = EditTaskBloc();
                        editTaskBloc.deleteTask(tasks[index]);
                        function();
                      }
                    },
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        child: Text('Editar'),
                        value: 1,
                      ),
                      const PopupMenuItem(
                        child: Text('Eliminar'),
                        value: 2,
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }
}

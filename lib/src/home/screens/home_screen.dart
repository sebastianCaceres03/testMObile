import 'package:flutter/material.dart';
import 'package:prueba/services/redirect_service.dart';
import 'package:prueba/src/home/blocs/home_bloc.dart';
import 'package:prueba/src/home/models/tasks_model.dart';
import 'package:prueba/src/home/widgets/task_list.dart';
import 'package:prueba/src/task/screens/create_task.dart';
import 'package:prueba/src/user/screens/user_data_screen.dart';
import 'package:prueba/styles/custom_button.dart';
import 'package:prueba/styles/custom_theme.dart';

class HomeScreem extends StatelessWidget {
  HomeScreem({super.key}){
    homeBloc.getTasks();
  }

  final HomeBloc homeBloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
          backgroundColor: CustomTheme().colors.white,
          appBar: AppBar(
            leading: InkWell(
              onTap: () {
                RedirectService.goTo(context,UserDataScreen());
              },
              child: Icon(
                Icons.person,
                color: CustomTheme().colors.white,
              ),
            ),
            backgroundColor: CustomTheme().colors.lightBlue,
            title: Text(
              "Mis Tareas",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: CustomTheme().colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 18.0,
              ),
            ),
            bottom:
                TabBar(
                  
                  indicatorColor: CustomTheme().colors.white, tabs: const [
              Tab(
                icon: Icon(Icons.pending_actions),
                text: 'Pendiente',
              ),
              Tab(
                icon: Icon(Icons.rule),
                text: 'En progreso',
              ),
              Tab(
                icon: Icon(Icons.event_available_rounded),
                text: 'completado',
              ),
            ]),
          ),
          body: StreamBuilder<ListTasks>(
            stream: homeBloc.listTaskStream,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const SizedBox.shrink();
              }
              return TabBarView(children: [
                TaskList(tasks: snapshot.data?.tasks ?? [],status: "pending",function: homeBloc.getTasks),
                TaskList(tasks: snapshot.data?.tasks ?? [],status: "in_progress",function: homeBloc.getTasks),
                TaskList(tasks: snapshot.data?.tasks ?? [],status: "completed",function: homeBloc.getTasks),
              ]);
            }
          ),
          bottomNavigationBar: Container(
            padding:
                const EdgeInsets.only(bottom: 16.0, left: 20.0, right: 20.0),
            child: CustomButton.button(
              title: const Text("Crear tarea"),
              onPressed: () {
                RedirectService.goTo(context, const CreateTask(),function: homeBloc.getTasks );
              },
            ),
          )),
    );
  }
}
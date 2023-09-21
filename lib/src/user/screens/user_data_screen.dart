import 'package:flutter/material.dart';
import 'package:prueba/services/redirect_service.dart';
import 'package:prueba/src/user/blocs/user_bloc.dart';
import 'package:prueba/src/user/models/user_model.dart';
import 'package:prueba/styles/custom_theme.dart';

class UserDataScreen extends StatelessWidget {
  UserDataScreen({super.key}){
    userBloc.getUser();
  }

  final UserBloc userBloc = UserBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomTheme().colors.lightBlue,
        leading: InkWell(
          onTap: () {
            RedirectService.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: CustomTheme().colors.white,
          ),
        ),
        title: Text(
          "Mi perfil",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: CustomTheme().colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 18.0,
          ),
        ),
      ),
      body: StreamBuilder<UserModel>(
        stream: userBloc.userStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const SizedBox.shrink();
          }
          return Container(
            margin: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nombre: ${snapshot.data?.user?.name}',
                  style: TextStyle(
                    color: CustomTheme().colors.darkBlue,
                    fontWeight: FontWeight.w700,
                    fontSize: 15.0,
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                  'Correo: ${snapshot.data?.user?.email}',
                  style: TextStyle(
                    color: CustomTheme().colors.darkBlue,
                    fontWeight: FontWeight.w700,
                    fontSize: 15.0,
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                  'Cantidad de tareas completadas: ${snapshot.data?.taskCompleted}',
                  style: TextStyle(
                    color: CustomTheme().colors.darkBlue,
                    fontWeight: FontWeight.w700,
                    fontSize: 15.0,
                  ),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:prueba/common/app_bloc.dart';
import 'package:prueba/common/notification_service.dart';
import 'package:prueba/src/home/screens/home_screen.dart';
import 'package:prueba/src/login/screens/Login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      scaffoldMessengerKey: NotificationService.messengerKey,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textSelectionTheme:
            const TextSelectionThemeData(cursorColor: Colors.white),
      ),
      home: FutureBuilder(
        future: redirect(),
         builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
          if (snapshot.hasData) {
              return Container(child: snapshot.data);
            }
            return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ));
         }
      ),
    );
  }

  Future<Widget> redirect() async{
    if (await appBloc.isLogin()) {
      return HomeScreem();
    } else {
      return LoginScreen();
    }
  }
}

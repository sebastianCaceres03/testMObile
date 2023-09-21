import 'package:flutter/material.dart';
import 'package:prueba/services/redirect_service.dart';
import 'package:prueba/src/home/screens/home_screen.dart';
import 'package:prueba/src/register/blocs/register_bloc.dart';
import 'package:prueba/styles/custom_button.dart';
import 'package:prueba/styles/custom_theme.dart';
import 'package:prueba/styles/text_field_style.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final RegisterBloc registerBloc = RegisterBloc();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomRight,
          colors: [
            CustomTheme().colors.darkBlue,
            CustomTheme().colors.lightBlue,
            CustomTheme().colors.white
          ],
        )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60.0, left: 18.0, right: 8.0),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      RedirectService.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.8,
                    child: Text(
                      "Registro",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: CustomTheme().colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 60.0, left: 32.0, right: 32.0),
              child: Form(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person_pin,
                    size: 100.0,
                    color: CustomTheme().colors.white,
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  TextFormField(
                    onChanged: (value) {
                      registerBloc.nameChange(value);
                    },
                    style: TextFieldStyle.textStyle(
                        colorText: CustomTheme().colors.white),
                    decoration: TextFieldStyle.general(labelText: "Nombre"),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  StreamBuilder<String>(
                      stream: registerBloc.emailStream,
                      builder: (context, snapshot) {
                        return TextFormField(
                          style: TextFieldStyle.textStyle(
                        colorText: CustomTheme().colors.white),
                          onChanged: (value) {
                            registerBloc.emailChange(value);
                          },
                          maxLines: 1,
                          decoration: TextFieldStyle.general(
                              labelText: "Correo",
                              errorText: snapshot.error as String?),
                          keyboardType: TextInputType.emailAddress,
                        );
                      }),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    onChanged: (value) {
                      registerBloc.passwordChange(value);
                    },
                    style: TextFieldStyle.textStyle(
                        colorText: CustomTheme().colors.white),
                    decoration: TextFieldStyle.general(labelText: "Contraseña"),
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  CustomButton.button(
                      title: const Text("Regístrate"), onPressed: () async{
                        bool response = await registerBloc.register();
                        if (response) {
                          RedirectService.goTo(context, HomeScreem());
                        }
                      }),
                ],
              )),
            ),
            const SizedBox(
              height: 30.0,
            ),
            TextButton(
                onPressed: () {
                   RedirectService.pop(context);
                },
                child: Text(
                  "Iniciar sesión",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: CustomTheme().colors.darkBlue,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
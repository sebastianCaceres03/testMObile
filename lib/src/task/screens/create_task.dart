import 'package:flutter/material.dart';
import 'package:prueba/common/show_date_time_picker.dart';
import 'package:prueba/services/redirect_service.dart';
import 'package:prueba/src/task/blocs/create_task_bloc.dart';
import 'package:prueba/styles/custom_button.dart';
import 'package:prueba/styles/custom_theme.dart';
import 'package:prueba/styles/text_field_style.dart';

class CreateTask extends StatefulWidget {
  const CreateTask({super.key});

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  String dateText = "";
  DateTime? dateSelected;

  final CreateTaskBloc createTaskBloc = CreateTaskBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomTheme().colors.white,
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
          "Crear tarea",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: CustomTheme().colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 18.0,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40.0,
              ),
              TextFormField(
                style: TextFieldStyle.textStyle(
                    colorText: CustomTheme().colors.lightBlue),
                onChanged: (value) {
                  createTaskBloc.titleChange(value);
                },
                maxLines: 1,
                decoration: TextFieldStyle.withIcon(
                  labelText: "Titulo",
                ),
                cursorColor: CustomTheme().colors.darkBlue,
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextFormField(
                style: TextFieldStyle.textStyle(
                    colorText: CustomTheme().colors.lightBlue),
                onChanged: (value) {
                  createTaskBloc.descriptionChange(value);
                },
                maxLines: 3,
                decoration: TextFieldStyle.withIcon(
                  labelText: "Descripción",
                ),
                cursorColor: CustomTheme().colors.darkBlue,
              ),
              const SizedBox(
                height: 20.0,
              ),
              // fecha
              ShowdatetimePicker(
                  hintText: "Fecha",
                  dateText: dateText,
                  dateSelected: dateSelected,
                  currentDate: (String? value, DateTime? value2) {
                    createTaskBloc.dateChange(value ?? "");
                    setState(() {
                      dateText = value!;
                      dateSelected = value2;
                    });
                  }),
              // estado
              const SizedBox(
                height: 40.0,
              ),
              CustomButton.button(
                title: const Text("Guardar"),
                onPressed: () async{
                  bool result = await createTaskBloc.createTask();
                  if(result){
                    RedirectService.pop(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
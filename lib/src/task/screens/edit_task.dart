import 'package:flutter/material.dart';
import 'package:prueba/common/drop_down.dart';
import 'package:prueba/common/show_date_time_picker.dart';
import 'package:prueba/services/redirect_service.dart';
import 'package:prueba/src/task/blocs/edit_task.dart';
import 'package:prueba/src/task/models/task_model.dart';
import 'package:prueba/styles/custom_button.dart';
import 'package:prueba/styles/custom_theme.dart';
import 'package:prueba/styles/text_field_style.dart';

List<String> list = <String>['pending', 'in_progress', 'completed'];

class EditTask extends StatefulWidget {
  EditTask({super.key, required this.task});

  final Tasks task;

  final EditTaskBloc editTaskBloc = EditTaskBloc();

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  String dateText = "";
  DateTime? dateSelected;
  String dropdownValue = list.first;

  @override
  void initState() {
    dropdownValue = widget.task.status ?? list.first;
    dateSelected =  DateTime.parse(widget.task.expirationDate ?? "");
    dateText = dateSelected.toString();
    super.initState();
  }

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
          "Editar tarea",
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
                  widget.task.title = value;
                },
                maxLines: 1,
                initialValue: widget.task.title,
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
                  widget.task.description = value;
                },
                initialValue: widget.task.description,
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
                    widget.task.expirationDate = value;
                    setState(() {
                      dateText = value!;
                      dateSelected = value2;
                    });
                  }),
              const SizedBox(
                height: 20.0,
              ),
              // estado
              DropDown(
                  dropdownValue: dropdownValue,
                  dropList: list,
                  hintText: "Estado",
                  onChanged: (String value) {
                    widget.task.status = value;
                    dropdownValue = value;
                    setState(() {
                      
                    });
                  }),
              const SizedBox(
                height: 40.0,
              ),
              CustomButton.button(
                title: const Text("Guardar"),
                onPressed: () async{
                  bool response = await widget.editTaskBloc.updateTask(widget.task);
                  if (response) {
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
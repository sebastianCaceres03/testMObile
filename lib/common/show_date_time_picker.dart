import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:prueba/styles/custom_theme.dart';

class ShowdatetimePicker extends StatelessWidget {
  final String dateText;
  final DateTime? dateSelected;
  final Function currentDate;
  final String hintText;
  const ShowdatetimePicker({
    super.key,
    required this.dateText,
    this.dateSelected,
    required this.currentDate,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _showDateTimePicker(context);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        width: double.infinity,
        decoration: BoxDecoration(
          color: CustomTheme().colors.white,
          border: Border(
            bottom: BorderSide(color: CustomTheme().colors.darkBlue),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              hintText,
              style: TextStyle(
                color: CustomTheme().colors.darkBlue,
                fontWeight: FontWeight.w700,
                fontSize: 15.0,
              ),
            ),
            Text(
              dateText,
              style: TextStyle(
                color: CustomTheme().colors.lightBlue,
                fontWeight: FontWeight.w500,
                fontSize: 15.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDateTimePicker(BuildContext context) {
    DatePicker.showDatePicker(context,
        minTime: DateTime(1950, 1, 1),
        showTitleActions: true,
        theme: DatePickerTheme(
          backgroundColor: CustomTheme().colors.white,
          doneStyle: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            color: CustomTheme().colors.darkBlue,
          ),
          cancelStyle: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            color: CustomTheme().colors.lightBlue,
          ),
        ),
        onChanged: (date) {}, onConfirm: (date) {
      var mes = date.month < 10 ? "0${date.month}" : date.month;
      var dia = date.day < 10 ? "0${date.day}" : date.day;
      var dt = "${date.year}-$mes-$dia";
      currentDate(dt, date);
    }, currentTime: dateSelected ?? DateTime.now(), locale: LocaleType.fr);
  }
}
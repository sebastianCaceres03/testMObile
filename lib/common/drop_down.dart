import 'package:flutter/material.dart';
import 'package:prueba/styles/custom_theme.dart';

class DropDown extends StatelessWidget {
  final String? dropdownValue;
  final List<String> dropList;
  final Function onChanged;
  final String? hintText;
  const DropDown({
    super.key,
    required this.dropdownValue,
    required this.dropList,
    required this.onChanged,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      child: DropdownButton<String>(
        isExpanded: true,
        hint: Text(
          hintText ?? "",
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            color: CustomTheme().colors.darkBlue,
          ),
        ),
        underline: Container(
          height: 1,
          color: CustomTheme().colors.darkBlue,
        ),
        value: dropdownValue,
        icon: Icon(
          Icons.keyboard_arrow_down_rounded,
          color: CustomTheme().colors.darkBlue,
        ),
        elevation: 16,
        onChanged: (String? value) => onChanged(value),
        items: dropList.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                color: CustomTheme().colors.darkBlue,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
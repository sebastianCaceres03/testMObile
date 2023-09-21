import 'package:flutter/material.dart';
import 'package:prueba/styles/custom_theme.dart';

class TextFieldStyle {
  static InputDecoration general({String labelText = "", String? errorText}) {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 15),
      fillColor: Colors.transparent,
      focusColor: CustomTheme().colors.darkBlue,
      hoverColor: CustomTheme().colors.darkBlue,
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: CustomTheme().colors.white),
      ),
      filled: true,
      counterText: "",
      labelText: labelText,
      labelStyle: TextStyle(
        color: CustomTheme().colors.white,
        fontWeight: FontWeight.w700,
        fontSize: 16,
      ),
      errorText: errorText,
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: CustomTheme().colors.white),
      ),
      errorBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
      ),
    );
  }

  static InputDecoration withIcon({
    String labelText = "",
    Widget? icon,
    Widget? leftIcon,
    Color colorInput = Colors.indigo,
  }) {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 15),
      filled: true,
      counterText: "",
      fillColor: Colors.transparent,
      focusColor: colorInput,
      hoverColor: colorInput,
      suffixIcon: icon,
      prefixIcon: leftIcon,
      labelText: labelText,
      labelStyle: TextStyle(
        color: colorInput,
        fontWeight: FontWeight.w700,
        fontSize: 16,
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: colorInput),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: colorInput),
      ),
    );
  }

  static textStyle({Color colorText = Colors.white, double fontSize = 16.0}) {
    return TextStyle(
      color: colorText,
      fontWeight: FontWeight.w500,
      fontSize: fontSize,
    );
  }
}
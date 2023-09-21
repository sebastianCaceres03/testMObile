import 'package:flutter/material.dart';

abstract class ThemeStructure {
  ColorsTheme get colors;
}

class ColorsTheme {
  final Color darkBlue;
  final Color lightBlue;
  final Color white;
  final Color black;

  const ColorsTheme({
    required this.darkBlue,
    required this.lightBlue,
    required this.white,
    required this.black,
  });
}
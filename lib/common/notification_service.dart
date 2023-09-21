import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum TypeSnackBar { alert, success, warning, info, dark }

class NotificationService {
  static GlobalKey<ScaffoldMessengerState> messengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static showSnackBar(String? message, TypeSnackBar type) {
    Color _color;
    switch (type) {
      case TypeSnackBar.alert:
        _color = Color(0xffc0392b);
        break;
      case TypeSnackBar.success:
        _color = Color(0xFF2ecc71);
        break;
      case TypeSnackBar.warning:
        _color = Color(0xFFf1c40f);
        break;
      case TypeSnackBar.info:
        _color = Color.fromARGB(255, 60, 60, 60);
        break;
      case TypeSnackBar.dark:
        _color = Color.fromRGBO(60, 60, 60, 1);
        break;
      default:
        _color = Color(0xffecf0f1);
    }

    final snackbar = SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: _color,
      content: Text(
        message!,
        style: GoogleFonts.roboto(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ),
      ),
    );
    messengerKey.currentState?.showSnackBar(snackbar);
  }

  static showSnackBarWithIcon(String? message, TypeSnackBar type, Widget icon) {
    Color _color;
    switch (type) {
      case TypeSnackBar.alert:
        _color = Color(0xffc0392b);
        break;
      case TypeSnackBar.success:
        _color = Color(0xFF30B36B);
        break;
      case TypeSnackBar.warning:
        _color = Color(0xFFf1c40f);
        break;
      case TypeSnackBar.info:
        _color = Color(0xFF4D5451);
        break;
      case TypeSnackBar.dark:
        _color = Color.fromRGBO(60, 60, 60, 1);
        break;
      default:
        _color = Color(0xffecf0f1);
    }

    final snackbar = SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: _color,
      content: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: icon,
          ),
          Text(
            message!,
            style: GoogleFonts.roboto(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
    messengerKey.currentState!.showSnackBar(snackbar);
  }

  static showBusyIndicator(BuildContext context) {
    final AlertDialog dialog = AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: SizedBox(
        width: 100,
        height: 100,
        child: Center(
          child: Image.asset(
            "assets/images/loading_ball.gif",
            height: 30,
          ),
        ),
      ),
    );
    showDialog(context: context, builder: (_) => dialog);
  }
}

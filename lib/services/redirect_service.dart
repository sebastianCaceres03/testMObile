import 'package:flutter/material.dart';

class RedirectService {
  static goTo(context, page, {Function? function}) async {
    Navigator.push(context, MaterialPageRoute(builder: (ctx) => page))
        .then((value) => {
              function == null ? () {} : function(),
            });
  }

  static replaceAllPages(context, page) async {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => page),
        (Route<dynamic> route) => false);
  }

  static replacePage(context, page) async {
    Route route = MaterialPageRoute(builder: (context) => page);
    Navigator.pushReplacement(context, route);
  }

  static pop(BuildContext context) {
    Navigator.of(context).pop();
  }

  static popMany(BuildContext context, int backreturn) {
    int count = 0;
    Navigator.popUntil(context, (route) {
      return count++ == backreturn;
    });
  }

  static routActuality() {
    Navigator.defaultRouteName;
  }
}
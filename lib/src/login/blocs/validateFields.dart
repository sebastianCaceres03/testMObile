import 'dart:async';

class ValidatorsFields {
  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    bool emailValid =
        RegExp(r"^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$")
            .hasMatch(email.trim());
    if (emailValid) {
      sink.add(email.trim());
    } else {
      sink.addError('Invalid email address');
    }
  });

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length >= 8) {
      sink.add(password);
    } else {
      sink.addError('The password must have more than 8 characters');
    }
  });
}
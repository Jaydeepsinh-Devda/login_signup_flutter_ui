import 'package:test_app1/strings.dart';

class Utility {

  static String? emailValidation(String? value) {
    bool emailReg = RegExp(emailRegExp).hasMatch(value!);
    if (value.isNotEmpty) {
      if (emailReg) {
        return null;
      }
    }
    return 'Enter a valid Email';
  }


  static String? passwordValidation(String? value) {
    bool passReg = RegExp(passwordRegExp).hasMatch(value!);
    if (value.isNotEmpty) {
      if (passReg) {
        return null;
      }
    }
    return "Should contains at least 1 number, 1 capital letter ,1 special symbol and length of 6 to 8 ";
  }

}



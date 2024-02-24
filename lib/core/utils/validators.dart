class Validators {
  static String isPhoneValid(String phone) {
    if (phone.isEmpty) {
      //if phone number is empty then

      return "Phone number can't be an empty entity";
    } else if (phone.length < 11) {
      //if phone number digits less then 11 digits
      return "Phone number must have 11 digits";
    } else {
      if (RegExp(r'^\+?(88)?0?1[3456789][0-9]{8}\b').hasMatch(phone)) {
        //if everything is okay then it will return empty error message
        return "";
      } else {
        //if phone number has not a valid match
        return "Please enter a valid phone number";
      }
    }
  }

  static String isAgeValid(String age) {
    if (age.isEmpty) {
      return "Age can't be an empty entity";
    } else {
      //if age contains only digits then it will return empty error message else otherwise
      if (RegExp(r'^[0-9]*$').hasMatch(age)) {
        return "";
      } else {
        //if age has not a valid match
        return "Please enter a valid age";
      }
    }
  }

  static String isNameValid(String name) {
    if (name.isEmpty) {
      return "Name can't be an empty entity";
    } else {
      if (name.startsWith(RegExp(r'\d'))) {
        //if name start with a digit
        return "Name can't start with digits";
      } else {
        return "";
      }
    }
  }
}

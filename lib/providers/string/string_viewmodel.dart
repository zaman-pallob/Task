import 'package:task/providers/string/string_interface.dart';

class StringViewmodel {
  StringInterface interface;
  StringViewmodel(this.interface);
  String mystring = "";

  void setMystring(String mystring) {
    this.mystring = mystring;
  }

  void toTitleCase(String input) {
    //Splits the sentence into words array

    if (input.isNotEmpty) {
      List<String> words = input.split(' ');

      for (int i = 0; i < words.length; i++) {
        String word = words[i];
        //itarate over each word and convert the first letter to capital and the rest to small letter
        if (word.isNotEmpty) {
          words[i] = word[0].toUpperCase() + word.substring(1).toLowerCase();
        }
      }
      interface.onConvertedToTitleCase(words.join(' '));
    } else {
      interface.onFailed("Can't convert empty string");
    }
  }

  void toLowerCase(String input) {
    if (input.isNotEmpty) {
      interface.onConvertedToLowerCase(input.toLowerCase());
    } else {
      interface.onFailed("Can't convert empty string");
    }
  }

  void toUpperCase(String input) {
    if (input.isNotEmpty) {
      interface.onConvertedToCapitalCase(input.toUpperCase());
    } else {
      interface.onFailed("Can't convert empty string");
    }
  }

  void getFrequency(String input, String target) {
    int counter = 0;
    for (int i = 0; i < input.length; i++) {
      // if the given specific character matches the character in input string then increment counter
      if (input[i] == target) {
        counter++;
      }
    }

    interface.onCountFrequency(target, counter);
  }
}

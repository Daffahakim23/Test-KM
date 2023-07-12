// ignore_for_file: avoid_print, prefer_final_fields, use_build_context_synchronously, file_names, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:suitmedia/Screen/First_Screen.dart';
import 'package:suitmedia/Screen/Second_Screen.dart';
import 'package:suitmedia/Screen/Third_Screen.dart';

class NameProvider with ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController palindromeController = TextEditingController();

  // Name Property
  String _Name = "";
  String get Name => _Name;

  void validateName(value) {
    _Name = value;
    nameController.clear();
    notifyListeners();
  }
  // End Email

  // Name Property
  String _selectedName = "";
  String get selectedName => _selectedName;

  void validateSelectedName(String firstName, String lastName) {
    _selectedName = "$firstName $lastName";
    notifyListeners();
  }

  // Palindrome Property
  String _Palindrome = "";
  String get Palindrome => _Palindrome;

  bool _isPalindrome = false;
  bool get isPalindrome => _isPalindrome;

  void validatePalindrome(String value) {
    String stringToReverse = value.toLowerCase();
    String reversedString = stringToReverse.split('').reversed.join();

    _isPalindrome = (stringToReverse == reversedString);
    palindromeController.clear();

    notifyListeners();
  }

    void navigateToThirdScreen(
    BuildContext context,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const ThirdScreen(title: '',),
      ),
    );
  }

  void navigateToSecondScreen(
    BuildContext context,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const SecondScreen(),
      ),
    );
  }

  void navigateToFirstScreen(
    BuildContext context,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const FirstScreen(),
      ),
    );
  }

  void showdialogPalindrome(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Palindrome Check"),
          content: Text(
            isPalindrome
                ? "The input text is a palindrome!"
                : "The input text is not a palindrome.",
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }
}

import 'package:flutter/material.dart';

class CustomButton {
  final buttonStyle = ButtonStyle(
    textStyle: MaterialStateProperty.all(
      const TextStyle(
        color:Colors.white
      ),
    ),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    ),
    backgroundColor: MaterialStateProperty.all(
      Colors.black,
    ),
  );
}

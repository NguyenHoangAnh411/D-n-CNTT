import 'package:flutter/material.dart';

final ButtonStyle customElevatedButtonStyle = ElevatedButton.styleFrom(
  backgroundColor: const Color(0xFF1c49ff),
  shadowColor: null,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(50),
  ),
  textStyle: TextStyle(
    color: Color(0xFFFFFFFF),
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
  ),
  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
);
final ButtonStyle customEmailButtonStyle = ElevatedButton.styleFrom(
  backgroundColor: const Color(0xFFd0011c),
  shadowColor: null,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(50),
  ),
  textStyle: TextStyle(
    color: Color(0xFFFFFFFF),
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
  ),
  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
);

final ButtonStyle customGoogleButtonStyle = ElevatedButton.styleFrom(
  backgroundColor: const Color(0xFFFFFFFF),
  shadowColor: null,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(50),
  ),
  textStyle: TextStyle(
    color: Color(0xFFFFFFFF),
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
  ),
  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
);

final ButtonStyle customFacebookButtonStyle = ElevatedButton.styleFrom(
  backgroundColor: const Color(0xFF3a5997),
  shadowColor: null,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(50),
  ),
  textStyle: TextStyle(
    color: Color(0xFFFFFFFF),
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
  ),
  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
);

final InputDecoration customTextFieldDecoration = InputDecoration(
  filled: true,
  fillColor: const Color(0xFFD9D9D9),
  hintStyle: TextStyle(
    color: Colors.grey,
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(50),
    borderSide: BorderSide.none,
  ),
  contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
);

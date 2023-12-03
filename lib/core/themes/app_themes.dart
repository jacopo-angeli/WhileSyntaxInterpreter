import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

//PALETTE
const primaryColor = Color.fromRGBO(110, 64, 141, 1);
const secondaryColor = Color.fromRGBO(65, 11, 182, 1);
const hilightColor = Color.fromRGBO(246, 189, 98, 1);

// TEXT
final titleStyle = GoogleFonts.anton(fontSize: 25);
// USAGE INSTRUCTION
final h0 = GoogleFonts.anton(fontSize: 25);
final h1 = GoogleFonts.anton(fontSize: 20);
final h2 = GoogleFonts.anton(fontSize: 17);
final h3 = GoogleFonts.anton(fontSize: 15);
final p = GoogleFonts.anton(fontSize: 13);
final code = GoogleFonts.mPlusCodeLatin(fontSize: 13);

const buttonText = TextStyle(
  fontSize: 20,
  fontStyle: FontStyle.italic,
);
const secondaryButtonText = TextStyle(
  color: Colors.white,
  fontSize: 15,
  fontStyle: FontStyle.italic,
);
const labelStyle = TextStyle(
  fontWeight: FontWeight.w300,
);

//BUTTONS
final elevatedButtonStyle = ElevatedButton.styleFrom(
  surfaceTintColor: Colors.transparent,
  backgroundColor: hilightColor,
  foregroundColor: primaryColor,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(12),
    ),
  ),
  padding: const EdgeInsets.symmetric(
    horizontal: 30,
    vertical: 20,
  ),
);

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextStyle {
  static final headLine900 = GoogleFonts.urbanist(
    fontSize: 48,
    fontWeight: FontWeight.bold,
  );
  static final headLine800 = GoogleFonts.urbanist(
    fontSize: 36,
    fontWeight: FontWeight.w400,
  );
  static final headLine700 = GoogleFonts.urbanist(
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );
  static final headLine600 = GoogleFonts.urbanist(
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );
  static final headLine500 = GoogleFonts.urbanist(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
  static final headLine400 = GoogleFonts.urbanist(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
  static final headLine300black = GoogleFonts.urbanist(
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
  static final headLine300white = GoogleFonts.urbanist(
      fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white);
  static final bodyText100 = GoogleFonts.urbanist(
    fontSize: 12,
  );
  static final ratings =
      GoogleFonts.urbanist(fontSize: 11, fontWeight: FontWeight.bold);
  static final bodyText10 = GoogleFonts.urbanist(
    fontSize: 11,
    color: Colors.grey,
  );
  static final bodyText200 =
      GoogleFonts.urbanist(fontSize: 14, color: Colors.grey);
}

class CustomColors {
  static const Color grey = Color.fromRGBO(243, 243, 243, 1);
  static const Color error = Color.fromRGBO(255, 76, 94, 1);
}

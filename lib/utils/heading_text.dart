import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget getHeadingText(String text) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(8.0, 30.0, 8.0, 8.0),
    child: Text(
      text,
      style: GoogleFonts.poppins(
          fontSize: 35, fontWeight: FontWeight.bold, color: Colors.grey[900]),
    ),
  );
}

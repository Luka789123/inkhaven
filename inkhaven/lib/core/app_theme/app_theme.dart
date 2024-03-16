import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData appThemeDark() => ThemeData(
        colorScheme: const ColorScheme.dark(
            background: Color.fromARGB(255, 12, 12, 12),
            primary: Color.fromARGB(255, 252, 115, 186),
            onPrimaryContainer: Color.fromARGB(255, 240, 153, 198),
            onPrimary: Color.fromARGB(255, 255, 255, 255),
            surface: Color.fromARGB(255, 12, 12, 12),
            onBackground: Color.fromARGB(255, 217, 217, 217)),
        inputDecorationTheme: InputDecorationTheme(
            filled: true,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
            fillColor: const Color.fromRGBO(166, 166, 166, 0.37),
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            labelStyle: GoogleFonts.robotoSerif(
                color: const Color.fromARGB(255, 217, 217, 217), fontSize: 15),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                    color: Color.fromRGBO(166, 166, 166, 0.37))),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                    color: Color.fromRGBO(166, 166, 166, 0.37), width: 0)),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 178, 34, 34),
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    const BorderSide(color: Color.fromARGB(255, 178, 34, 34)))),
        textTheme: TextTheme(
            titleLarge: GoogleFonts.robotoSerif(
                color: const Color.fromARGB(255, 217, 217, 217), fontSize: 30),
            titleMedium: GoogleFonts.robotoSerif(
                color: const Color.fromARGB(255, 217, 217, 217),
                fontSize: 16,
                fontWeight: FontWeight.w500),
            bodyMedium: GoogleFonts.robotoSerif(
                color: const Color.fromARGB(255, 217, 217, 217),
                fontSize: 13,
                fontWeight: FontWeight.w600),
            bodySmall: GoogleFonts.robotoSerif(
                color: const Color.fromARGB(255, 174, 174, 174),
                fontSize: 12,
                fontWeight: FontWeight.w400),
            labelMedium: GoogleFonts.robotoSerif(
                color: const Color.fromARGB(255, 174, 174, 174),
                fontSize: 12,
                fontWeight: FontWeight.w400),
            labelSmall: GoogleFonts.robotoSerif(
                color: const Color.fromARGB(255, 159, 159, 159),
                fontSize: 10,
                fontWeight: FontWeight.w400)),
      );

  static ThemeData appThemeLight() => ThemeData(
        colorScheme: const ColorScheme.dark(
            background: Color.fromARGB(255, 229, 233, 255),
            primary: Color.fromARGB(255, 150, 78, 194),
            onPrimaryContainer: Color.fromARGB(255, 168, 140, 185),
            onPrimary: Color.fromARGB(255, 255, 255, 255),
            surface: Color.fromARGB(255, 229, 233, 255),
            onBackground: Color.fromARGB(255, 29, 29, 29)),
        inputDecorationTheme: InputDecorationTheme(
            filled: true,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
            fillColor: const Color.fromRGBO(186, 166, 166, 0.37),
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            labelStyle: GoogleFonts.robotoSerif(
                color: Color.fromARGB(255, 91, 91, 91), fontSize: 15),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                    color: Color.fromRGBO(186, 166, 166, 0.37), width: 0)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                    color: Color.fromRGBO(186, 166, 166, 0.37), width: 0)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    const BorderSide(color: Color.fromARGB(255, 178, 34, 34))),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    const BorderSide(color: Color.fromARGB(255, 178, 34, 34)))),
        textTheme: TextTheme(
            titleLarge: GoogleFonts.robotoSerif(
                color: const Color.fromARGB(255, 29, 29, 29), fontSize: 30),
            titleMedium: GoogleFonts.robotoSerif(
                color: const Color.fromARGB(255, 29, 29, 29),
                fontSize: 16,
                fontWeight: FontWeight.w500),
            bodyMedium: GoogleFonts.robotoSerif(
                color: const Color.fromARGB(255, 29, 29, 29),
                fontSize: 13,
                fontWeight: FontWeight.w600),
            bodySmall: GoogleFonts.robotoSerif(
                color: const Color.fromARGB(255, 108, 108, 108),
                fontSize: 12,
                fontWeight: FontWeight.w400),
            labelMedium: GoogleFonts.robotoSerif(
                color: const Color.fromARGB(255, 108, 108, 108),
                fontSize: 12,
                fontWeight: FontWeight.w400),
            labelSmall: GoogleFonts.robotoSerif(
                color: const Color.fromARGB(255, 104, 104, 104),
                fontSize: 10,
                fontWeight: FontWeight.w400)),
      );
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'auth/login_screen.dart';
import 'contants/sizes.dart';

void main() {
  runApp(const GlowProject());
}

class GlowProject extends StatelessWidget {
  const GlowProject({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Glow Project',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.black,
          centerTitle: true,
          titleTextStyle:
              TextStyle(fontSize: Sizes.size20, color: Colors.black),
        ),
        primaryColor: const Color(0xff9df4d2),
        textTheme: TextTheme(
          titleLarge: GoogleFonts.abrilFatface(fontSize: Sizes.size48),
        ),
      ),
      home: const LogInScreen(),
    );
  }
}

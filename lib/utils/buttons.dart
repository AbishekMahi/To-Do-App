import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyBtn extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  final Color color;
  MyBtn({
    super.key,
    required this.text,
    required this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      // color: Theme.of(context).primaryColor,
      color: color,
      child: Text(
        text,
        style: GoogleFonts.poppins(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400),
      ),
    );
  }
}

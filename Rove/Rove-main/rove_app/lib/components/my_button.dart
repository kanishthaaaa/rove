import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String myButtonText;
  final Color myButtonColor;
  const MyButton(
      {super.key,
      required this.myButtonColor,
      required this.onTap,
      required this.myButtonText});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.
        all(18),
        height: 65,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: myButtonColor,
          border: Border.all(
            width: 1,
            color:Colors.grey,
          ),
        ),
        child: Center(
          child: Text(
            myButtonText,
            style: GoogleFonts.poppins(fontSize: 20),
          ),
        ),
      ),
    );
  }
}

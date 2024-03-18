import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class WelcomeScreenModel extends StatelessWidget{
  final String headingText;
  final String descriptionText;
  final String myImagePath;
  
  const WelcomeScreenModel({super.key,
    required this.myImagePath,
    required this.headingText,
    required this.descriptionText,
    
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(myImagePath,
              height: 250,
              ),
              const SizedBox(
                height: 50,),
              Text(headingText,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),),
              const SizedBox(
                height: 25,
              ),
              Text(descriptionText,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.grey[600],
              ),),
              const SizedBox(
                height: 40,
              ),
              
            ],
                  ),
          ),
        ],
      );
 
  }
}
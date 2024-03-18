import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rove_app/components/my_button.dart';
import 'package:rove_app/screens/auth_page.dart';
import 'package:rove_app/screens/welcome_screen2.dart';

class WelcomeScreen1 extends StatelessWidget {
  const WelcomeScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'lib/images/welcome_screen_image.png',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          Positioned(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 480,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                ),
                Text(
                  'Welcome to',
                  style: GoogleFonts.urbanist(
                    fontSize: 50,
                    letterSpacing: 2,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Rove',
                  style: GoogleFonts.urbanist(
                    color: Colors.white,
                    letterSpacing: 3,
                    fontWeight: FontWeight.bold,
                    fontSize: 65,
                  ),
                ),
                Text(
                  'We make your daily travel easy\nwith Rove where you can track\nyour daily rides, on your finger tips.',
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.urbanist(
                    fontSize: 20,
                    letterSpacing: 1,
                    wordSpacing: 1,
                    color: Colors.grey[300],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                MyButton(
                    myButtonColor: Colors.grey,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const WelcomeScreen2()));
                    },
                    myButtonText: 'Continue')
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:rove_app/components/my_button.dart';
import 'package:rove_app/components/welcomescreen_model.dart';
import 'package:rove_app/screens/auth_page.dart';
import 'package:rove_app/screens/entering_credentials.dart';
import 'package:rove_app/screens/traveller_loginpage.dart';

class WelcomeScreen3 extends StatelessWidget {
  const WelcomeScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const WelcomeScreenModel(
                      myImagePath: 'lib/images/welcome_screen3_image.png',
                      headingText: 'No more physical Bus Pass required',
                      descriptionText:
                          'Now you dont\' need to carry your physical pass as we have e-pass'),
                  const SizedBox(
                    height: 125,
                  ),
                  MyButton(
                      myButtonColor: Colors.grey,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AuthPage(),
                          ),
                        );
                      },
                      myButtonText: 'Continue')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

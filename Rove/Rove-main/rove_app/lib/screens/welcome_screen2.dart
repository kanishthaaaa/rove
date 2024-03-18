import 'package:flutter/material.dart';
import 'package:rove_app/components/my_button.dart';
import 'package:rove_app/components/welcomescreen_model.dart';
import 'package:rove_app/screens/auth_page.dart';
import 'package:rove_app/screens/entering_credentials.dart';
import 'package:rove_app/screens/traveller_loginpage.dart';
import 'package:rove_app/screens/welcome_screen3.dart';

class WelcomeScreen2 extends StatelessWidget {
  const WelcomeScreen2({super.key});
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
                    myImagePath: 'lib/images/welcome_screen2_map_image.jfif',
                    headingText: 'Spot your bus like never before',
                    descriptionText:
                        'We got you covered spotting your bus accurately over the map',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  MyButton(
                      myButtonColor: const Color.fromARGB(255, 227, 225, 225),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AuthPage(),
                          ),
                        );
                      },
                      myButtonText: 'Skip'),
                  const SizedBox(
                    height: 15,
                  ),
                  MyButton(
                      myButtonColor: Colors.grey,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const WelcomeScreen3()));
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

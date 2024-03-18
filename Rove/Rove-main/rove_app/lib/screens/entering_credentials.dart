import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rove_app/components/my_button.dart';
import 'package:rove_app/components/my_textfield.dart';
import 'package:rove_app/screens/traveller_loginpage.dart';

class EnteringCredentialPage extends StatefulWidget {
  EnteringCredentialPage({
    super.key,
  });

  @override
  State<EnteringCredentialPage> createState() => _EnteringCredentialPageState();
}

class _EnteringCredentialPageState extends State<EnteringCredentialPage> {
  //text editing controller
  final emailController = TextEditingController();

  //final phoneNumberController = TextEditingController();

  // @override
  // void dispose() {
  //   _emailController.dispose();
  //   super.dispose();
  // }

  //reset password here (only resetting with email)
  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Enter',
                  style: GoogleFonts.poppins(
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Your Credentials',
                  style: GoogleFonts.poppins(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(
                  height: 350,
                ),
                SizedBox(
                  height: 90,
                ),
                MyTextField(
                    controller: emailController,
                    hintText: 'Enter your ID',
                    obscureText: false),
                // SizedBox(
                //   height: 15,
                // ),
                // MyTextField(
                //     controller: phoneNumberController,
                //     hintText: 'Phone Number',
                //     obscureText: false),
                SizedBox(
                  height: 15,
                ),
                MyButton(
                    myButtonColor: Colors.grey,
                    onTap: passwordReset,
                    myButtonText: 'Continue'),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TravellerLoginPage()));
                  },
                  child: Center(
                    child: Text(
                      'Go back to login',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: Color.fromARGB(255, 48, 142, 189),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

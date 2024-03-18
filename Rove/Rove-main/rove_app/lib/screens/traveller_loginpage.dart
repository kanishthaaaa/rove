import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rove_app/components/my_button.dart';
import 'package:rove_app/components/my_textfield.dart';
import 'package:rove_app/screens/auth_page.dart';
import 'package:rove_app/screens/entering_credentials.dart';
import 'package:rove_app/screens/home_page.dart';

class TravellerLoginPage extends StatefulWidget {
  TravellerLoginPage({super.key});

  @override
  State<TravellerLoginPage> createState() => _TravellerLoginPageState();
}

class _TravellerLoginPageState extends State<TravellerLoginPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  //sign user in method
  void signUserIn() async {
    //loading circle
    showDialog(
        context: context,
        builder: (context) {
          return Center(child: const CircularProgressIndicator());
        });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      //popping out the circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      //popping out the circle
      Navigator.pop(context);
      //wrong email
      if (e.code == 'user-not-found') {
        //showing error to user
        wrongEmailMessage();
        //print('User not found');
        //wrong password
      } else if (e.code == 'wrong-password') {
        //showing error to user
        wrongPasswordMessage();
        //print('wrong password');
      }
      Navigator.pop(context);
    }
    Navigator.pop(context);
  }

  //wrong email meassage popup
  void wrongEmailMessage() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text('Incorrect Email'),
          );
        });
  }

  //wrong password message popup
  void wrongPasswordMessage() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text('Incorrect Password'),
          );
        });
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
                  'Rove',
                  style: GoogleFonts.poppins(
                    fontSize: 45,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Welcomes You',
                  style: GoogleFonts.poppins(
                    fontSize: 36,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Image(
                  height: 200,
                  image: AssetImage(
                    'lib/images/loginPageImage.png',
                  ),
                ),
                SizedBox(
                  height: 90,
                ),
                MyTextField(
                    controller: emailController,
                    hintText: 'Username',
                    obscureText: false),
                SizedBox(
                  height: 15,
                ),
                MyTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true),
                SizedBox(
                  height: 15,
                ),
                MyButton(
                    myButtonColor: Colors.grey,
                    onTap: signUserIn,
                    myButtonText: 'Continue'),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    EnteringCredentialPage()));
                      },
                      child: Text(
                        'Reset Here',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          color: Color.fromARGB(255, 48, 142, 189),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

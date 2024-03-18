import 'dart:collection';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rove_app/screens/map_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  //sign user out
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: signUserOut, icon: Icon(Icons.logout)),
        ],
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 41, 41, 41),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15)),
            ),
            height: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(
                    'lib/images/Kanishthac.jpeg',
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hey there,',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                    Text(
                      'Kanishtha👋',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 30,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.notifications_active,
                          color: Colors.grey[400],
                          size: 35,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.settings,
                          color: Colors.grey[400],
                          size: 35,
                        ),
                      ],
                    ),
                    Icon(
                      Icons.credit_card,
                      color: Colors.grey[400],
                      size: 35,
                    )
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Today\'s Ride',
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 241, 247, 247),
                      border: Border.all(width: 1.5),
                      borderRadius: BorderRadius.circular(15)),
                  height: 210,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.circle),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  'UCER',
                                  style: GoogleFonts.poppins(
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              'R-2',
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.circle),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  'Shantipuram',
                                  style: GoogleFonts.poppins(
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              'ETA - 07:50 a.m.',
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          thickness: .5,
                          color: Colors.black,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Bus will be there in',
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  color: Colors.grey.shade700,
                                )),
                            Text('20 mins',
                                style: GoogleFonts.poppins(
                                    fontSize: 18, color: Colors.black))
                          ],
                        ),
                        Divider(
                          thickness: .8,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MapViewPage()));
                  },
                  child: Container(
                    height: 300,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1.5),
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: AssetImage('lib/images/map.png'),
                            fit: BoxFit.fill)),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

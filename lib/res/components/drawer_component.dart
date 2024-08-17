import 'package:final_project_internncraft/utils/general_utils.dart';
import 'package:final_project_internncraft/utils/routes/routes_name.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerComponent extends StatelessWidget {
  const DrawerComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final auth = FirebaseAuth.instance;
    return ListView(
      // padding: const EdgeInsets.all(20),
      children: [
        Container(
          height: height * .12,
          width: width * 1,
          color: Colors.black, // Header background color (orange)
          // padding: const EdgeInsets.all(16.0), // Padding for text
          child: Center(
            child: Text(
              'DigiCraft',
              style: GoogleFonts.lobster(
                textStyle: const TextStyle(
                    color: Colors.white, fontSize: 35, letterSpacing: 2),
              ),
            ),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.house_siding_outlined),
          title: const Text(
            'Home',
            style: TextStyle(
                // Text color (white)
                fontSize: 20.0, // Text size
                fontWeight: FontWeight.bold,
                letterSpacing: 2 // Text weight (bold)
                ),
          ),
          onTap: () {
            Navigator.pushNamed(context, RoutesName.homeView);
          },
        ),
        ListTile(
          leading: const Icon(Icons.person_4_outlined),
          title: const Text(
            'My Profile',
            style: TextStyle(
                // Text color (white)
                fontSize: 20.0, // Text size
                fontWeight: FontWeight.bold,
                letterSpacing: 2 // Text weight (bold)
                ),
          ),
          onTap: () {
            Navigator.pushNamed(context, RoutesName.userProfileView);
          },
        ),
        ListTile(
          leading: const Icon(Icons.work_outline),
          title: const Text(
            'Jobs',
            style: TextStyle(
                // Text color (white)
                fontSize: 20.0, // Text size
                fontWeight: FontWeight.bold,
                letterSpacing: 2 // Text weight (bold)
                ),
          ),
          onTap: () {
            Navigator.pushNamed(context, RoutesName.jobsView);
          },
        ),
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text(
            'LogOut',
            style: TextStyle(
                // Text color (white)
                fontSize: 20.0, // Text size
                fontWeight: FontWeight.bold,
                letterSpacing: 2 // Text weight (bold)
                ),
          ),
          onTap: () {
            auth.signOut().then((_) {
              Navigator.pushNamed(context, RoutesName.loginView);
            }).catchError((error) {
              GeneralUtils.snackBar(error.toString(), context);
            });
          },
        ),
      ],
    );
  }
}

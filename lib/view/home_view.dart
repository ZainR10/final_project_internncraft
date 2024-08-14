// ignore_for_file: unused_local_variable

import 'package:final_project_internncraft/utils/general_utils.dart';
import 'package:final_project_internncraft/utils/routes/routes_name.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    final auth = FirebaseAuth.instance;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('home'),
        actions: [
          InkWell(
            onTap: () {
              auth.signOut().then((value) {
                Navigator.pushNamed(context, RoutesName.loginView);
              }).onError((error, stackTrace) {
                GeneralUtils.snackBar(error.toString(), context);
              });
            },
            child: const Icon(
              Icons.logout,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }
}

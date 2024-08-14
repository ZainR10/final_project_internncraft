import 'package:final_project_internncraft/utils/general_utils.dart';
import 'package:final_project_internncraft/utils/routes/routes_name.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProfileView extends StatefulWidget {
  final String name;
  final String email;
  final String photoUrl;
  const UserProfileView({
    required this.name,
    required this.email,
    required this.photoUrl,
    super.key,
  });

  @override
  State<UserProfileView> createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    final auth = FirebaseAuth.instance;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Home'),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome, ${widget.name}!'),
            Text(widget.email),
            widget.photoUrl.isNotEmpty
                ? Image.network(widget.photoUrl)
                : const Icon(Icons.account_circle, size: 100),
          ],
        ),
      ),
    );
  }
}

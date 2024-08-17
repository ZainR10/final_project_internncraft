import 'package:final_project_internncraft/view_models/auth_models/splash_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashViewLogic splashViewLogic = SplashViewLogic();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashViewLogic.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigoAccent,
      body: Center(
        child: Text(
          'DigiCraft',
          style: GoogleFonts.lobster(
            textStyle: const TextStyle(
                color: Colors.white, fontSize: 35, letterSpacing: 2),
          ),
        ),
      ),
    );
  }
}

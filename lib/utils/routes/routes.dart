import 'package:final_project_internncraft/utils/routes/routes_name.dart';
import 'package:final_project_internncraft/view/enter_details_view.dart';
import 'package:final_project_internncraft/view/enter_projects_view.dart';
import 'package:final_project_internncraft/view/login_view.dart';
import 'package:final_project_internncraft/view/sign_up_view.dart';
import 'package:final_project_internncraft/view/skills_view.dart';
import 'package:final_project_internncraft/view/splash_view.dart';
import 'package:final_project_internncraft/view/user_profile_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splashView:
        {
          return MaterialPageRoute(
            builder: (BuildContext context) => const SplashView(),
          );
        }
      case RoutesName.skillsView:
        {
          return MaterialPageRoute(
            builder: (BuildContext context) => const SkillsView(),
          );
        }
      case RoutesName.enterDetailsView:
        {
          return MaterialPageRoute(
            builder: (BuildContext context) => const EnterDetailsView(),
          );
        }
      case RoutesName.enterProjectsView:
        {
          return MaterialPageRoute(
            builder: (BuildContext context) => const EnterProjectsView(),
          );
        }
      case RoutesName.loginView:
        {
          return MaterialPageRoute(
            builder: (BuildContext context) => const LoginView(),
          );
        }
      case RoutesName.signUpView:
        {
          return MaterialPageRoute(
            builder: (BuildContext context) => const SignUpView(),
          );
        }
      case RoutesName.userProfileView:
        // {
        //   final args = settings.arguments as Map<String, String>;
        //   final name = args['name'] ?? '';
        //   final email = args['email'] ?? '';
        //   final photoUrl = args['photoUrl'] ?? '';
        return MaterialPageRoute(
          builder: (BuildContext context) => const UserProfileView(
              // name: name,
              // email: email,
              // photoUrl: photoUrl,
              ),
        );
    }

    return _errorRoute();
  }
}

Route<dynamic> _errorRoute() {
  return MaterialPageRoute(builder: (_) {
    return const Scaffold(
      body: Center(
        child: Text('No Routes Defined'),
      ),
    );
  });
}

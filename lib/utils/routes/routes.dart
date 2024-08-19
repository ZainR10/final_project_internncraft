import 'package:final_project_internncraft/utils/routes/routes_name.dart';
import 'package:final_project_internncraft/view/enter_details_view.dart';
import 'package:final_project_internncraft/view/enter_projects_view.dart';
import 'package:final_project_internncraft/view/home_view.dart';
import 'package:final_project_internncraft/view/job_desc_view.dart';
import 'package:final_project_internncraft/view/jobs_view.dart';
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
      case RoutesName.jobDescView:
        // Retrieve arguments passed to NewsDetail screen
        final args = settings.arguments;
        if (args is JobDescArguments) {
          return MaterialPageRoute(
            builder: (context) => JobDescView(
              jobRole: args.jobRole,
              jobDesc: args.jobDesc,
            ),
          );
        }
      case RoutesName.homeView:
        {
          return MaterialPageRoute(
            builder: (BuildContext context) => const HomeView(),
          );
        }
      case RoutesName.jobsView:
        {
          return MaterialPageRoute(
            builder: (BuildContext context) => const JobsView(),
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

class JobDescArguments {
  final String jobRole;
  final String jobDesc;

  JobDescArguments({
    required this.jobDesc,
    required this.jobRole,
  });
}

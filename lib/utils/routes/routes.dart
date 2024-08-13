import 'package:final_project_internncraft/utils/routes/routes_name.dart';
import 'package:final_project_internncraft/view/home_view.dart';
import 'package:final_project_internncraft/view/login_view.dart';
import 'package:final_project_internncraft/view/sign_up_view.dart';
import 'package:final_project_internncraft/view/splash_view.dart';
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
      case RoutesName.homeView:
        {
          return MaterialPageRoute(
            builder: (BuildContext context) => const HomeView(),
          );
        }

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return const Scaffold(
        body: Center(
          child: Text('No Routes Defined'),
        ),
      );
    });
  }
}

import 'package:final_project_internncraft/firebase_options.dart';

import 'package:final_project_internncraft/utils/routes/routes.dart';
import 'package:final_project_internncraft/utils/routes/routes_name.dart';
import 'package:final_project_internncraft/view_models/auth_models/goolge_sign_up.dart';
import 'package:final_project_internncraft/view_models/auth_models/login_model.dart';
import 'package:final_project_internncraft/view_models/auth_models/sign_up_model.dart';
import 'package:final_project_internncraft/view_models/user_details_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => LoginViewModel(),
          ),
          ChangeNotifierProvider(
            create: (_) => SignUpViewModel(),
          ),
          ChangeNotifierProvider(
            create: (_) => AuthServiceModel(),
          ),
          ChangeNotifierProvider(
            create: (_) => UserDetails(
              name: '',
              email: '',
              profession: '',
              location: '',
            ),
          ),
        ],
        child: const MaterialApp(
          title: 'Flutter Demo',
          // theme: appThemeData,
          debugShowCheckedModeBanner: false,
          initialRoute: RoutesName.userProfileView,
          onGenerateRoute: Routes.generateRoute,
          // home: const SplashView(),
        ));
  }
}

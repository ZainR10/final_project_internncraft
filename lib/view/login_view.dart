import 'package:final_project_internncraft/res/components/divider_row.dart';
import 'package:final_project_internncraft/res/components/simple_button.dart';
import 'package:final_project_internncraft/utils/general_utils.dart';
import 'package:final_project_internncraft/utils/routes/routes_name.dart';
import 'package:final_project_internncraft/view_models/auth_models/goolge_sign_up.dart';
import 'package:final_project_internncraft/view_models/auth_models/login_model.dart';
import 'package:final_project_internncraft/view_models/auth_models/validation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formkey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height * .02,
              ),
              const Text(
                'Welcome Back :)',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: height * .02,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Form(
                        key: _formkey,
                        child: Column(
                          children: [
                            TextFormField(
                              focusNode: emailFocusNode,
                              controller: emailController,
                              validator: FormValidation.validateEmail,
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.alternate_email),
                                border: OutlineInputBorder(),
                                hintText: 'Enter your Email',
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              onFieldSubmitted: (value) {
                                GeneralUtils.fieldFocusChange(
                                    context, emailFocusNode, passwordFocusNode);
                              },
                            ),
                            SizedBox(
                              height: height * .03,
                            ),
                            TextFormField(
                              focusNode: passwordFocusNode,
                              controller: passwordController,
                              validator: FormValidation.validatePassword,
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.lock_person_rounded),
                                border: OutlineInputBorder(),
                                hintText: 'Enter your Password',
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
              ),
              Consumer<LoginViewModel>(
                builder: (context, value, child) {
                  return SimpleButton(
                    textcolor: Colors.white,
                    textsize: 20,
                    buttoncolor: Colors.black,
                    height: height * .08,
                    width: width * 1,
                    title: 'Log in',
                    loading: value.loginLoading,
                    onPress: () {
                      if (_formkey.currentState!.validate()) {
                        value.login(
                          email: emailController.text.toString(),
                          password: passwordController.text.toString(),
                          context: context,
                        );
                      }
                    },
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RoutesName.signUpView);
                      },
                      child: const Text(
                        'Sign up',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                            fontSize: 20),
                      ))
                ],
              ),
              const DividerRow(),
              Consumer<AuthServiceModel>(builder: (context, value, child) {
                return SimpleButton(
                  buttonIcon: const FaIcon(
                    FontAwesomeIcons.google,
                    color: Colors.white,
                    size: 25,
                  ),
                  height: height * .08,
                  width: width * 1,
                  textcolor: Colors.white,
                  textsize: 20,
                  title: 'Log in with google',
                  buttoncolor: Colors.black,
                  loading: value.isLoading,
                  onPress: () {
                    value.signInWithGoogle(context);
                  },
                );
              })
            ]),
      ),
    ));
  }
}

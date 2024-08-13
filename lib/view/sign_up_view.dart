import 'package:final_project_internncraft/res/components/round_button.dart';
import 'package:final_project_internncraft/utils/general_utils.dart';
import 'package:final_project_internncraft/utils/routes/routes_name.dart';
import 'package:final_project_internncraft/view_models/auth_models/sign_up_model.dart';
import 'package:final_project_internncraft/view_models/auth_models/validation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _formkey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('sign up screen'),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Create Account',
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: height * .03,
                    ),
                    Column(
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
                                    GeneralUtils.fieldFocusChange(context,
                                        emailFocusNode, passwordFocusNode);
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
                    Consumer<SignUpViewModel>(
                      builder: (context, value, child) {
                        return RoundButton(
                          color: Colors.indigoAccent.shade100.withOpacity(0.9),
                          height: height * .08,
                          width: width * .28,
                          title: 'Sign up',
                          loading: value.signUpLoading,
                          onPress: () {
                            if (_formkey.currentState!.validate()) {
                              value.signUp(
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
                          "Already have an account?",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 20),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, RoutesName.loginView);
                            },
                            child: const Text(
                              'Log in',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.underline,
                                  fontSize: 20),
                            ))
                      ],
                    ),
                  ]),
            ),
          ),
        ));
  }
}

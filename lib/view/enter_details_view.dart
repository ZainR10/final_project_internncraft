import 'package:flutter/material.dart';
import 'package:final_project_internncraft/res/components/simple_button.dart';
import 'package:final_project_internncraft/utils/general_utils.dart';
import 'package:final_project_internncraft/view_models/auth_models/validation.dart';

class EnterDetailsView extends StatefulWidget {
  const EnterDetailsView({super.key});

  @override
  State<EnterDetailsView> createState() => _EnterDetailsViewState();
}

class _EnterDetailsViewState extends State<EnterDetailsView> {
  final _formdetailskey = GlobalKey<FormState>();
  final emailDetailsController = TextEditingController();
  final nameDetailsController = TextEditingController();
  final professionDetailsController = TextEditingController();
  final locationDetailsController = TextEditingController();

  FocusNode emaildetailsFocusNode = FocusNode();
  FocusNode namedetailsFocusNode = FocusNode();
  FocusNode professiondetailsFocusNode = FocusNode();
  FocusNode locationdetailsFocusNode = FocusNode();

  @override
  void dispose() {
    emailDetailsController.dispose();
    nameDetailsController.dispose();
    professionDetailsController.dispose();
    locationDetailsController.dispose();

    emaildetailsFocusNode.dispose();
    namedetailsFocusNode.dispose();
    professiondetailsFocusNode.dispose();
    locationdetailsFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(10),
            // height: height * 0.60,
            width: width * 1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.orange.shade100.withOpacity(0.5),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Form(
                  key: _formdetailskey,
                  child: Column(
                    children: [
                      const Text(
                        'Enter Your Details:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 24,
                          letterSpacing: 2,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      SizedBox(height: height * 0.02),
                      // Name
                      TextFormField(
                        focusNode: namedetailsFocusNode,
                        controller: nameDetailsController,
                        validator: (value) => value?.isEmpty == true
                            ? 'Please enter your name'
                            : null,
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(),
                          hintText: 'Enter your Name',
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        onFieldSubmitted: (value) {
                          GeneralUtils.fieldFocusChange(context,
                              namedetailsFocusNode, emaildetailsFocusNode);
                        },
                      ),
                      SizedBox(height: height * 0.02),
                      // Email
                      TextFormField(
                        focusNode: emaildetailsFocusNode,
                        controller: emailDetailsController,
                        validator: FormValidation.validateEmail,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(),
                          hintText: 'Enter your Email',
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        onFieldSubmitted: (value) {
                          GeneralUtils.fieldFocusChange(
                              context,
                              emaildetailsFocusNode,
                              professiondetailsFocusNode);
                        },
                      ),
                      SizedBox(height: height * 0.02),
                      // Profession
                      TextFormField(
                        focusNode: professiondetailsFocusNode,
                        controller: professionDetailsController,
                        validator: (value) => value?.isEmpty == true
                            ? 'Please enter your profession'
                            : null,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.work),
                          border: OutlineInputBorder(),
                          hintText: 'Enter your Profession',
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        onFieldSubmitted: (value) {
                          GeneralUtils.fieldFocusChange(
                              context,
                              professiondetailsFocusNode,
                              locationdetailsFocusNode);
                        },
                      ),
                      SizedBox(height: height * 0.02),
                      // Location
                      TextFormField(
                        focusNode: locationdetailsFocusNode,
                        controller: locationDetailsController,
                        validator: (value) => value?.isEmpty == true
                            ? 'Please enter your location'
                            : null,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.location_on),
                          border: OutlineInputBorder(),
                          hintText: 'Enter your Current Location',
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // const Spacer(),
                SimpleButton(
                  buttoncolor: Colors.greenAccent,
                  textcolor: Colors.black,
                  textsize: 20,
                  width: width * 0.9,
                  height: height * 0.06,
                  title: 'Save',
                  onPress: () {
                    if (_formdetailskey.currentState?.validate() ?? false) {
                      // Handle save action
                    }
                  },
                ),
                // SizedBox(
                //   height: height * .02,
                // ),
                SimpleButton(
                    buttoncolor: Colors.redAccent,
                    textcolor: Colors.black,
                    textsize: 20,
                    width: width * 0.9,
                    height: height * 0.06,
                    title: 'Cancel',
                    onPress: () {
                      Navigator.pop(context);
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

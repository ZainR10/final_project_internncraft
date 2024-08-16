import 'package:final_project_internncraft/res/components/image_container.dart';
import 'package:final_project_internncraft/res/components/round_button.dart';
import 'package:final_project_internncraft/utils/general_utils.dart';
import 'package:final_project_internncraft/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class UserProfileView extends StatefulWidget {
  const UserProfileView({super.key});

  @override
  State<UserProfileView> createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
  List<Map<String, dynamic>> projects = [];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final auth = FirebaseAuth.instance;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Profile'),
        backgroundColor: Colors.amber,
        actions: [
          InkWell(
            onTap: () {
              auth.signOut().then((_) {
                Navigator.pushNamed(context, RoutesName.loginView);
              }).catchError((error) {
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
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ImageContainer(),
                  SizedBox(width: width * .02),
                  const Expanded(
                    child: Text(
                      'Zain Patni',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 26,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * .02),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.orange.shade100.withOpacity(.5),
                ),
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, RoutesName.enterDetailsView);
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Edit',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 16,
                              letterSpacing: 2,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          Icon(Icons.edit_outlined),
                        ],
                      ),
                    ),
                    SizedBox(height: height * .01),
                    CustomCaintainer(
                      displayIcon: Icons.email_outlined,
                      color: Colors.transparent,
                      width: width * 1,
                      textcolor: Colors.black,
                      textsize: 17,
                      title: 'M.zain_rehman@gmail.com',
                    ),
                    SizedBox(height: height * .01),
                    CustomCaintainer(
                      displayIcon: Icons.add_chart,
                      color: Colors.transparent,
                      width: width * 1,
                      textcolor: Colors.black,
                      textsize: 17,
                      title: 'Profession: Software Engineer',
                    ),
                    SizedBox(height: height * .01),
                    CustomCaintainer(
                      displayIcon: Icons.person_pin_circle_outlined,
                      color: Colors.transparent,
                      width: width * 1,
                      textcolor: Colors.black,
                      textsize: 17,
                      title: 'Karachi, Pakistan',
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * .02),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.orange.shade100.withOpacity(.5),
                ),
                padding: const EdgeInsets.all(10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () async {
                          final result = await Navigator.pushNamed(
                            context,
                            RoutesName.enterProjectsView,
                          );
                          if (result != null) {
                            setState(() {
                              projects.add(result as Map<String, dynamic>);
                            });
                          }
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Edit',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 16,
                                letterSpacing: 2,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            Icon(Icons.edit_outlined),
                          ],
                        ),
                      ),
                      SizedBox(height: height * .01),
                      const CustomCaintainer(
                        displayIcon: Icons.workspace_premium_sharp,
                        textcolor: Colors.black,
                        textsize: 25,
                        title: 'Your Projects',
                      ),
                      SizedBox(height: height * .02),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: projects.length,
                          itemBuilder: (context, index) {
                            final project = projects[index];
                            return Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.grey.shade400,
                                  width: 1,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade300,
                                    offset: const Offset(0, 2),
                                    blurRadius: 4,
                                  ),
                                ],
                              ),
                              child: Row(children: [
                                Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(8),
                                    image: project['image'] != null
                                        ? DecorationImage(
                                            image: FileImage(project['image']),
                                            fit: BoxFit.cover,
                                          )
                                        : null,
                                    border: Border.all(
                                      color: Colors.grey.shade400,
                                      width: 2,
                                    ),
                                  ),
                                  child: project['image'] == null
                                      ? Center(
                                          child: Icon(
                                            Icons.image,
                                            size: 50,
                                            color: Colors.grey.shade600,
                                          ),
                                        )
                                      : null,
                                ),
                                SizedBox(width: width * .03),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        project['description'],
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(height: height * .01),
                                      Text(
                                        project['link'],
                                        style: const TextStyle(
                                          color: Colors.blue,
                                          fontSize: 14,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ]),
                            );
                          })
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

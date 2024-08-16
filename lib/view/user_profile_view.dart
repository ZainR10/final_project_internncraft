import 'package:final_project_internncraft/res/components/else_container.dart';
import 'package:final_project_internncraft/res/components/image_container.dart';
import 'package:final_project_internncraft/res/components/listview_projects.dart';
import 'package:final_project_internncraft/res/components/round_button.dart';
import 'package:final_project_internncraft/res/components/skills_listview.dart';
import 'package:final_project_internncraft/utils/general_utils.dart';
import 'package:final_project_internncraft/utils/routes/routes_name.dart';
import 'package:final_project_internncraft/view_models/user_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class UserProfileView extends StatefulWidget {
  const UserProfileView({super.key});

  @override
  State<UserProfileView> createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
  List<Map<String, dynamic>> projects = [];
  final List<Map<String, dynamic>> skills = [];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final auth = FirebaseAuth.instance;
    final userDetails = Provider.of<UserDetails>(context);

    bool hasDetails = userDetails.name.isNotEmpty ||
        userDetails.email.isNotEmpty ||
        userDetails.profession.isNotEmpty ||
        userDetails.location.isNotEmpty;

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
      body: hasDetails
          ? Padding(
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        // crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const ImageContainer(),
                          SizedBox(width: width * .02),
                          Expanded(
                            child: Text(
                              // 'Zain Patni',
                              ' ${userDetails.name}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 26,
                                  letterSpacing: 1),
                            ),
                          ),
                        ],
                      ),

                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          // color: Colors.orange.shade100.withOpacity(.5)
                        ),
                        // color: Colors.transparent),
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
                                mainAxisAlignment: MainAxisAlignment.start,
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
                                color: Colors.orange.shade100.withOpacity(.5),
                                width: width * 1,
                                textcolor: Colors.black,
                                textsize: 17,
                                title: ' ${userDetails.email}'),
                            SizedBox(height: height * .01),
                            CustomCaintainer(
                              displayIcon: Icons.add_chart,
                              color: Colors.orange.shade100.withOpacity(.5),
                              width: width * 1,
                              textcolor: Colors.black,
                              textsize: 17,
                              title: ' ${userDetails.profession}',
                            ),
                            SizedBox(height: height * .01),
                            CustomCaintainer(
                                displayIcon: Icons.person_pin_circle_outlined,
                                color: Colors.orange.shade100.withOpacity(.5),
                                width: width * 1,
                                textcolor: Colors.black,
                                textsize: 17,
                                title: ' ${userDetails.location}'),
                          ],
                        ),
                      ),
                      const Divider(
                        color: Colors.black,
                        height: 9,
                        thickness: 2,
                      ),
                      // SizedBox(height: height * .01),
                      //info container
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () async {
                                  final result = await Navigator.pushNamed(
                                      context, RoutesName.skillsView);
                                  if (result != null &&
                                      result is Map<String, dynamic>) {
                                    setState(() {
                                      skills.add(result);
                                    });
                                  }
                                },

                                //SKILLS SECTION********
                                child: const Row(
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  // mainAxisAlignment: MainAxisAlignment.start,
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

                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  // color: Colors.orange.shade100.withOpacity(.5)
                                ),
                                child: CustomCaintainer(
                                  color: Colors.orange.shade100.withOpacity(.5),
                                  displayIcon: Icons.stars,
                                  textcolor: Colors.black,
                                  textsize: 25,
                                  title: 'Skills',
                                ),
                              ),
                              SizedBox(height: height * .01),

                              SkillsListview(skills: skills),

                              SizedBox(height: height * .01),
                              const Divider(
                                color: Colors.black,
                                height: 9,
                                thickness: 2,
                              ),
                              //PROJECTS SECTION********
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  // color: Colors.orange.shade100.withOpacity(.5),
                                ),
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          final result =
                                              await Navigator.pushNamed(
                                            context,
                                            RoutesName.enterProjectsView,
                                          );
                                          if (result != null && mounted) {
                                            setState(() {
                                              projects.add(result
                                                  as Map<String, dynamic>);
                                            });
                                          }
                                        },
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Edit',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                fontSize: 16,
                                                letterSpacing: 2,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                            ),
                                            Icon(Icons.edit_outlined),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: height * .01),
                                      CustomCaintainer(
                                        width: width * 1,
                                        color: Colors.orange.shade100
                                            .withOpacity(.5),
                                        displayIcon:
                                            Icons.workspace_premium_sharp,
                                        textcolor: Colors.black,
                                        textsize: 25,
                                        title: 'Your Projects',
                                      ),
                                      SizedBox(height: height * .02),
                                      ProjectsListView(projects: projects)
                                    ]),
                              ),
                            ]),
                      ),
                    ]),
              ),
            )
          : const ElseContainer(),
    );
  }
}

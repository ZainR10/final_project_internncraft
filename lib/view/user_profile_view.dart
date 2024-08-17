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
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('My Profile'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.book),
              title: const Text('My Course'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.workspace_premium),
              title: const Text('Go Premium'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.video_label),
              title: const Text('Saved Videos'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Edit Profile'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('LogOut'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildUserDetailsSection(context, userDetails, width, height),
              const Divider(color: Colors.black, height: 20, thickness: 2),
              _buildSkillsSection(context, width, height),
              const Divider(color: Colors.black, height: 20, thickness: 2),
              _buildProjectsSection(context, width, height),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserDetailsSection(BuildContext context, UserDetails userDetails,
      double width, double height) {
    ///personel details section
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ImageContainer(),
        SizedBox(height: height * .02),
        userDetails.name.isNotEmpty ||
                userDetails.email.isNotEmpty ||
                userDetails.profession.isNotEmpty ||
                userDetails.location.isNotEmpty

            ///personel details section

            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.enterDetailsView);
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
                  CustomCaintainer(
                    displayIcon: Icons.person_3_outlined,
                    color: Colors.orange.shade100.withOpacity(.5),
                    width: width * 1,
                    textcolor: Colors.black,
                    textsize: 17,
                    title: ' ${userDetails.name}',
                  ),
                  SizedBox(height: height * .01),
                  CustomCaintainer(
                    displayIcon: Icons.email_outlined,
                    color: Colors.orange.shade100.withOpacity(.5),
                    width: width * 1,
                    textcolor: Colors.black,
                    textsize: 17,
                    title: ' ${userDetails.email}',
                  ),
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
                    title: ' ${userDetails.location}',
                  ),
                ],
              )
            : Center(
                child: Column(
                  children: [
                    const Text(
                      'Please add your details',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 22,
                        letterSpacing: 1,
                      ),
                    ),
                    SizedBox(height: height * .02),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, RoutesName.enterDetailsView);
                      },
                      child: const Text('Add Personal Info'),
                    ),
                  ],
                ),
              ),
      ],
    );
  }

  ///Skills section
  Widget _buildSkillsSection(
      BuildContext context, double width, double height) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            InkWell(
              onTap: () async {
                final result =
                    await Navigator.pushNamed(context, RoutesName.skillsView);
                if (result != null && result is Map<String, dynamic>) {
                  setState(() {
                    skills.add(result);
                  });
                }
              },
              child: const Row(
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
          ],
        ),
        SizedBox(height: height * .01),
        skills.isNotEmpty
            ? SkillsListview(skills: skills)
            : Center(
                child: Column(
                  children: [
                    const Text(
                      'No skills added yet',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 22,
                        letterSpacing: 1,
                      ),
                    ),
                    SizedBox(height: height * .02),
                    TextButton(
                        onPressed: () async {
                          final result = await Navigator.pushNamed(
                              context, RoutesName.skillsView);
                          if (result != null &&
                              result is Map<String, dynamic>) {
                            setState(() {
                              skills.add(result);
                            });
                          }
                        },
                        child: const Text('Add Skills')),
                  ],
                ),
              ),
      ],
    );
  }

  Widget _buildProjectsSection(
      BuildContext context, double width, double height) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            InkWell(
              onTap: () async {
                final result = await Navigator.pushNamed(
                    context, RoutesName.enterProjectsView);
                if (result != null && mounted) {
                  setState(() {
                    projects.add(result as Map<String, dynamic>);
                  });
                }
              },
              child: const Row(
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
          ],
        ),
        SizedBox(height: height * .01),
        projects.isNotEmpty
            ? ProjectsListView(projects: projects)
            : Center(
                child: Column(
                  children: [
                    const Text(
                      'No projects added yet',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 22,
                        letterSpacing: 1,
                      ),
                    ),
                    SizedBox(height: height * .02),
                    TextButton(
                        onPressed: () async {
                          final result = await Navigator.pushNamed(
                              context, RoutesName.enterProjectsView);
                          if (result != null && mounted) {
                            setState(() {
                              projects.add(result as Map<String, dynamic>);
                            });
                          }
                        },
                        child: Text('Add Projects')),
                  ],
                ),
              ),
      ],
    );
  }
}

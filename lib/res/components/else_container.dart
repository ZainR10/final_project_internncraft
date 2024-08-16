import 'package:final_project_internncraft/res/components/image_container.dart';
import 'package:final_project_internncraft/res/components/listview_projects.dart';
import 'package:final_project_internncraft/res/components/round_button.dart';
import 'package:final_project_internncraft/res/components/skills_listview.dart';
import 'package:final_project_internncraft/utils/routes/routes_name.dart';
import 'package:final_project_internncraft/view_models/user_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ElseContainer extends StatefulWidget {
  const ElseContainer({super.key});

  @override
  State<ElseContainer> createState() => _ElseContainerState();
}

class _ElseContainerState extends State<ElseContainer> {
  List<Map<String, dynamic>> projects = [];
  final List<Map<String, dynamic>> skills = [];
  @override
  Widget build(BuildContext context) {
    final userDetails = Provider.of<UserDetails>(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
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
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: height * .01),
          //info container
          Container(
            height: height * .20,
            width: width * 1,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.orange.shade100.withOpacity(.5)),
            // color: Colors.transparent),
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
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
                SizedBox(height: height * .01),
                const Center(
                  child: Text(
                    'Add Details',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 16,
                      letterSpacing: 2,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: height * .01),
          const Divider(
            color: Colors.black,
            height: 9,
            thickness: 2,
          ),
          //info container
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              // color: Colors.orange.shade100.withOpacity(.5)
            ),
            // color: Colors.transparent),
            padding: const EdgeInsets.all(10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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

              //SKILLS SECTION********
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () async {
                          final result = await Navigator.pushNamed(
                            context,
                            RoutesName.enterProjectsView,
                          );
                          if (result != null && mounted) {
                            setState(() {
                              projects.add(result as Map<String, dynamic>);
                            });
                          }
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
                        color: Colors.orange.shade100.withOpacity(.5),
                        displayIcon: Icons.workspace_premium_sharp,
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
    );
  }
}

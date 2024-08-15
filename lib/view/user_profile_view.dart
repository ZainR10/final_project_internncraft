import 'package:final_project_internncraft/res/components/round_button.dart';
import 'package:final_project_internncraft/utils/general_utils.dart';
import 'package:final_project_internncraft/utils/routes/routes_name.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProfileView extends StatefulWidget {
  const UserProfileView({
    super.key,
  });

  @override
  State<UserProfileView> createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    final auth = FirebaseAuth.instance;

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('profile'),
          backgroundColor: Colors.amber,
          actions: [
            InkWell(
              onTap: () {
                auth.signOut().then((value) {
                  Navigator.pushNamed(context, RoutesName.loginView);
                }).onError((error, stackTrace) {
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
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 40,
                  child: Icon(
                    Icons.person,
                    size: 30,
                  ),
                ),
                SizedBox(
                  height: height * .02,
                ),
                //info holding container
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.orange.shade100.withOpacity(.5),
                    // color: Colors.indigo.withOpacity(.7),
                  ),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      //edit button
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, RoutesName.enterDetailsView);
                        },
                        child: const Row(
                          // crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Edit',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 16,
                                  letterSpacing: 2,
                                  decoration: TextDecoration.underline),
                            ),
                            Icon(Icons.edit_outlined)
                          ],
                        ),
                      ),
                      //name
                      CustomCaintainer(
                        displayIcon: Icons.person_4_outlined,
                        color: Colors.transparent,

                        // color: Colors.orangeAccent.shade200.withOpacity(.4),
                        width: width * 1,
                        textcolor: Colors.black,
                        textsize: 20,
                        // height: height * .05,
                        title: 'Zain',
                      ),
                      SizedBox(
                        height: height * .01,
                      ),
                      //email
                      CustomCaintainer(
                        displayIcon: Icons.email_outlined,
                        color: Colors.transparent,

                        // color: Colors.orangeAccent.shade200.withOpacity(.4),
                        width: width * 1,
                        textcolor: Colors.black,
                        textsize: 20,
                        // height: height * .05,
                        title: 'M.zain_rehman@gmail.com',
                      ),
                      //profession
                      SizedBox(
                        height: height * .01,
                      ),
                      //profession
                      CustomCaintainer(
                        displayIcon: Icons.add_chart,
                        color: Colors.transparent,
                        // color: Colors.orangeAccent.shade200.withOpacity(.4),
                        width: width * 1,
                        textcolor: Colors.black,
                        textsize: 20,
                        // height: height * .05,
                        title: 'Profession: Software-Engineer',
                      ),
                      //location
                      SizedBox(
                        height: height * .01,
                      ),
                      //location
                      CustomCaintainer(
                        displayIcon: Icons.person_pin_circle_outlined,
                        color: Colors.transparent,
                        // color: Colors.orangeAccent.shade200.withOpacity(.4),
                        width: width * 1,
                        textcolor: Colors.black,
                        textsize: 20,
                        // height: height * .05,
                        title: 'Karachi,Pakistan',
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * .02,
                ),

                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.orange.shade100.withOpacity(.5),
                    // color: Colors.indigo.withOpacity(.7),
                  ),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, RoutesName.enterProjectsView);
                        },
                        child: const Row(
                          // crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Edit',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 16,
                                  letterSpacing: 2,
                                  decoration: TextDecoration.underline),
                            ),
                            Icon(Icons.edit_outlined)
                          ],
                        ),
                      ),
                      const CustomCaintainer(
                          displayIcon: Icons.workspace_premium_sharp,
                          textcolor: Colors.black,
                          textsize: 25,
                          title: 'Your Projects'),
                      SizedBox(
                        height: height * .02,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 50,
                              child: Icon(
                                Icons.picture_as_pdf_outlined,
                                size: 60,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

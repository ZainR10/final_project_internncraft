// ignore_for_file: unused_local_variable

import 'package:final_project_internncraft/res/components/drawer_component.dart';
import 'package:final_project_internncraft/res/components/jobs_lisview.dart';
import 'package:final_project_internncraft/res/components/simple_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class JobsView extends StatefulWidget {
  const JobsView({super.key});

  @override
  State<JobsView> createState() => _JobsViewState();
}

class _JobsViewState extends State<JobsView> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: Drawer(
          width: width * .60,
          surfaceTintColor: Colors.orange.shade100.withOpacity(.5),
          backgroundColor: Colors.orange.shade100,
          child: const DrawerComponent()),
      appBar: AppBar(
        centerTitle: true,
        // automaticallyImplyLeading: false,
        title: const Text('Jobs'),
        backgroundColor: Colors.orange.withOpacity(.8),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: height * .02,
            ),
            Text('Open Roles',
                style: GoogleFonts.aBeeZee(
                  textStyle: const TextStyle(
                      fontSize: 26,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold),
                )),
            Expanded(
              child: ListView(
                children: const [
                  JobsLisview(
                      jobTitle: 'Flutter Dev',
                      jobExperiance: '0 to 6 months',
                      jobDesc:
                          'should have basic knowledge of dart and flutter'),
                  Divider(),
                  JobsLisview(
                      jobTitle: 'Android App Dev',
                      jobExperiance: '0 to 6 months',
                      jobDesc:
                          'should have basic knowledge of kotlin and java'),
                  Divider(),
                  JobsLisview(
                      jobTitle: 'Web Dev',
                      jobExperiance: '2 to 3 months',
                      jobDesc:
                          'Experiance in html,Css,JavaScript,React & NextJs'),
                  Divider(),
                  JobsLisview(
                      jobTitle: 'Digital Marketing',
                      jobExperiance: '0 to 6 months',
                      jobDesc:
                          'Basic Knowledge of Facebook Ads,Seo and Google Ads'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

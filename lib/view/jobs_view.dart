// ignore_for_file: unused_local_variable

import 'package:final_project_internncraft/res/components/drawer_component.dart';
import 'package:final_project_internncraft/res/components/jobs_lisview.dart';
import 'package:final_project_internncraft/utils/routes/routes.dart';
import 'package:final_project_internncraft/utils/routes/routes_name.dart';
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
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.jobDescView,
                          arguments: JobDescArguments(
                              jobDesc:
                                  'We are seeking a Junior Flutter Developer to join our dynamic team. As a Flutter Developer, you will contribute to the development of high-quality mobile applications for both iOS and Android platforms.\nResponsibilities:\nDevelop and maintain Flutter applications,Collaborate with designers to create user-friendly interfaces,Write clean, efficient, and maintainable code,Participate in code reviews and testing,Learn and adopt new technologies as needed.\nQualifications:\nBachelors degree in Computer Science or related field.\n0-6 months of experience in Flutter development.\nStrong understanding of Flutter framework, Dart programming language, and Flutter widgets\nKnowledge of Firebase or other backend services.',
                              jobRole: 'Flutter Dev'));
                    },
                    child: const JobsLisview(
                        jobTitle: 'Flutter Dev',
                        jobExperiance: '0 to 6 months',
                        jobDesc:
                            'should have basic knowledge of dart and flutter'),
                  ),
                  const Divider(),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.jobDescView,
                          arguments: JobDescArguments(
                              jobDesc:
                                  'We are seeking a Junior Android Developer to join our team. As an Android Developer, you will contribute to the development and maintenance of high-quality Android applications.\nResponsibilities:\nDevelop and maintain Android applications using Java or Kotlin.\nCollaborate with designers to create user-friendly interfaces.\nWrite clean, efficient, and maintainable code.\nQualifications:\nBachelors degree in Computer Science or related field.\n0-6 months of experience in Adroid App development.\nParticipate in code reviews and testing.\nLearn and adopt new Android development technologies.',
                              jobRole: 'Android Dev'));
                    },
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, RoutesName.jobDescView,
                            arguments: JobDescArguments(
                                jobDesc:
                                    'We are seeking a Junior Android Developer to join our team. As an Android Developer, you will contribute to the development and maintenance of high-quality Android applications.\nResponsibilities:\nDevelop and maintain Android applications using Java or Kotlin.\nCollaborate with designers to create user-friendly interfaces.\nWrite clean, efficient, and maintainable code.\nQualifications:\nBachelors degree in Computer Science or related field.\n0-6 months of experience in Adroid App development.\nParticipate in code reviews and testing.\nLearn and adopt new Android development technologies.',
                                jobRole: 'Android Dev'));
                      },
                      child: const JobsLisview(
                          jobTitle: 'Android App Dev',
                          jobExperiance: '0 to 6 months',
                          jobDesc:
                              'should have basic knowledge of kotlin and java'),
                    ),
                  ),
                  const Divider(),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.jobDescView,
                          arguments: JobDescArguments(
                              jobDesc:
                                  'We are seeking a Web Developer with 2-3 years of experience to join our team. As a Web Developer, you will be responsible for developing and maintaining high-quality web applications.\nResponsibilities:\nDevelop and maintain web applications using React or Next.js frameworks.\nCollaborate with designers to create user-friendly interfaces.\nWrite clean, efficient, and maintainable code.\nOptimize web applications for performance and SEO.\nStay updated with the latest web development technologies and trends.\nQualifications:\nBachelors degree in Computer Science or related field.\n2-3 months of experience in web development.\nParticipate in code reviews and testing.\nLearn and adopt new web development technologies.',
                              jobRole: 'Web Dev'));
                    },
                    child: const JobsLisview(
                        jobTitle: 'Web Dev',
                        jobExperiance: '2 to 3 months',
                        jobDesc:
                            'Experiance in html,Css,JavaScript,React & NextJs'),
                  ),
                  const Divider(),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.jobDescView,
                          arguments: JobDescArguments(
                              jobDesc:
                                  'We are seeking a Digital Marketing Associate to join our team. You will contribute to the development and execution of digital marketing campaigns.\nResponsibilities:\nAssist in developing and implementing digital marketing strategies.\nManage social media platforms and create engaging content\nCreate and optimize online advertising campaigns (Facebook Ads, Google Ads).\nAnalyze campaign performance and provide insights.\nStay updated on digital marketing trends and best practices.\nQualifications:\nBachelors degree in Computer Science or related field.\n0-6 months of experience in Digital Marketing.',
                              jobRole: 'Digital Marketing'));
                    },
                    child: const JobsLisview(
                        jobTitle: 'Digital Marketing',
                        jobExperiance: '0 to 6 months',
                        jobDesc:
                            'Basic Knowledge of Facebook Ads,Seo and Google Ads'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

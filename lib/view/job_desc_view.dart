import 'package:final_project_internncraft/res/components/simple_button.dart';
import 'package:final_project_internncraft/utils/general_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class JobDescView extends StatefulWidget {
  final String jobRole;
  final String jobDesc;

  const JobDescView({required this.jobDesc, required this.jobRole, super.key});

  @override
  State<JobDescView> createState() => _JobDescViewState();
}

class _JobDescViewState extends State<JobDescView> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // automaticallyImplyLeading: false,
        title: const Text('Role Description'),
        backgroundColor: Colors.orange.withOpacity(.8),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                Text('Role:',
                    style: GoogleFonts.aBeeZee(
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    )),
                SizedBox(
                  width: width * .02,
                ),
                Text(widget.jobRole,
                    style: GoogleFonts.aBeeZee(
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ))
              ]),
              SizedBox(
                height: height * .02,
              ),
              //Company Intro
              Text(
                  'DigiCraft is a full-service digital agency specializing in web development (e-commerce, CMS, custom applications), mobile app development (native & cross-platform), data-driven solutions, captivating graphics (logos, branding, print materials), user-centric UI/UX design, and dynamic video animations. With a proven track record of successful projects, we deliver innovative solutions that drive business growth.',
                  style: GoogleFonts.aBeeZee(
                    textStyle: const TextStyle(
                      fontSize: 18,
                    ),
                  )),
              //company culture and perks
              Text('Company Culture and Perks',
                  style: GoogleFonts.aBeeZee(
                    textStyle: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                height: height * .02,
              ),
              Text(
                  'DigiCraft fosters a collaborative and innovative work culture, prioritizing employee growth and well-being. We offer competitive benefits, flexible work arrangements, and opportunities for professional development. Join our team and be part of something extraordinary.',
                  style: GoogleFonts.aBeeZee(
                    textStyle: const TextStyle(
                      fontSize: 18,
                    ),
                  )),
              SizedBox(
                height: height * .02,
              ),
              Text('Job Description:',
                  style: GoogleFonts.aBeeZee(
                    textStyle: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                height: height * .02,
              ),
              //DESC
              Text(
                  // 'We are seeking a Junior Flutter Developer to join our dynamic team. As a Flutter Developer, you will contribute to the development of high-quality mobile applications for both iOS and Android platforms.\nResponsibilities:\nDevelop and maintain Flutter applications,Collaborate with designers to create user-friendly interfaces,Write clean, efficient, and maintainable code,Participate in code reviews and testing,Learn and adopt new technologies as needed.\nQualifications:\nBachelors degree in Computer Science or related field.\n0-6 months of experience in Flutter development.\nStrong understanding of Flutter framework, Dart programming language, and Flutter widgets\nKnowledge of Firebase or other backend services.',
                  widget.jobDesc,
                  style: GoogleFonts.aBeeZee(
                    textStyle: const TextStyle(
                      fontSize: 18,
                    ),
                  )),
              SizedBox(
                height: height * .02,
              ),
              Text(
                  'If you are a passionate and motivated individual looking to kickstart your career in Flutter development, we encourage you to apply.',
                  style: GoogleFonts.aBeeZee(
                    textStyle: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  )),
              Center(
                child: SimpleButton(
                    buttoncolor: Colors.black,
                    textcolor: Colors.white,
                    textsize: 18,
                    width: width * 1,
                    height: height * .07,
                    title: 'Apply',
                    onPress: () {
                      GeneralUtils.snackBar('Applied for this Role.', context);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:final_project_internncraft/res/components/simple_button.dart';
import 'package:final_project_internncraft/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class JobsLisview extends StatelessWidget {
  final String jobTitle;
  final String jobExperiance;
  final String jobDesc;
  const JobsLisview(
      {required this.jobTitle,
      required this.jobExperiance,
      required this.jobDesc,
      super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return ListTile(
        contentPadding: const EdgeInsets.only(top: 30, bottom: 10),
        title: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              jobTitle,
              style: GoogleFonts.aBeeZee(
                textStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                height: height * .03,
                width: width * .40,
                decoration: BoxDecoration(
                    color: Colors.orange.shade100,
                    borderRadius: BorderRadius.circular(2),
                    border: Border.all(color: Colors.grey, width: 1)),
                child: Center(
                  child: Text(
                    jobExperiance,
                    style: GoogleFonts.aBeeZee(
                      textStyle: const TextStyle(
                          fontSize: 8, fontWeight: FontWeight.bold),
                    ),
                  ),
                ))
          ],
        ),
        trailing: SimpleButton(
            buttoncolor: Colors.black,
            textcolor: Colors.white,
            textsize: 14,
            width: width * .20,
            height: height * .04,
            title: 'Apply',
            onPress: () {}),
        subtitle: Column(children: [
          Text(
            jobDesc,
            style: GoogleFonts.aBeeZee(
              textStyle: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ]));
  }
}

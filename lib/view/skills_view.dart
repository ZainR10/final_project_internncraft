import 'package:final_project_internncraft/res/components/simple_button.dart';
import 'package:flutter/material.dart';

class SkillsView extends StatefulWidget {
  const SkillsView({super.key});

  @override
  State<SkillsView> createState() => _SkillsViewState();
}

class _SkillsViewState extends State<SkillsView> {
  final skillsController = TextEditingController();
  final _formSkillsKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('skills'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(10),
              width: width * 1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.orange.shade100.withOpacity(0.5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Form(
                    key: _formSkillsKey,
                    child: Column(
                      children: [
                        const Text(
                          'Enter Your Skills',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 24,
                            letterSpacing: 2,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        SizedBox(height: height * 0.02),
                        TextFormField(
                          controller: skillsController,
                          decoration: const InputDecoration(
                            labelText: 'Add Skills',
                            border: OutlineInputBorder(),
                          ),
                          // maxLines: 3,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a skills';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        SimpleButton(
                          height: height * .07,
                          width: width * 1,
                          textsize: 16,
                          textcolor: Colors.white,
                          buttoncolor: Colors.black,
                          title: 'Save ',
                          onPress: () {
                            if (_formSkillsKey.currentState!.validate()) {
                              Navigator.pop(context, {
                                'Skills': skillsController.text,
                              });
                            }
                          },
                        ),
                        SimpleButton(
                          height: height * .07,
                          width: width * 1,
                          textsize: 16,
                          textcolor: Colors.black,
                          buttoncolor: Colors.red,
                          title: 'Cancel',
                          onPress: () {
                            Navigator.pop(context);
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

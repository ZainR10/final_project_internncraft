import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:final_project_internncraft/res/components/simple_button.dart';

class EnterProjectsView extends StatefulWidget {
  const EnterProjectsView({super.key});

  @override
  State<EnterProjectsView> createState() => _EnterProjectsViewState();
}

class _EnterProjectsViewState extends State<EnterProjectsView> {
  final _formProjectsKey = GlobalKey<FormState>();
  final descriptionController = TextEditingController();
  final githubController = TextEditingController();
  File? _selectedImage;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Projects'),
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
                    key: _formProjectsKey,
                    child: Column(
                      children: [
                        const Text(
                          'Enter Project Details',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 24,
                            letterSpacing: 2,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        SizedBox(height: height * 0.02),
                        GestureDetector(
                          onTap: _pickImage,
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Colors.grey.shade400,
                                width: 2,
                              ),
                            ),
                            child: _selectedImage == null
                                ? Center(
                                    child: Icon(
                                      Icons.add_a_photo,
                                      size: 50,
                                      color: Colors.grey.shade600,
                                    ),
                                  )
                                : Image.file(
                                    _selectedImage!,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                        SizedBox(height: height * 0.02),
                        TextFormField(
                          controller: descriptionController,
                          decoration: const InputDecoration(
                            labelText: 'Description',
                            border: OutlineInputBorder(),
                          ),
                          maxLines: 3,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a description';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        TextFormField(
                          controller: githubController,
                          decoration: const InputDecoration(
                            labelText: 'Github Link',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a link';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        SimpleButton(
                          height: height * .07,
                          width: width * 1,
                          textsize: 10,
                          textcolor: Colors.white,
                          buttoncolor: Colors.black,
                          title: 'Save Project',
                          onPress: () {
                            if (_formProjectsKey.currentState!.validate()) {
                              Navigator.pop(context, {
                                'description': descriptionController.text,
                                'link': githubController.text,
                                'image': _selectedImage,
                              });
                            }
                          },
                        ),
                        SimpleButton(
                          height: height * .07,
                          width: width * 1,
                          textsize: 10,
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

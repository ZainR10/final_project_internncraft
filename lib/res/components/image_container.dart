import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImageContainer extends StatefulWidget {
  const ImageContainer({super.key});

  @override
  State<ImageContainer> createState() => _ImageContainerState();
}

class _ImageContainerState extends State<ImageContainer> {
  File? _imageFile; // Stores the selected image

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: _pickImage, // Call _pickImage on tap
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            shape: BoxShape.circle,
            image: _imageFile != null
                ? DecorationImage(
                    image: FileImage(
                        _imageFile!), // Use FileImage for selected image
                    fit: BoxFit.cover,
                  )
                : const DecorationImage(
                    image: NetworkImage('your-image-url'), // Placeholder
                    fit: BoxFit.cover,
                  ),
            border: Border.all(
              color: Colors.grey.shade400,
              width: 2,
            ),
          ),
          child: Center(
            child: _imageFile == null
                ? Icon(
                    Icons.person,
                    size: 50,
                    color: Colors.grey.shade600,
                  )
                : null, // Hide icon if image is selected
          ),
        ),
      ),
    );
  }
}

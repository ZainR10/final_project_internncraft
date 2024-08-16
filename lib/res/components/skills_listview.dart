import 'package:flutter/material.dart';

class SkillsListview extends StatelessWidget {
  final List<Map<String, dynamic>> skills;
  const SkillsListview({super.key, required this.skills});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.start,
      spacing: 8.0, // Space between each skill container
      runSpacing: 8.0, // Space between rows if skills wrap to the next line
      children: skills.map((skill) {
        return Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.orange.shade100.withOpacity(.5),
            border: Border.all(
              color: Colors.grey.shade400,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                offset: const Offset(0, 2),
                blurRadius: 4,
              ),
            ],
          ),
          child: Text(
            skill['Skills'],
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        );
      }).toList(),
    );
  }
}

import 'package:flutter/material.dart';

class ProjectsListView extends StatefulWidget {
  final List<Map<String, dynamic>> projects; // Pass the projects list

  const ProjectsListView({super.key, required this.projects});

  @override
  State<ProjectsListView> createState() => _ProjectsListViewState();
}

class _ProjectsListViewState extends State<ProjectsListView> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.projects.length,
      itemBuilder: (context, index) {
        final project = widget.projects[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.orange.shade100.withOpacity(.5),
            border: Border.all(
              color: Colors.grey.shade400,
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                offset: const Offset(0, 2),
                blurRadius: 4,
              ),
            ],
          ),
          child: Row(children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8),
                image: project['image'] != null
                    ? DecorationImage(
                        image: FileImage(project['image']),
                        fit: BoxFit.cover,
                      )
                    : null,
                border: Border.all(
                  color: Colors.grey.shade400,
                  width: 2,
                ),
              ),
              child: project['image'] == null
                  ? Center(
                      child: Icon(
                        Icons.image,
                        size: 50,
                        color: Colors.grey.shade600,
                      ),
                    )
                  : null,
            ),
            SizedBox(width: width * .03),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    project['description'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: height * .01),
                  Text(
                    project['link'],
                    style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
          ]),
        );
      },
    );
  }
}

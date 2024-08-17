// ignore_for_file: unused_local_variable

import 'package:final_project_internncraft/res/components/drawer_component.dart';
import 'package:flutter/material.dart';

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
    );
  }
}

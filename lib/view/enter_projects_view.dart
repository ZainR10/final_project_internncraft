import 'package:flutter/material.dart';

class EnterProjectsView extends StatefulWidget {
  const EnterProjectsView({super.key});

  @override
  State<EnterProjectsView> createState() => _EnterProjectsViewState();
}

class _EnterProjectsViewState extends State<EnterProjectsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('projects'),
      ),
    );
  }
}

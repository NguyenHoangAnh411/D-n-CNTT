import 'package:flutter/material.dart';

class GrammarLessonPage extends StatelessWidget {
  const GrammarLessonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Grammar Lessons')),
      body: const Center(
        child: Text('Grammar lessons content goes here...'),
      ),
    );
  }
}
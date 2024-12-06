import 'package:flutter/material.dart';


class ListeningLessonPage extends StatelessWidget {
  const ListeningLessonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Listening Lessons')),
      body: const Center(
        child: Text('Listening lessons content goes here...'),
      ),
    );
  }
}
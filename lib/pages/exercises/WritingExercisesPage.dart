import 'package:flutter/material.dart';

class WritingExercisesPage extends StatelessWidget {
  const WritingExercisesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bài tập viết')),
      body: const Center(
        child: Text('Bài tập viết với hướng dẫn và bài mẫu'),
      ),
    );
  }
}
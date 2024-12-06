import 'package:flutter/material.dart';

// Các trang con tương ứng cho từng mục
class VocabularyLessonPage extends StatelessWidget {
  const VocabularyLessonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Vocabulary Lessons')),
      body: const Center(
        child: Text('Vocabulary lessons content goes here...'),
      ),
    );
  }
}
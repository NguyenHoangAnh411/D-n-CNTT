import 'package:flutter/material.dart';

class ReadingExercisesPage extends StatelessWidget {
  const ReadingExercisesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bài tập đọc hiểu')),
      body: const Center(
        child: Text('Các bài đọc hiểu và câu hỏi kiểm tra hiểu biết'),
      ),
    );
  }
}
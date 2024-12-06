import 'package:flutter/material.dart';

class SpeakingExercisesPage extends StatelessWidget {
  const SpeakingExercisesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bài tập nói')),
      body: const Center(
        child: Text('Luyện tập nói và so sánh phát âm của bạn với người bản xứ'),
      ),
    );
  }
}
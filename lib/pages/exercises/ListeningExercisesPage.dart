import 'package:flutter/material.dart';

// Các trang con tương ứng cho từng mục học

// Luyện nghe
class ListeningExercisesPage extends StatelessWidget {
  const ListeningExercisesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bài tập nghe')),
      body: const Center(
        child: Text('Luyện tập nghe với các bài nghe có cấp độ khác nhau'),
      ),
    );
  }
}
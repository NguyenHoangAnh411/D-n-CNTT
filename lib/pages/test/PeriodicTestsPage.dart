import 'package:flutter/material.dart';

class PeriodicTestsPage extends StatelessWidget {
  const PeriodicTestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bài kiểm tra định kỳ')),
      body: const Center(
        child: Text('Cung cấp các bài kiểm tra định kỳ để đánh giá tiến độ học tập'),
      ),
    );
  }
}
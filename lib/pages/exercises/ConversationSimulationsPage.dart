import 'package:flutter/material.dart';

class ConversationSimulationsPage extends StatelessWidget {
  const ConversationSimulationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hội thoại mô phỏng')),
      body: const Center(
        child: Text('Luyện kỹ năng giao tiếp qua các bài tập hội thoại mô phỏng'),
      ),
    );
  }
}
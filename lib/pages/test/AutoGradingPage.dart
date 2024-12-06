import 'package:flutter/material.dart';

class AutoGradingPage extends StatelessWidget {
  const AutoGradingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Đánh giá tự động')),
      body: const Center(
        child: Text('Hệ thống tự động chấm điểm và đưa ra phản hồi cho các bài tập và bài kiểm tra'),
      ),
    );
  }
}
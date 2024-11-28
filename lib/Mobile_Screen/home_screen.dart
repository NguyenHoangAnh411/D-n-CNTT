import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Trang Chủ')),
      body: const Center(
        child: Text('Chào mừng bạn đến với trang chủ!', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}

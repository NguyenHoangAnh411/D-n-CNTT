import 'package:flutter/material.dart';
import 'package:my_project/Mobile_Screen/login_option_bottomsheet.dart';
import 'package:my_project/Mobile_Screen/signup_option_bottomsheet.dart';
import 'package:my_project/reuseable_items.dart';

class MobileOnboarding extends StatelessWidget {
  const MobileOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF), // Đặt màu nền là trắng
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            width: 350,
            height: 60,
            margin: const EdgeInsets.only(bottom: 20),
            child: ElevatedButton(
              onPressed: () {
                signUpOptionScreen(context);
              },
              style: customElevatedButtonStyle,
              child: const Text(
                'Đăng ký',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFFFFF)),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Bạn đã có tài khoản?',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFd9d9d9)),
              ),
              const SizedBox(width: 0),
              TextButton(
                onPressed: () {
                  loginOptionScreen(context);
                },
                child: const Text(
                  'Đăng nhập',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1c49ff)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:my_project/Mobile_Screen/login_option_bottomsheet.dart';
import 'package:my_project/Mobile_Screen/signup_option_bottomsheet.dart';
import 'package:my_project/reuseable_items.dart';
import 'package:my_project/Services/authService.dart' as service_auth;

class MobileOnboarding extends StatelessWidget {
  
  const MobileOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    final service_auth.AuthService authService = service_auth.AuthService();
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF), 
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.75,
            child: ElevatedButton(
              onPressed: () {
                signUpOptionScreen(context);
              },
              style: customElevatedButtonStyle,
              child: const Text(
                'Đăng ký',
                style: TextStyle(
                    fontSize: 14,
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
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFd9d9d9)),
              ),
              const SizedBox(width: 0),
              TextButton(
                onPressed: () {
                  loginOptionScreen(context, authService);
                },
                child: const Text(
                  'Đăng nhập',
                  style: TextStyle(
                      fontSize: 14,
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

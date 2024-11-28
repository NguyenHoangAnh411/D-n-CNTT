import 'package:flutter/material.dart';
import 'package:my_project/reuseable_items.dart';
import 'package:my_project/Services/authService.dart';

void numberphoneSignUpScreen(BuildContext context) {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  AuthService authService = AuthService();
  String? verificationId;

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    builder: (BuildContext context) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.9,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            child: Column(
              children: <Widget>[
                const SizedBox(height: 20),
                const Text(
                  'Đăng ký bằng số điện thoại',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 30),
                TextField(
                  decoration: customTextFieldDecoration.copyWith(
                    hintText: 'Nhập số điện thoại',
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  decoration: customTextFieldDecoration.copyWith(
                    hintText: 'Nhập mật khẩu',
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  decoration: customTextFieldDecoration.copyWith(
                    hintText: 'Nhập mã OTP',
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  decoration: customTextFieldDecoration.copyWith(
                    hintText: 'Nhập tên người dùng',
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {},
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
              ],
            ),
          ),
        ),
      );
    },
  );
}

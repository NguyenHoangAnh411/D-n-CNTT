import 'package:flutter/material.dart';
import 'package:my_project/Mobile_Screen/login_email_bottomsheet.dart';
import 'package:my_project/reuseable_items.dart';
import 'package:my_project/Services/authService.dart';

void emailSignUpScreen(BuildContext context) {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
    ),
    builder: (BuildContext context) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.9,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 10),
              const Text(
                'Đăng ký bằng email',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                child: TextField(
                  controller: nameController,
                  decoration: customTextFieldDecoration.copyWith(
                    hintText: 'Tên',
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                child: TextField(
                  controller: emailController,
                  decoration: customTextFieldDecoration.copyWith(
                    hintText: 'Nhập email của bạn',
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                child: TextField(
                  controller: passwordController,
                  decoration: customTextFieldDecoration.copyWith(
                    hintText: 'Nhập mật khẩu',
                  ),
                  obscureText: true,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                child: TextField(
                  controller: confirmPasswordController,
                  decoration: customTextFieldDecoration.copyWith(
                    hintText: 'Xác nhận mật khẩu',
                  ),
                  obscureText: true,
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                child: ElevatedButton(
                  onPressed: () {
                    String name = nameController.text.trim();
                    String email = emailController.text.trim();
                    String password = passwordController.text.trim();
                    String confirmPassword =
                        confirmPasswordController.text.trim();

                    if (name.isEmpty ||
                        email.isEmpty ||
                        password.isEmpty ||
                        confirmPassword.isEmpty) {
                      _showDialog(context, 'Vui lòng điền đầy đủ thông tin!');
                      return;
                    }

                    if (password != confirmPassword) {
                      _showDialog(
                          context, 'Mật khẩu và xác nhận mật khẩu không khớp!');
                      return;
                    }

                    AuthService.signUpWithEmail(
                      context: context,
                      name: name,
                      email: email,
                      password: password,
                      confirmPassword: confirmPassword,
                    ).then((_) {
                      Navigator.pop(context);
                      emailLoginScreen(context);
                      _showDialog(context,
                          'Đăng ký thành công! Hãy xác thực email và đăng nhập ngay nhé!');
                    }).catchError((error) {
                      _showDialog(
                          context, 'Đã xảy ra lỗi: ${error.toString()}');
                    });
                  },
                  style: customElevatedButtonStyle,
                  child: const Text(
                    'Đăng ký',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

void _showDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 16,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 40,
              ),
              const SizedBox(height: 20),
              Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    backgroundColor: const Color(0xFF1c49ff),
                  ),
                  child: const Text(
                    'OK',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

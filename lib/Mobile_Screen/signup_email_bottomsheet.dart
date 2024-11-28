import 'package:flutter/material.dart';
import 'package:my_project/reuseable_items.dart';
import 'package:my_project/Services/authService.dart';
import 'package:my_project/Mobile_Screen/mobile_onboarding.dart';
void emailSignUpScreen(BuildContext context) {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

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
                    String confirmPassword = confirmPasswordController.text.trim();

                    if (name.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
                      _showDialog(context, 'Vui lòng điền đầy đủ thông tin!');
                      return;
                    }

                    if (password != confirmPassword) {
                      _showDialog(context, 'Mật khẩu và xác nhận mật khẩu không khớp!');
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
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const MobileOnboarding()),
                      );
                    }).catchError((error) {
                      _showDialog(context, 'Đã xảy ra lỗi: ${error.toString()}');
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
      return AlertDialog(
        title: const Text('Thông báo'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: const Text('Đóng'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

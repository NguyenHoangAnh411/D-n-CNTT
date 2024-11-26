import 'package:flutter/material.dart';
import 'package:my_project/reuseable_items.dart';

void emailSignUpScreen(BuildContext context) {
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
      return Container(
        height: MediaQuery.of(context).size.height * 0.9,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 20),
              Text(
                'Đăng ký bằng email',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                decoration: customTextFieldDecoration.copyWith(
                  hintText: 'Tên',
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: customTextFieldDecoration.copyWith(
                  hintText: 'Nhập email của bạn',
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: customTextFieldDecoration.copyWith(
                  hintText: 'Nhập mật khẩu',
                ),
                obscureText: true, // Ẩn mật khẩu khi nhập
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: customTextFieldDecoration.copyWith(
                  hintText: 'Xác nhận mật khẩu',
                ),
                obscureText: true, // Ẩn mật khẩu khi nhập
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
      );
    },
  );
}

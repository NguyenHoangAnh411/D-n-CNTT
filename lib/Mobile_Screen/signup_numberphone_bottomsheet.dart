import 'package:flutter/material.dart';
import 'package:my_project/reuseable_items.dart';

void numberphoneSignUpScreen(BuildContext context) {


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
          padding: const EdgeInsets.all(16.0),
          child: Container(
            child: Column(
              children: <Widget>[
                const SizedBox(height: 10),
                const Text(
                  'Đăng ký bằng số điện thoại',
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
                    decoration: customTextFieldDecoration.copyWith(
                      hintText: 'Nhập số điện thoại',
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: TextField(
                    decoration: customTextFieldDecoration.copyWith(
                      hintText: 'Nhập mật khẩu',
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: TextField(
                    decoration: customTextFieldDecoration.copyWith(
                      hintText: 'Nhập mã OTP',
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: TextField(
                    decoration: customTextFieldDecoration.copyWith(
                      hintText: 'Nhập tên người dùng',
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: ElevatedButton(
                    onPressed: () {},
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
              ],
            ),
          ),
        ),
      );
    },
  );
}

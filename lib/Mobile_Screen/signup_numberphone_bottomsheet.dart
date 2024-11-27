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
              // TextField cho số điện thoại
              TextField(
                controller: phoneController,
                decoration: customTextFieldDecoration.copyWith(
                  hintText: 'Nhập số điện thoại',
                ),
              ),
              const SizedBox(height: 20),
              // TextField cho mật khẩu
              TextField(
                controller: passwordController,
                decoration: customTextFieldDecoration.copyWith(
                  hintText: 'Nhập mật khẩu',
                ),
                obscureText: true, // Ẩn mật khẩu
              ),
              const SizedBox(height: 30),
              // Nút gửi OTP
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () async {
                    String phoneNumber = phoneController.text.trim();
                    String password = passwordController.text.trim();
                    String username = usernameController.text.trim();

                    // Gửi OTP
                    authService.signUpWithPhone(
                      phoneNumber: phoneNumber,
                      otpCode: '',
                      password: password,
                      username: username,
                      onCodeSent: (receivedVerificationId) {
                        verificationId = receivedVerificationId;
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
                              height: MediaQuery.of(context).size.height * 0.5,
                              width: MediaQuery.of(context).size.width,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: <Widget>[
                                    const SizedBox(height: 20),
                                    const Text(
                                      'Nhập mã OTP đã gửi',
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(height: 30),
                                    // TextField cho mã OTP
                                    TextField(
                                      controller: otpController,
                                      decoration: customTextFieldDecoration.copyWith(
                                        hintText: 'Nhập mã OTP',
                                      ),
                                    ),
                                    const SizedBox(height: 30),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          String otp = otpController.text.trim();

                                          // Xác minh OTP
                                          if (verificationId != null && otp.isNotEmpty) {
                                            authService.verifyOTP(
                                              verificationId: verificationId!,
                                              otpCode: otp,
                                              password: password,
                                              username: username,
                                              onSuccess: (user) {
                                                // Đăng ký thành công
                                                print('Đăng ký thành công! Người dùng: ${user?.displayName}');
                                                Navigator.pop(context); // Đóng modal OTP
                                              },
                                              onError: (message) {
                                                print('Lỗi: $message');
                                              },
                                            );
                                          } else {
                                            print('Vui lòng nhập mã OTP hợp lệ.');
                                          }
                                        },
                                        style: customElevatedButtonStyle,
                                        child: const Text(
                                          'Xác minh OTP',
                                          style: TextStyle(
                                            fontSize: 16,
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
                      },
                      onVerificationCompleted: (user) {
                        print('Đăng ký thành công! Người dùng: ${user?.displayName}');
                      },
                      onError: (message) {
                        print('Lỗi: $message');
                      },
                    );
                  },
                  style: customElevatedButtonStyle,
                  child: const Text(
                    'Gửi mã OTP',
                    style: TextStyle(
                      fontSize: 16,
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

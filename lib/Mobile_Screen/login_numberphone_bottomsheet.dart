import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_project/reuseable_items.dart';
import 'package:my_project/Mobile_Screen/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signInWithPhone({
    required BuildContext context,
    required String phoneNumber,
    required String password,
    required Function(String) onError,
    required Function(String) onVerificationSent,
  }) async {
    try {
      String formattedPhoneNumber = phoneNumber.trim();
      if (formattedPhoneNumber.startsWith('0')) {
        formattedPhoneNumber = '+84${formattedPhoneNumber.substring(1)}';
      }

      if (!RegExp(r'^\+84\d{9}$').hasMatch(formattedPhoneNumber)) {
        onError('Số điện thoại không hợp lệ! Vui lòng nhập số điện thoại Việt Nam theo định dạng +84...');
        return;
      }

      await _auth.verifyPhoneNumber(
        phoneNumber: formattedPhoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          try {
            UserCredential userCredential = await _auth.signInWithCredential(credential);
            if (userCredential.user != null) {
              onVerificationSent('Xác thực thành công');
            }
          } catch (e) {
            onError('Xác thực tự động thất bại: ${e.toString()}');
          }
        },
        verificationFailed: (FirebaseAuthException e) {
          onError('Lỗi xác minh: ${e.message ?? "Xác minh thất bại"}');
        },
        codeSent: (String verificationId, int? resendToken) {
          onVerificationSent(verificationId);
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      onError('Lỗi đăng nhập: ${e.toString()}');
    }
  }

Future<void> signInWithOtp({
  required BuildContext context,
  required String otpCode,
  required String verificationId,
  required Function(User?) onSuccess,
  required Function(String) onError,
}) async {
  try {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: otpCode,
    );

    UserCredential userCredential = await _auth.signInWithCredential(credential);

    if (userCredential.user != null) {
      // Lưu trạng thái đăng nhập
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('isLoggedIn', true);
      prefs.setString('phoneNumber', userCredential.user?.phoneNumber ?? '');

      // Điều hướng đến HomeScreen
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      onError('Lỗi đăng nhập');
    }
  } catch (e) {
    onError('Mã OTP không hợp lệ: ${e.toString()}');
  }
}


}

void showOtpInputDialog(BuildContext context, String verificationId) {
  final TextEditingController otpController = TextEditingController();
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Nhập mã OTP'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              controller: otpController,
              decoration: const InputDecoration(hintText: 'Nhập mã OTP'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              String otpCode = otpController.text.trim();

              AuthService().signInWithOtp(
                context: context,
                otpCode: otpCode,
                verificationId: verificationId,
                onSuccess: (user) {

                },
                onError: (message) {
                  showErrorDialog(context, message);
                },
              );
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}


void showErrorDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Lỗi'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}

void numberPhoneLoginScreen(BuildContext context) {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  AuthService authService = AuthService();

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
                'Đăng nhập bằng số điện thoại',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: phoneController,
                decoration: customTextFieldDecoration.copyWith(
                  hintText: 'Nhập số điện thoại',
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: passwordController,
                decoration: customTextFieldDecoration.copyWith(
                  hintText: 'Nhập mật khẩu',
                ),
                obscureText: true,
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () async {
                    String phoneNumber = phoneController.text.trim();
                    String password = passwordController.text.trim();

                    authService.signInWithPhone(
                      context: context,
                      phoneNumber: phoneNumber,
                      password: password,
                      onError: (message) {
                        showErrorDialog(context, message);
                      },
                      onVerificationSent: (verificationId) {
                        showOtpInputDialog(context, verificationId);
                      },
                    );
                  },
                  style: customElevatedButtonStyle,
                  child: const Text(
                    'Gửi mã OTP',
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

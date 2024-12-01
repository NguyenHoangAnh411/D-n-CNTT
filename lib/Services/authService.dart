import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential?> loginWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn().signIn();

      final googleAuth = await googleUser?.authentication;

      final cred = GoogleAuthProvider.credential(
          idToken: googleAuth?.idToken, accessToken: googleAuth?.accessToken);

      return await _auth.signInWithCredential(cred);
    } catch (e) {
      if (kDebugMode) {
        print('Google Login Error: ${e.toString()}');
      }
    }
    return null;
  }

  Future<void> signUpWithPhone({
    required String phoneNumber,
    required String otpCode,
    required String password,
    required String username,
    required Function(String?) onCodeSent,
    required Function(User?) onVerificationCompleted,
    required Function(String) onError,
  }) async {
    try {
      String formattedPhoneNumber = phoneNumber.trim();

      if (!formattedPhoneNumber.startsWith('+')) {
        formattedPhoneNumber =
            '+84${formattedPhoneNumber.replaceFirst('0', '')}';
      }

      if (!RegExp(r'^\+84\d{9}$').hasMatch(formattedPhoneNumber)) {
        onError(
            'Số điện thoại không hợp lệ! Vui lòng nhập số điện thoại của Việt Nam theo định dạng E.164.');
        return;
      }

      await _auth.verifyPhoneNumber(
        phoneNumber: formattedPhoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          try {
            UserCredential userCredential =
                await _auth.signInWithCredential(credential);
            onVerificationCompleted(userCredential.user);
          } catch (e) {
            onError('Xác thực tự động thất bại: ${e.toString()}');
          }
        },
        verificationFailed: (FirebaseAuthException e) {
          onError(e.message ?? "Xác minh thất bại!");
        },
        codeSent: (String verificationId, int? resendToken) {
          onCodeSent(verificationId);
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      onError('Đã xảy ra lỗi: ${e.toString()}');
    }
  }

  Future<void> verifyOTP({
    required String verificationId,
    required String otpCode,
    required String password,
    required String username,
    required Function(User?) onSuccess,
    required Function(String) onError,
  }) async {
    try {
      if (otpCode.isEmpty || otpCode.length < 6) {
        onError('Mã OTP không hợp lệ!');
        return;
      }

      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otpCode,
      );

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      await userCredential.user?.updatePassword(password);
      await userCredential.user?.updateDisplayName(username);

      onSuccess(userCredential.user);
    } catch (e) {
      onError('Xác minh OTP thất bại: ${e.toString()}');
    }
  }

  static Future<void> signUpWithEmail({
    required BuildContext context,
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    if (name.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      print("Thông tin chưa đầy đủ!");
      _showDialog(context, 'Vui lòng điền đầy đủ thông tin!');
      return;
    }

    if (!_isValidEmail(email)) {
      print("Email không hợp lệ!");
      _showDialog(
          context, 'Email không hợp lệ! Vui lòng nhập email đúng định dạng.');
      return;
    }

    if (password != confirmPassword) {
      print("Mật khẩu không khớp!");
      _showDialog(context, 'Mật khẩu và xác nhận mật khẩu không khớp!');
      return;
    }

    try {
      final UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null && !userCredential.user!.emailVerified) {
        await userCredential.user!.sendEmailVerification();
        print("Đã gửi email xác thực");

        _showDialog(context,
            'Email xác thực đã được gửi. Vui lòng kiểm tra hộp thư của bạn!');
      } else {
        _showDialog(context, 'Tài khoản đã được tạo thành công!');
      }

      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      print("Lỗi đăng ký: ${e.message}");
      String errorMessage = 'Đăng ký thất bại. Vui lòng thử lại!';
      if (e.code == 'email-already-in-use') {
        errorMessage = 'Email này đã được sử dụng!';
      } else if (e.code == 'invalid-email') {
        errorMessage = 'Email không hợp lệ!';
      }
      _showDialog(context, errorMessage);
    } catch (e) {
      print("Đã xảy ra lỗi không xác định: $e");
      _showDialog(context, 'Đã xảy ra lỗi không xác định!');
    }
  }

  static bool _isValidEmail(String email) {
    final regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return regex.hasMatch(email);
  }

  static void _showDialog(BuildContext context, String message) {
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
                    ),
                    child: const Text(
                      'OK',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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

  Future<void> logInWithEmail({
    required BuildContext context,
    required String email,
    required String password,
    required Function(User?) onSuccess,
    required Function(String) onError,
  }) async {
    if (email.isEmpty || password.isEmpty) {
      onError('Email và mật khẩu không được để trống!');
      return;
    }
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (!userCredential.user!.emailVerified) {
        onError(
            'Email chưa được xác thực! Vui lòng xác thực email trước khi đăng nhập.');
        return;
      }
      onSuccess(userCredential.user);
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'Đăng nhập thất bại. Vui lòng thử lại!';
      if (e.code == "user-not-found") {
        errorMessage = 'Không tìm thấy tài khoản nào với email này!';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Mật khẩu không chính xác!';
      }
      onError(errorMessage);
    } catch (e) {
      onError('Đã xảy ra lỗi: ${e.toString()}');
    }
  }
}

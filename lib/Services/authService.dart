import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
}

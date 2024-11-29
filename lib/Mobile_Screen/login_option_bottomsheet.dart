import 'package:flutter/material.dart';
import 'package:my_project/Mobile_Screen/home_screen.dart';
import 'package:my_project/Mobile_Screen/login_email_bottomsheet.dart';
import 'package:my_project/Mobile_Screen/login_numberphone_bottomsheet.dart';
import 'package:my_project/Mobile_Screen/signup_option_bottomsheet.dart';
import 'package:my_project/reuseable_items.dart';
import 'package:my_project/Services/authService.dart' as service_auth;
void loginOptionScreen(BuildContext context, service_auth.AuthService authService) {
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
          padding: const EdgeInsets.all(14.0),
          child: Container(
            child: Column(
              children: <Widget>[
                const SizedBox(height: 20),
                const Text(
                  'Đăng nhập để tiếp tục',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),

                // Tiếp tục bằng số điện thoại
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: ElevatedButton(
                    onPressed: () {
                      numberPhoneLoginScreen(context);
                    },
                    style: customElevatedButtonStyle,
                    child: const Text(
                      'Tiếp tục bằng số điện thoại',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: ElevatedButton(
                    onPressed: () {
                      emailLoginScreen(context);
                    },
                    style: customEmailButtonStyle,
                    child: const Text(
                      'Tiếp tục bằng email',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: ElevatedButton(
                    onPressed: () async {
                    try {
                      await authService.loginWithGoogle();

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const HomeScreen()),
                      );
                    } catch (e) {
                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Lỗi khi đăng nhập bằng Google: $e')),
                      );
                    }
                  },
                  style: customGoogleButtonStyle,
                  child: const Text(
                    'Tiếp tục bằng Google',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: customFacebookButtonStyle,
                    child: const Text(
                      'Tiếp tục bằng Facebook',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Bạn chưa tài khoản?',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54),
                    ),
                    TextButton(
                      onPressed: () {
                        signUpOptionScreen(context);
                      },
                      child: const Text(
                        'Đăng ký',
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
          ),
        ),
      );
    },
  );
}
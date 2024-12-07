import 'package:flutter/material.dart';
import 'package:my_project/Mobile_Screen/home_screen.dart';
import 'package:my_project/Mobile_Screen/login_email_bottomsheet.dart';
import 'package:my_project/Mobile_Screen/login_numberphone_bottomsheet.dart';
import 'package:my_project/Mobile_Screen/signup_option_bottomsheet.dart';
import 'package:my_project/reuseable_items.dart';
import 'package:my_project/Services/authService.dart' as service_auth;

class LoginOptionScreen extends StatelessWidget {
  final service_auth.AuthService authService;

  const LoginOptionScreen({Key? key, required this.authService})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _showLoginModal(context);
          },
          child: const Text('Login Options'),
        ),
      ),
    );
  }

  void _showLoginModal(BuildContext context) {
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
                LoginOptionButton(
                  text: 'Tiếp tục bằng số điện thoại',
                  onPressed: () => numberPhoneLoginScreen(context),
                  buttonStyle: customElevatedButtonStyle,
                  textStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                LoginOptionButton(
                  text: 'Tiếp tục bằng email',
                  onPressed: () => emailLoginScreen(context),
                  buttonStyle: customEmailButtonStyle,
                  textStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                LoginOptionButton(
                  text: 'Tiếp tục bằng Google',
                  onPressed: () async {
                    await _loginWithGoogle(context);
                  },
                  buttonStyle: customGoogleButtonStyle,
                  textStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 10),
                LoginOptionButton(
                  text: 'Tiếp tục bằng Facebook',
                  onPressed: () {},
                  buttonStyle: customFacebookButtonStyle,
                  textStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
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
                        color: Colors.black54,
                      ),
                    ),
                    TextButton(
                      onPressed: () => signUpOptionScreen(context),
                      child: const Text(
                        'Đăng ký',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1c49ff),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _loginWithGoogle(BuildContext context) async {
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
  }
}

class LoginOptionButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final ButtonStyle buttonStyle;
  final TextStyle textStyle; // Added textStyle parameter

  const LoginOptionButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.buttonStyle,
    required this.textStyle, // Added textStyle parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.75,
      child: ElevatedButton(
        onPressed: onPressed,
        style: buttonStyle,
        child: Text(
          text,
          style: textStyle, // Use the provided textStyle
        ),
      ),
    );
  }
}

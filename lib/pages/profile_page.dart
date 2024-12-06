import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:my_project/Mobile_Screen/LoginOptionScreen%20.dart';
import 'package:my_project/Services/authService.dart' as service_auth;

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;
    final service_auth.AuthService authService = service_auth.AuthService();

    if (user == null) {
      return const Center(
        child: Text(
          'Bạn chưa đăng nhập!',
          style: TextStyle(fontSize: 18, color: Colors.red),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (user.photoURL != null)
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(user.photoURL!),
            )
          else
            const CircleAvatar(
              radius: 50,
              child: Icon(Icons.person, size: 50),
            ),
          const SizedBox(height: 16),
          Text(
            user.displayName ?? 'Không có tên hiển thị',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            user.email ?? 'Không có email',
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();

              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.setBool('isLoggedIn', false); // Cập nhật trạng thái đăng xuất

              // ignore: use_build_context_synchronously
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Đăng xuất thành công!')),
              );

              Navigator.pushReplacement(
                // ignore: use_build_context_synchronously
                context,
                MaterialPageRoute(
                  builder: (context) => LoginOptionScreen(authService: authService),
                ),
              );
            },
            child: const Text('Đăng xuất'),
          ),
        ],
      ),
    );
  }
}

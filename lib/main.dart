
import 'package:flutter/material.dart';
import 'package:my_project/Desktop/desktop_onboarding.dart';
import 'package:my_project/Desktop/small_desktop_onboarding.dart';
import 'package:my_project/Mobile_Screen/mobile_onboarding.dart'; // Import SmallDesktopOnboarding

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // try {
  //   if (kIsWeb) {
  //     await Firebase.initializeApp(
  //         options: FirebaseOptions(
  //             apiKey: "AIzaSyBCGV28ZlqS0HNXJyKiGMVKP1xPs16UZPc",
  //             authDomain: "studyenglishapp-2593d.firebaseapp.com",
  //             projectId: "studyenglishapp-2593d",
  //             storageBucket: "studyenglishapp-2593d.firebasestorage.app",
  //             messagingSenderId: "493684934172",
  //             appId: "1:493684934172:web:990397a84add0995a501d9",
  //             measurementId: "G-5VXPWREWL0"));
  //   } else {
  //     await Firebase.initializeApp();
  //   }
  runApp(const MyApp());
  // } catch (e) {
  //   print("Error initializing Firebase: $e");
  // }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(), // Gọi MyHomePage để kiểm tra kích thước màn hình
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // Kiểm tra kích thước màn hình và chuyển đến giao diện tương ứng
    if (screenWidth > 760) {
      return const DesktopOnboarding(); // Giao diện Desktop lớn
    } else if (screenWidth > 500) {
      return const SmallDesktopOnboarding(); // Giao diện Desktop nhỏ
    } else {
      return const MobileOnboarding(); // Giao diện Mobile
    }
  }
}

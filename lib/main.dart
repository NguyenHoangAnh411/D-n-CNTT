import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_project/Desktop/desktop_onboarding.dart';
import 'package:my_project/Desktop/small_desktop_onboarding.dart';
import 'package:my_project/Mobile_Screen/mobile_onboarding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAfVbWWeKM7gO4Wb3hsHP12RXnsGjNJJq8",
            authDomain: "finalsoa-fae05.firebaseapp.com",
            projectId: "finalsoa-fae05",
            storageBucket: "finalsoa-fae05.appspot.com",
            messagingSenderId: "79853946102",
            appId: "1:79853946102:web:f7ce38cd4a766bca43d8d7",
            measurementId: "G-5QF5YT3B3R"));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth > 760) {
      return const DesktopOnboarding();
    } else if (screenWidth > 500) {
      return const SmallDesktopOnboarding();
    } else {
      return const MobileOnboarding();
    }
  }
}

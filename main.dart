import 'package:flutter/material.dart';
import 'package:wedding_organizer/views/screens/auth/signup.dart';
import 'package:wedding_organizer/views/screens/auth/login.dart';
import 'package:wedding_organizer/views/screens/auth/changepassword.dart';
import 'package:wedding_organizer/views/screens/auth/privacypolicy.dart';
import 'package:wedding_organizer/views/screens/profile/profile.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Signup.pageroute: (ctx) => const Signup(),
        Login.pageroute: (ctx) => const Login(),
        Profile.pageroute: (ctx) => const Profile(),
        Changepassword.pageroute: (ctx) => const Changepassword(),
        PrivacyPolicyScreen.pageroute: (ctx) => const PrivacyPolicyScreen(),
      },
      initialRoute: Login.pageroute,
    );
  }
}

import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  static const String pageroute = '/profile';
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Hello to profile'),),
    );
  }
}
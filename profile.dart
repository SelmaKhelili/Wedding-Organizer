import 'package:flutter/material.dart';
import 'package:wedding_organizer/views/widgets/bottomNavigationBar.dart';
import 'package:wedding_organizer/data/users.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatefulWidget {
  static const String pageroute = '/profile';
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final String currentUserEmail = ModalRoute.of(context)?.settings.arguments as String? ?? 'unknown@domain.com';
    final userData = users[currentUserEmail] ?? {};
    bool about = userData['role'] != null && userData['role'] != 'weddingowner';

    return Scaffold(
      body: Center(
        child:   
        Text('Profile'),
           ),
          bottomNavigationBar: BottomNavBar(currentRoute: '/profile'), // Use the BottomNavBar here
        );
      }
    }

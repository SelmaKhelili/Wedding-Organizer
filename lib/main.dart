import 'package:flutter/material.dart';
import 'package:wedding_organizer/views/screens/auth/signup.dart';
import 'package:wedding_organizer/views/screens/auth/login.dart';
import 'package:wedding_organizer/views/screens/auth/changepassword.dart';
import 'package:wedding_organizer/views/screens/auth/privacypolicy.dart';
import 'package:wedding_organizer/views/screens/profile/editprofile.dart';
import 'package:wedding_organizer/views/screens/profile/editprofilevendor.dart';
import 'package:wedding_organizer/views/screens/profile/profile.dart';
import 'package:wedding_organizer/views/screens/profile/security.dart';
import 'package:wedding_organizer/views/screens/profile/changemail.dart';
import 'package:wedding_organizer/views/screens/profile/changepassword.dart';
import 'package:wedding_organizer/views/screens/profile/changenumber.dart';





import 'package:wedding_organizer/views/screens/venues/venue.dart';
import 'package:wedding_organizer/views/screens/vendors/vendors.dart';
import 'package:wedding_organizer/views/screens/vendors/likedvendors.dart';
import 'package:wedding_organizer/views/screens/guests/guestlist.dart';
import 'package:wedding_organizer/views/screens/home/homepage.dart';

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
        Likevendors.pageroute: (ctx) => const Likevendors(),
        Guestlist.pageroute: (ctx) => const Guestlist(),
        Vendors.pageroute: (ctx) => const Vendors(),
        Venue.pageroute: (ctx) => const Venue(),
        Home.pageroute: (ctx) => const Home(),
        Editprofile.pageroute: (ctx) => const Editprofile(),
        EditprofileVendor.pageroute: (ctx) => const EditprofileVendor(),

        Security.pageroute: (ctx) => const Security(),
        Changemail.pageroute: (ctx) => const Changemail(),
        ChangePasswordProfile.pageroute: (ctx) => const ChangePasswordProfile(),
        ChangePhone.pageroute: (ctx) => const ChangePhone(),


      },
      initialRoute: Login.pageroute,
    );
  }
}

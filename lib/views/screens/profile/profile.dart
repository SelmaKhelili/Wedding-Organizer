import 'package:flutter/material.dart';
import 'package:wedding_organizer/views/screens/profile/security.dart';
import 'package:wedding_organizer/views/widgets/bottomNavigationBar.dart';
import 'package:wedding_organizer/data/users.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wedding_organizer/views/screens/auth/privacypolicy.dart';
import 'package:wedding_organizer/views/screens/profile/editprofile.dart';
import 'package:wedding_organizer/views/screens/profile/editprofilevendor.dart';



import 'dart:math' as math;

class Profile extends StatefulWidget {
  static const String pageroute = '/profile';
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.pink; // Match your theme

    // Draw a downward-facing arc, with only the central part visible
    canvas.drawArc(
      Rect.fromLTWH(
        -30,               // Start at the left edge
        -size.height,     // Shift the arc upward to crop the endpoints
        size.width+60,       // Full width of the screen
        size.height * 2,  // Increase the height to stretch the arc further
      ),
      0,       // Start angle (flat line at the top)
      math.pi, // Sweep angle (half-circle downward)
      false,   // No center fill
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}


class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {

    final String currentUserEmail = ModalRoute.of(context)?.settings.arguments as String? ?? 'unknown@domain.com';
    // Retrieve the user's data from the map.
    final userData = users[currentUserEmail] ?? {};
    bool about = userData['role'] != null && userData['role'] != 'weddingowner';

    return Scaffold(
      body: Center(
        child:   
            Stack(
          children: [
             Positioned(
                top: 0, // Position at the very top
                left: 0,
                right: 0,
                child: CustomPaint(
                  painter: MyPainter(),
                  size: Size(MediaQuery.of(context).size.width, 200), // Adjust arc height here
                ),
              ),
            DefaultTextStyle(
              style: GoogleFonts.poppins(color: Color.fromARGB(255, 0, 0, 0),),
              child:
              Padding(padding: EdgeInsets.all(16),
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
                  Stack(
            children: [ 
                    Column(
                    children: [
                     CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('lib/assets/images/profilepic.png'),
                    ),
                    Text(userData?['nickname'] ?? 'Unknown User', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24) ,),
                    Text( '$currentUserEmail | ${userData?['phone number'] ?? 'Unknown Phone'}',),
                    Visibility(
                      visible: about,
                      child:
                       Text( ' ${userData?['about'] ?? 'Write something about yourself'}',),
                    ),
                      ],),
                Positioned(
                      top: 50,
                      right:70,
                      child: 
                      Container(
                      width:50,
                      height:50,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 245, 245, 245),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child:
                      Icon(Icons.edit_outlined, color: const Color.fromARGB(255, 0, 0, 0),),
                      
                    ),),
                  ],
                ),
                SizedBox(height:16),
              Card(
                color: Colors.white,
                child: 
                Column(
                  children: [
              Padding(
                  padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                  child: GestureDetector(
                    onTap: () {
                      if(about == true)
                        {  Navigator.pushNamed(context, EditprofileVendor.pageroute, arguments: currentUserEmail);}
                      if(about == false)
                          { Navigator.pushNamed(context, Editprofile.pageroute, arguments: currentUserEmail);}
                          
                    },
              child: Container(
                decoration: BoxDecoration(),
                child: Row(
                  mainAxisSize: MainAxisSize.max, // This ensures the Row takes up full width
                  children: [
                    Icon(Icons.perm_identity),
                    Text('  Edit profile information'),
                  ],
                ),
              ),
            ),
          ),
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 16),
              child: GestureDetector(
                onTap: () {
                  // Navigate to notifications page
                },
                child: Container(
                  decoration: BoxDecoration(),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(Icons.notifications_none_outlined),
                      Text('  Notifications'),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
              child: GestureDetector(
                onTap: () {
                  // Navigate to language settings page
                },
                child: Container(
                  decoration: BoxDecoration(),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(Icons.translate),
                      Text('  Language'),
                    ],
                  ),
                ),
              ),
            ),
              ],
            ),
          ),      
      Card(
        color: Colors.white,
        child: 
          Column(
            children: [
              Padding(
                    padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Security.pageroute, arguments: currentUserEmail);

                      },
                child: Container(
                  decoration: BoxDecoration(),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(Icons.security_outlined),
                      Text('  Security'),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
              child: GestureDetector(
                onTap: () {
                  // Navigate to theme settings page
                },
                child: Container(
                  decoration: BoxDecoration(),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(Icons.collections_outlined),
                      Text('  Theme'),
                    ],
                  ),
                ),
              ),
            ),
              ],
            ),
          ),
    Card(
        color: Colors.white,
        child: 
        Column(
          children: [
              Padding(
                  padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                  child: GestureDetector(
                    onTap: () {
                      // Navigate to help & support page
                    },
                    child: Container(
                      decoration: BoxDecoration(),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(Icons.help_center_outlined),
                          Text('  Help & Support'),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                  child: GestureDetector(
                    onTap: () {
                      // Navigate to contact us page
                    },
                    child: Container(
                      decoration: BoxDecoration(),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(Icons.messenger_outline),
                          Text('  Contact us'),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, PrivacyPolicyScreen.pageroute);
                    },
                    child: Container(
                      decoration: BoxDecoration(),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(Icons.lock_outline),
                          Text('  Privacy Policy'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
              ),
              )
              ]
               ),          
               )
             ),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavBar(currentRoute: '/profile'), // Use the BottomNavBar here
        );
      }
    }
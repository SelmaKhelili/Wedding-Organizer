import 'package:flutter/material.dart';
import 'package:wedding_organizer/data/users.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wedding_organizer/screens/auth/changepassword.dart';
import 'package:wedding_organizer/screens/auth/signup.dart';
import 'package:wedding_organizer/screens/profile/profile.dart';

class Login extends StatefulWidget {
  static const String pageroute = '/login';

  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _loginemailController = TextEditingController();
  final TextEditingController _loginpasswordController = TextEditingController();
  final GlobalKey<FormState> _loginformkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  void _login(String email, String password) {
    if (_loginformkey.currentState?.validate() ?? false) {
      print('Login successful');
      if (mounted) {
        Navigator.pushNamed(
          context,
          Profile.pageroute,
          arguments: _loginemailController.text,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      SingleChildScrollView(child: 
      Stack(
        children: [
          // Background image
          
          // Main content
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome text
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 90),
                child: Text(
                  'Welcome!',
                  style: GoogleFonts.jomhuria(
                    fontSize: 80,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 234, 186, 210),
                  ),
                ),
              ),

              // New container including Login Now and the form
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 249, 234, 242), // Light pink background
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: DefaultTextStyle(
                  style: GoogleFonts.raleway(
                    fontSize: 15,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                       Padding(
                        padding: EdgeInsets.only(left:16),
                       child:
                        Text('Login Now',style: GoogleFonts.raleway(
                            fontSize: 25,
                            color: Color.fromARGB(255, 181, 88, 139),
                          ),),),
                        SizedBox(height: 20),
                        // Form container
                        Form(
                          key: _loginformkey,
                          child:
                           Container(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 234, 186, 210), // Background color
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 16, right: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 50),
                                  Text('    Email Address'),
                                  SizedBox(height: 2),
                                  TextFormField(
                                    controller: _loginemailController,
                                    validator: (email) {
                                      if (email == null || email.isEmpty) {
                                        return 'Please enter your email';
                                      }
                                      if (!email.contains('@') || !email.contains('.')) {
                                        return 'Please enter a valid email';
                                      }
                                      if (!users.containsKey(email)) {
                                        return 'This email is not registered';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25.0),
                                      ),
                                      hintText: 'Enter Email ID',
                                      hintStyle: GoogleFonts.poppins(color: const Color.fromARGB(255, 123, 123, 123)),
                                      filled: true,
                                      fillColor: Colors.white,
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25.0),
                                        borderSide: BorderSide(
                                          color: Color.fromARGB(255, 181, 88, 139),
                                          width: 2.0,
                                        ),
                                      ),
                                      suffixIcon: Icon(
                                        Icons.email,
                                        color: const Color.fromARGB(255, 123, 123, 123),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  // Password input
                                  Text('    Password'),
                                  SizedBox(height: 2),
                                  TextFormField(
                                    controller: _loginpasswordController,
                                    validator: (password) {
                                      if (password == null || password.isEmpty) {
                                        return 'Please enter your password';
                                      }
                                      if (users.containsKey(_loginemailController.text)) {
                                        if (users[_loginemailController.text]?['password'] != password) {
                                          return 'Incorrect password';
                                        }
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25.0),
                                      ),
                                      hintText: 'Enter Password',
                                      hintStyle: GoogleFonts.poppins(color: const Color.fromARGB(255, 103, 102, 103)),
                                      filled: true,
                                      fillColor: Colors.white,
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25.0),
                                        borderSide: BorderSide(
                                          color: Color.fromARGB(255, 181, 88, 139),
                                          width: 2.0,
                                        ),
                                      ),
                                      suffixIcon: Icon(
                                        Icons.lock,
                                        color: const Color.fromARGB(255, 123, 123, 123),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 40),
                                  Center(
                                    child: 
                                  Column( 
                                    children: [
                                        GestureDetector(
                                    onTap: () {
                                        Navigator.pushNamed(context, Changepassword.pageroute);
                                    },
                                    child: Text(
                                      'Forgot password?',
                                      style: TextStyle(
                                        color: const Color.fromARGB(255, 255, 255, 255),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                     ElevatedButton(
                                       onPressed: (){
                                        _login(_loginemailController.text, _loginpasswordController.text);
                                          },
                                          style: ElevatedButton.styleFrom(
                                          backgroundColor: Color.fromARGB(255, 196, 120, 158), 
                                          minimumSize: Size(250,50),
                                          shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15.0),  // Reduce the border radius to 15
                                          ),
                                          ),
                                           child: Text(
                                           'Login',
                                            style: GoogleFonts.raleway(color: const Color.fromARGB(255, 255, 255, 255), fontSize: 24, fontWeight: FontWeight.normal),
                                            ),
                                            ),
                                  ],
                                  ),
                                  ),
                                   SizedBox(height: 30),
                                        Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text('You do not have an account? '),
                                                GestureDetector(
                                                  onTap: () {
                                                    // Navigating to Signup screen
                                                    Navigator.pushNamed(context, Signup.pageroute);
                                                  },
                                                  child: Text(
                                                    'Signup',
                                                    style: TextStyle(
                                                      color: const Color.fromARGB(255, 255, 255, 255),
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                   SizedBox(height: 10),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  
                ),
              ),
            ],
          ),
          Positioned(
            top: 140,
            right: 10,
            child: Image.asset(
              'lib/assets/images/flowers2.png',
              width: 200,
              height: 200,
            ),
          ),
        ],
      ),
    )
      );
  }
}

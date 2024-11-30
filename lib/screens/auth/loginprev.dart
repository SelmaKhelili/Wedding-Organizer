/*import 'package:flutter/material.dart';
import 'package:wedding_organizer/data/users.dart';
import 'package:google_fonts/google_fonts.dart';
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
      // ignore: avoid_print
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
      resizeToAvoidBottomInset: true,
      body: Center(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 30.0,
                    left: 40.0,
                  ),
                  child: Text(
                    'Welcome!',
                    style: GoogleFonts.jomhuria(
                      fontSize: 96,
                      fontWeight: FontWeight.w900,
                      color: Color.fromARGB(255, 234, 186, 210),
                    ),
                  ),
                ),
                Flexible(
                  child: 
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 249, 234, 242),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.0),
                        topRight: Radius.circular(16.0),
                      ),
                    ),
                    child: DefaultTextStyle(
                      style: GoogleFonts.raleway(color: Color.fromARGB(255, 255, 255, 255)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              'Login Now',
                              style: GoogleFonts.raleway(fontSize: 25, color: Color.fromARGB(255, 181, 88, 139)),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(234, 186, 210, 1),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16.0),
                                  topRight: Radius.circular(16.0),
                                ),
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                      child: Form(
                                        key: _loginformkey,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(height: 15),
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
                                            SizedBox(height: 20),
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
                                            SizedBox(height: 20),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                ElevatedButton(
                                                  onPressed: () {
                                                    _login(_loginemailController.text, _loginpasswordController.text);
                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                    backgroundColor: Color.fromARGB(255, 196, 120, 158),
                                                    minimumSize: Size(250, 50),
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(15.0),
                                                    ),
                                                  ),
                                                  child: Text(
                                                    'Login',
                                                    style: GoogleFonts.raleway(color: const Color.fromARGB(255, 255, 255, 255), fontSize: 24, fontWeight: FontWeight.normal),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 10),
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
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 90,
                  right: 5,
                  child: Image.asset(
                    'lib/assets/images/flowers1.png',
                    fit: BoxFit.cover,
                    height: 110,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}*/

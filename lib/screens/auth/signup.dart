import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wedding_organizer/screens/auth/login.dart';
import 'package:wedding_organizer/screens/auth/privacypolicy.dart';
import 'package:wedding_organizer/screens/profile/profile.dart';
import 'package:wedding_organizer/data/users.dart';


class Signup extends StatefulWidget {
  static const String pageroute = '/signup';
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String role = 'None';
  bool _isCheckboxError = false; // Track checkbox validation error
  bool _isAgreed = false; // Track whether the checkbox is checked
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> _signupFormKey  = GlobalKey<FormState>();

void addUser(String email, String password) {
  // Check if the email already exists
  if (users.containsKey(email)) {
    // ignore: avoid_print
    print('User with this email already exists.');
    return;
  }
  // Generate a name from the email
  String generatedName = email.split('@')[0]; // Get the part before '@'
  List<String> parts = generatedName.split('.'); // Split by '.' if present
  generatedName = parts.map((part) => part[0].toUpperCase() + part.substring(1)).join(' '); // Capitalize each part
  // Add the user to the map
  users[email] = {
    'name': generatedName,
    'password': password,
    'role': role,
  };
  // ignore: avoid_print
  print('User added successfully: $generatedName');
}


void _register() {
  setState(() {
    _isCheckboxError = !_isAgreed;
  });
 

  if (!_isAgreed || _emailController.text.isEmpty || _passwordController.text.isEmpty ) {
    return;
  }

  // Proceed with the form validation if checkbox is checked
  if (_signupFormKey .currentState?.validate() ?? false) {
      addUser(_emailController.text, _passwordController.text);
    // ignore: avoid_print
    print('Registration successful');
    Navigator.pushNamed(context, Login.pageroute , arguments: _emailController.text);
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, 
      body: Center(
        child:
         Stack(
           children: [
             Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            Padding(
              padding: EdgeInsets.only(left:10, top:50),
              child:
               IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                size: 30, 
                weight: 5.0, 
              ), 
              color: Color.fromARGB(255, 197, 120, 159), 
              onPressed: () {
                Navigator.pop(context); 
              },
            ),
            ),
               Padding(
                    padding: const EdgeInsets.only(
                        left: 55.0,   
                      ),
                    child: Text(
                      'Hello!',
                      style: GoogleFonts.jomhuria(
                        fontSize: 87,
                      fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 234, 186, 210),),
                    ),
                  ),
                Expanded(
                  child:                 
                    Container(
                       decoration: BoxDecoration(
                       color: Color.fromARGB(255, 249, 234, 242), // Set the background color here
                      borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.0),  // Set top-left corner radius
                          topRight: Radius.circular(16.0), // Set top-right corner radius
                        ),),
                      child: 
                      DefaultTextStyle(
                        style: GoogleFonts.raleway(color: Color.fromARGB(255, 255, 255, 255),),
                        child:
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                 Padding(
                                  padding: const EdgeInsets.all(20.0), // left margin of 16
                                  child: Text(
                                        'Create a new account',
                                        style: GoogleFonts.raleway(fontSize: 25, color: Color.fromARGB(255, 181, 88, 139),),
                                       
                                      ),
                                ),
                              Expanded(
                                child:      
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(234, 186, 210, 1),
                                      borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(16.0),  // Set top-left corner radius
                                      topRight: Radius.circular(16.0), // Set top-right corner radius
                                        ),
                                    ),
                                    child: SingleChildScrollView(
                                      child: Column(
                                      children: [
                                        Padding(
                                      padding: const EdgeInsets.only(left: 16.0, right: 16.0), 
                                          child:
                                            Form(
                                              key: _signupFormKey  ,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start, 
                                                children: [
                                                 SizedBox(height: 15),
                                                  Text('    Email Address'),
                                                 SizedBox(height: 2),
                                                  TextFormField(
                                                    controller: _emailController,
                                                    validator: (email) {
                                                      if (email == null || email.isEmpty) {
                                                        return 'Please enter your email';
                                                      }
                                                      // Email regex to check if it's in the correct format
                                                      final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
                                                      if (!emailRegex.hasMatch(email)) {
                                                        return 'Please enter a valid email';
                                                      }
                                                      return null; // If email is valid
                                                      },
                                                    decoration: InputDecoration(
                                                      border: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(25.0),  // Set the border radius here
                                                      ),
                                                      hintText: 'Enter Email ID',
                                                      hintStyle: GoogleFonts.poppins(color: const Color.fromARGB(255, 123, 123, 123)), 
                                                       filled: true,  
                                                       fillColor: Colors.white, 
                                                        focusedBorder: OutlineInputBorder(
                                                          borderRadius: BorderRadius.circular(25.0), // Keep the same border radius
                                                          borderSide: BorderSide(
                                                            color: Color.fromARGB(255, 181, 88, 139), 
                                                            width: 2.0, 
                                                          ),
                                                        ),
                                                         suffixIcon: Icon(
                                                          Icons.email, // Use the email icon
                                                          color:  const Color.fromARGB(255, 123, 123, 123), // Set the icon color
                                                        ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 20), 
                                                  Text('    Password'),
                                                 SizedBox(height: 2),
                                                  TextFormField(
                                                    controller: _passwordController,
                                                    validator: (password) {
                                                      if (password == null || password.isEmpty) {
                                                        return 'Please enter your password';
                                                      }
                                                       if (password.length < 8) {
                                                          return 'Password must be at least 8 characters';
                                                        }
                                                        return null; // If password is valid
                                                      },
                                                    decoration: InputDecoration(
                                                      border: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(25.0),  // Set the border radius here
                                                      ),
                                                      hintText: 'Enter Password',
                                                      hintStyle: GoogleFonts.poppins(color: const Color.fromARGB(255, 103, 102, 103)), 
                                                       filled: true,  // Set the filled property to true
                                                       fillColor: Colors.white, 
                                                        focusedBorder: OutlineInputBorder(
                                                          borderRadius: BorderRadius.circular(25.0), // Keep the same border radius
                                                          borderSide: BorderSide(
                                                            color: Color.fromARGB(255, 181, 88, 139), 
                                                            width: 2.0, 
                                                          ),
                                                        ),
                                                         suffixIcon: Icon(
                                                          Icons.lock, // Use the email icon
                                                          color:  const Color.fromARGB(255, 123, 123, 123), // Set the icon color
                                                        ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 20), 
                                                  Text('    Confirm Password'),
                                                 SizedBox(height: 2),
                                                  TextFormField(
                                                    controller: _confirmPasswordController,
                                                     validator: (password) {
                                                      if (password == null || password.isEmpty) {
                                                        return 'Please enter your password';
                                                      }
                                                      if (password != _passwordController.text) {
                                                        return 'Passwords do not match';
                                                      }
                                                      return null;
                                                      },
                                                    decoration: InputDecoration(
                                                      border: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(25.0),  // Set the border radius here
                                                      ),
                                                      hintText: 'Confirm Password',
                                                      hintStyle: GoogleFonts.poppins(color: const Color.fromARGB(255, 103, 102, 103)), 
                                                       filled: true, 
                                                       fillColor: Colors.white,  
                                                       focusedBorder: OutlineInputBorder(
                                                          borderRadius: BorderRadius.circular(25.0), // Keep the same border radius
                                                          borderSide: BorderSide(
                                                            color: Color.fromARGB(255, 181, 88, 139), 
                                                            width: 2.0, 
                                                          ),
                                                        ),
                                                         suffixIcon: Icon(
                                                          Icons.lock, // Use the email icon
                                                          color:  const Color.fromARGB(255, 123, 123, 123), // Set the icon color
                                                        ),
                                                    ),
                                                    
                                                  ),
                                                  SizedBox(height: 20),
                                                  Text('    Are you a vendor or a venue owner?'),
                                                  SizedBox(height: 2),
                                               DropdownButtonFormField<String>(
                                                  value: role,
                                                  decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(20.0), // Set the border radius here
                                                    ),
                                                    filled: true,  // Set the filled property to true
                                                    fillColor: Colors.white,  // Set the background color to white
                                                    focusedBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(20.0),
                                                      borderSide: BorderSide(
                                                        color: Color.fromARGB(255, 181, 88, 139), // Pink border when focused
                                                        width: 2.0,
                                                      ),
                                                    ),
                                                  ),
                                                  items: [
                                                    DropdownMenuItem<String>(
                                                      value: 'None',
                                                      child: SizedBox(
                                                        width: 100,
                                                        child: Text(
                                                          'None',
                                                          style: TextStyle(color: Color.fromARGB(255, 103, 102, 103)), // Grey color text
                                                        ),
                                                      ),
                                                    ),
                                                    DropdownMenuItem<String>(
                                                      value: 'Vendor',
                                                      child: SizedBox(
                                                        width: 100, // Adjust width to fit content
                                                        child: Text(
                                                          'Vendor',
                                                          style: TextStyle(color: Color.fromARGB(255, 103, 102, 103)), // Grey color text
                                                        ),
                                                      ),
                                                    ),
                                                    DropdownMenuItem<String>(
                                                      value: 'Venue',
                                                      child: SizedBox(
                                                        width: 100, // Adjust width to fit content
                                                        child: Text(
                                                          'Venue Owner',
                                                          style: TextStyle(color: Color.fromARGB(255, 103, 102, 103)), // Grey color text
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                  onChanged: (value) {
                                                    setState(() {
                                                      role = value ?? 'None';
                                                    });
                                                  },
                                                  style: TextStyle(
                                                    color: const Color.fromARGB(255, 105, 105, 105), // Text color when not selected
                                                  ),
                                                ),
                                           Row(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(left: 16),
                                                child: Checkbox(
                                                  value: _isAgreed,
                                                  onChanged: (bool? newValue) {
                                                    setState(() {
                                                      _isAgreed = newValue ?? false;
                                                      _isCheckboxError = !_isAgreed;
                                                    });
                                                  },
                                                  side: BorderSide(
                                                    color: Colors.white, // Pink border when unchecked
                                                    width: 2.0, // Set the border width
                                                  ),
                                                  checkColor: Colors.white, // White checkmark color when selected
                                                  activeColor: Color.fromARGB(255, 197, 120, 159),
                                                ),
                                              ),
                                            GestureDetector(
                                                onTap: () {
                                                  Navigator.pushNamed(context, PrivacyPolicyScreen.pageroute);
                                                },
                                                child: Text(
                                                  'I agree to the privacy policy',
                                                  style: TextStyle(
                                                    color: Color.fromARGB(255, 197, 120, 159), // Blue text color to indicate it's a link
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),

                                          // Error message that shows if the checkbox is unchecked after clicking it
                                          if (_isCheckboxError)
                                            Padding(
                                              padding: const EdgeInsets.only(left: 16.0),
                                              child: Text(
                                                'You must agree to the privacy policy',
                                                style: TextStyle(color: Colors.red, fontSize: 12),
                                              ),
                                            ),
                                                  SizedBox(height: 20),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                     ElevatedButton(
                                                     onPressed: (){
                                                      _register();

                                                     },
                                                      style: ElevatedButton.styleFrom(
                                                        backgroundColor: Color.fromARGB(255, 196, 120, 158), 
                                                        minimumSize: Size(250,50),
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(15.0),  // Reduce the border radius to 15
                                                        ),
                                                      ),
                                                      child: Text(
                                                        'Register',
                                                         style: GoogleFonts.raleway(color: const Color.fromARGB(255, 255, 255, 255), fontSize: 24, fontWeight: FontWeight.normal),
                                                      ),
                                                    )
                                                    ],
                                                  ),
                                                 SizedBox(height: 10),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Text('You already have an account ? '),
                                                     GestureDetector(
                                                        onTap: () {
                                                          Navigator.pushNamed(context, Login.pageroute); // Navigate to login screen
                                                        },
                                                        child: Text(
                                                          'Login',
                                                          style: TextStyle(
                                                            color: Color.fromARGB(255, 255, 255, 255), // Adjust color as needed
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: 20,
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
                                    ) ),              
                              ),
                            ],
                          ),
                      ),
                    ),
                ),
              ],
                     ),
          Positioned(
                  top: 170, // Adjust top to position the flower where you want it
                  right: 1,
                  child: Image.asset(
                 'lib/assets/images/flowers1.png',
                 fit: BoxFit.cover,
                  height: 120, // Adjust height to control the size of the flower image
                  ),
      ),                     
           ],
         ),
      ),
    );
  }


}

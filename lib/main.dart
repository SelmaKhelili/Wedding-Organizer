import 'package:flutter/material.dart';
import 'package:zefeffete/features/venues/views/Venues.dart';
// Ensure this file exports a correct widget
import 'package:zefeffete/features/vendors/views/Vendors.dart';
import 'package:zefeffete/features/liked_vendors/LikedVendorsPage.dart';
import 'package:zefeffete/widgets/bottomNavigationBar.dart';
import 'package:zefeffete/features/liked_vendors/globals.dart';
import 'package:zefeffete/features/guests/views/GuestsPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smooth Bottom Navigation Demo',
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0; // Track the current index for navigation
  final PageController _pageController =
      PageController(); // Create a PageController

  // Define your pages
  final List<Widget> _pages = [
    HomePage(),
    Venues(), // Ensure this is defined correctly
    LikedVendorsPage(), // Ensure this is defined correctly
    GuestsPage(), // This should match your defined page
    VendorsPage(), // Ensure this is defined correctly
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index; // Update the current index
    });
    _pageController.jumpToPage(index); // Navigate to the selected page
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController, // Use the controller here
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index; // Update the current index on page change
          });
        },
        children: _pages,
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

// Define your pages below
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Center(child: Text("Home Page")),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Center(child: Text("Profile Page")),
    );
  }
}

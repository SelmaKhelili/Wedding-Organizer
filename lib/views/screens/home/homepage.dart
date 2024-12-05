import 'package:flutter/material.dart';
import 'package:wedding_organizer/views/widgets/bottomNavigationBar.dart';

class Home extends StatefulWidget {
  static const String pageroute = '/home';

  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context), // Go back to the previous screen
          icon: Icon(Icons.arrow_back_ios),
          tooltip: 'Back', // Tooltip for accessibility
        ),
        title: Text('Home'),
      ),
      bottomNavigationBar: BottomNavBar(currentRoute: '/home'), // Use the BottomNavBar here

    );
  }
}
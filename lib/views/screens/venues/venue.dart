import 'package:flutter/material.dart';
import 'package:wedding_organizer/views/widgets/bottomNavigationBar.dart';

class Venue extends StatefulWidget {
  static const String pageroute = '/venues';

  const Venue({super.key});

  @override
  State<Venue> createState() => _VenueState();
}

class _VenueState extends State<Venue> {
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context), // Go back to the previous screen
          icon: Icon(Icons.arrow_back_ios),
          tooltip: 'Back', // Tooltip for accessibility
        ),
        title: Text('Venue Details'),
      ),
            bottomNavigationBar: BottomNavBar(currentRoute: '/venues'), // Use the BottomNavBar here

    );
  }
}
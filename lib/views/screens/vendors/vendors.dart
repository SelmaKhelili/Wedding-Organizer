import 'package:flutter/material.dart';
import 'package:wedding_organizer/views/widgets/bottomNavigationBar.dart';


class Vendors extends StatefulWidget {
  static const String pageroute = '/vendors';

  const Vendors({super.key});

  @override
  State<Vendors> createState() => _VendorsState();
}

class _VendorsState extends State<Vendors> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context), // Go back to the previous screen
          icon: Icon(Icons.arrow_back_ios),
          tooltip: 'Back', // Tooltip for accessibility
        ),
        title: Text('Vendors '),
      ),
      bottomNavigationBar: BottomNavBar(currentRoute: '/vendors'), // Use the BottomNavBar here

    );
  }
}
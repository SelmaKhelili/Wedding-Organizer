import 'package:flutter/material.dart';
import 'package:wedding_organizer/views/widgets/bottomNavigationBar.dart';


class Guestlist extends StatefulWidget {
    static const String pageroute = '/guestsList';

  const Guestlist({super.key});

  @override
  State<Guestlist> createState() => _GuestlistState();
}

class _GuestlistState extends State<Guestlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context), // Go back to the previous screen
          icon: Icon(Icons.arrow_back_ios),
          tooltip: 'Back', // Tooltip for accessibility
        ),
        title: Text('Guest List'),
      ),
      bottomNavigationBar: BottomNavBar(currentRoute: '/guestsList'), // Use the BottomNavBar here

    );
  }
}
import 'package:flutter/material.dart';
import 'package:wedding_organizer/views/widgets/bottomNavigationBar.dart';


class Likevendors extends StatefulWidget {
  static const String pageroute = '/likedVendors';

  const Likevendors({super.key});

  @override
  State<Likevendors> createState() => _LikevendorsState();
}

class _LikevendorsState extends State<Likevendors> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context), // Go back to the previous screen
          icon: Icon(Icons.arrow_back_ios),
          tooltip: 'Back', // Tooltip for accessibility
        ),
        title: Text('Liked Vendors'),
      ),
      bottomNavigationBar: BottomNavBar(currentRoute: '/likedVendors'), // Use the BottomNavBar here

    );
  }
}
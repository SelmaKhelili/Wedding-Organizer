import 'package:flutter/material.dart';
import 'PhotographersPage.dart';
import 'CaterersPage.dart';
import 'DJsPage.dart';
import 'FloristsPage.dart';

class VendorsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            "Vendors",
            style: TextStyle(
              color: Colors.black,
              //fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          centerTitle: true,
          bottom: const TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: Colors.pinkAccent,
            indicatorColor: Colors.pink,
            indicatorWeight: 3.0,
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            tabs: [
              Tab(text: "Photographers"),
              Tab(text: "Caterers"),
              Tab(text: "DJs"),
              Tab(text: "Florists"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            PhotographersPage(),
            CaterersPage(),
            DJsPage(),
            FloristsPage(),
          ],
        ),
      ),
    );
  }
}

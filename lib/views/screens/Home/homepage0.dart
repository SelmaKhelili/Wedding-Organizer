import 'package:flutter/material.dart';
import 'package:zefeffete/views/widgets/bottomNavigationBar.dart';
import 'package:zefeffete/views/widgets/bestVenues.dart';
import 'package:zefeffete/views/widgets/popularVendors.dart';
import 'package:zefeffete/views/themes/simpleStyle.dart/homeStyle.dart';

class HomeScreen0 extends StatefulWidget {
  const HomeScreen0({super.key});

  @override
  State<HomeScreen0> createState() => _HomeScreen0State();
}

class _HomeScreen0State extends State<HomeScreen0> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: false,
            floating: false,
            expandedHeight: 70.0,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: RichText(
                text: TextSpan(
                  text: 'Welcome to',
                  style: welcomeMessage,
                  children: [
                    TextSpan(
                      text: ' Zefeffête',
                      style: appName,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Text(
                        'The best wedding organizer you will ever find!',
                        style: welcomeMessage,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                BestVenues(),
                PopularVendors(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(currentRoute: '/home'),
    );
  }
}

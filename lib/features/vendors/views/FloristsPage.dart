import 'package:flutter/material.dart';
import '../../../widgets/AppSearchBar.dart';

class FloristsPage extends StatelessWidget {
  const FloristsPage();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
          padding: EdgeInsets.only(top: 25, bottom: 20), child: AppSearchBar()),
      Center(
        child: Text(
          "Florists Section",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    ]);
  }
}

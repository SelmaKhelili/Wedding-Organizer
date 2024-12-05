import 'package:flutter/material.dart';

/// Service Question Text
class ServiceQuestion extends StatelessWidget {
  const ServiceQuestion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          "How was the service?",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 20),
        const Divider(
          color: Colors.grey,
          thickness: 1,
          height: 1,
          indent: 40,
          endIndent: 40,
        ),
        SizedBox(height: 20),
        Text(
          "Your overall rating",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.purple,
          ),
        ),
      ],
    );
  }
}

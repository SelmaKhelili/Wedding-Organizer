import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final String imageUrl;

  const ProfileImage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20),
      child: CircleAvatar(
        radius: 60,
        backgroundImage: NetworkImage(
          imageUrl, // Dynamic image URL
        ),
      ),
    );
  }
}

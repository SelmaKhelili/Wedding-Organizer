import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BestVenues extends StatefulWidget {
  const BestVenues({super.key});

  @override
  State<BestVenues> createState() => _BestVenuesState();
}

class _BestVenuesState extends State<BestVenues> {
  final List<Map<String, String>> venues = [
    {
      'title': 'Dreamsville House',
      'location': 'Algiers',
      'imagePath': 'assets/venue1.jpg',
      'distance': '1.8 km',
      'path': '/dummypath'
    },
    {
      'title': 'Ascot House',
      'location': 'Algiers',
      'imagePath': 'assets/venue2.jpg',
      'distance': '2.5 km',
      'path': '/dummypath'
    },
    {
      'title': 'Golden Plaza',
      'location': 'Algiers',
      'imagePath': 'assets/venue3.jpg',
      'distance': '3.0 km',
      'path': '/dummypath'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 10),
          child: Text(
            '''Best venues\nnear from you''',
            style:
                GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: venues.length,
            padding: EdgeInsets.only(left: 16),
            itemBuilder: (context, index) {
              final venue = venues[index];
              return _venueCard(venue['title']!, venue['location']!,
                  venue['imagePath']!, venue['distance']!, venue['path']!);
            },
          ),
        ),
      ],
    );
  }

  Widget _venueCard(String title, String location, String imagePath,
      String distance, String path) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, path);
      },
      child: Container(
        width: 200,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      size: 14,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      distance,
                      style: GoogleFonts.raleway(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 16,
              left: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.raleway(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    location,
                    style: GoogleFonts.raleway(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
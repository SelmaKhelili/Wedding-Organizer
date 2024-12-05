import 'package:flutter/material.dart';

class VenueDetailPage extends StatelessWidget {
  final Map<String, dynamic> venueData;

  const VenueDetailPage({required this.venueData, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(venueData['name']),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Image Section
            ClipRRect(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(16),
              ),
              child: Image.network(
                venueData['imageUrl'],
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            // Venue Info Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Phone
                  Row(
                    children: [
                      Icon(Icons.phone, color: Colors.pink, size: 18),
                      SizedBox(width: 8),
                      Text(
                        venueData['phone'],
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  // Location
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.pink, size: 18),
                      SizedBox(width: 8),
                      Text(
                        venueData['location'],
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  // Ratings
                  Row(
                    children: List.generate(
                      venueData['rating']['stars'].toInt(),
                      (index) =>
                          Icon(Icons.star, color: Colors.orange, size: 18),
                    )..addAll(
                        venueData['rating']['halfStar']
                            ? [
                                Icon(Icons.star_half,
                                    color: Colors.orange, size: 18)
                              ]
                            : [],
                      ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '${venueData['rating']['reviews']} reviews',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  SizedBox(height: 16),
                  // Review Button
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        // Action to navigate to review page or show a dialog
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: Text(
                        'Leave a Review',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
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

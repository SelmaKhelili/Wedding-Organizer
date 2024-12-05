import 'package:flutter/material.dart';
import 'package:zefeffete/features/venues/views/VenueDetailPage.dart';

class VenueCard extends StatelessWidget {
  final Map<String, dynamic> venueData;

  const VenueCard({required this.venueData, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          height: 332,
          width: 358,
          child: Column(
            children: [
              // Image Section
              ClipRRect(
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular(12), bottom: Radius.circular(12)),
                child: Image.network(
                  venueData['imageUrl'], // Use dynamic data
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              // Content Section
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Left Column (Name, Phone, Location)
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Title
                          Text(
                            venueData['name'], // Use dynamic data
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          // Phone
                          Row(
                            children: [
                              Icon(Icons.phone, color: Colors.pink, size: 18),
                              SizedBox(width: 8),
                              Text(
                                venueData['phone'], // Use dynamic data
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          // Location
                          Row(
                            children: [
                              Icon(Icons.location_on,
                                  color: Colors.pink, size: 18),
                              SizedBox(width: 8),
                              Text(
                                venueData['location'], // Use dynamic data
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Right Column (Ratings and Button)
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          // Ratings
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: List.generate(
                              venueData['rating']['stars'].toInt(),
                              (index) => Icon(Icons.star,
                                  color: Colors.orange, size: 14),
                            )..addAll(
                                venueData['rating']['halfStar']
                                    ? [
                                        Icon(Icons.star_half,
                                            color: Colors.orange, size: 14)
                                      ]
                                    : [],
                              ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '${venueData['rating']['reviews']} reviews',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          SizedBox(height: 16),
                          // View Details Button
                          SizedBox(
                            width: 116,
                            height: 32,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        VenueDetailPage(venueData: venueData),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.pink,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                padding: EdgeInsets.zero,
                              ),
                              child: Center(
                                // Center the text in the button
                                child: Text(
                                  'View details',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

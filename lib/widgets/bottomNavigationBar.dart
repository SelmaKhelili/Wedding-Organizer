import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onItemTapped;

  const BottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      margin: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Color.fromARGB(204, 248, 235, 242),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildNavItem(0, Icons.home, "Home"),
          _buildNavItem(1, Icons.location_on, "Venues"),
          _buildNavItem(2, Icons.favorite_border, "Liked Vendors"),
          _buildNavItem(3, Icons.group, "Guests"),
          _buildNavItem(4, Icons.menu, "Vendors"),
          _buildNavItem(5, Icons.person, "Profile"),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    final isSelected = currentIndex == index;
    return GestureDetector(
      onTap: () => onItemTapped(index), // Call the function to change the page
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? Color.fromARGB(153, 247, 117, 156)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected
                  ? Color.fromARGB(255, 158, 4, 86)
                  : Color.fromARGB(255, 247, 117, 156),
              size: 20,
            ),
            if (isSelected)
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  label,
                  style: TextStyle(
                      color: Color.fromARGB(255, 158, 4, 86), fontSize: 10),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

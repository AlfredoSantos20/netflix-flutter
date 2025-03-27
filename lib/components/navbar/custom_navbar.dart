import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, Colors.grey.shade200], // Light gradient effect
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
    
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.home, 0),
          _buildNavItem(Icons.favorite_border, 1),
          _buildNavItem(Icons.restaurant_menu, 2),
          _buildNavItem(Icons.person, 3),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: Icon(
        icon,
        color: selectedIndex == index ? Colors.green.shade900 : Colors.black54,
        size: 28,
      ),
    );
  }
}

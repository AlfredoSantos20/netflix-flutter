import 'package:flutter/material.dart';

class SocialIcon extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const SocialIcon({super.key, required this.icon, required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: color),
        ),
        child: Icon(icon, color: color, size: 30),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class GoogleIcon extends StatelessWidget {
  final String imagePath;
  final VoidCallback onTap;

  const GoogleIcon({super.key, required this.imagePath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey),
        ),
        child: Image.asset(
          imagePath,
          width: 30,
          height: 30,
          errorBuilder: (context, error, stackTrace) {
            return const Icon(Icons.error, color: Colors.red, size: 30);
          },
        ),
      ),
    );
  }
}

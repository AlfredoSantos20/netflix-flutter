import 'package:flutter/material.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  final int step; // Current step (1, 2, or 3)

  const ProgressIndicatorWidget({super.key, required this.step});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100.0, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(3, (index) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300), 
            width: index == step - 1 ? 40 : 10,
            height: 6,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              color: index == step - 1 ? const Color(0xFF20402A) : Colors.grey[300],
              borderRadius: BorderRadius.circular(3),
            ),
          );
        }),
      ),
    );
  }
}

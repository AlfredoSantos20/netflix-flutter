import 'package:flutter/material.dart';

class SocialAuth {
  static void handleSocialLogin(String platform, BuildContext context) {
    print('$platform login clicked');

    // Show modal bottom sheet
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.info_outline,
                color: Colors.orangeAccent,
                size: 40,
              ),
              const SizedBox(height: 12),
              Text(
                '$platform Login Coming Soon!',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'We\'re working hard to bring you this feature. Stay tuned!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Close the modal
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF20402A),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                ),
                child: const Text(
                  'OK',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

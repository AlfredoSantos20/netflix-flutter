import 'package:ecom/screens/step1_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen2 extends StatelessWidget {
  const SplashScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  const Color(0xFF20402A), // Dark Green
      body: Stack(
        children: [
          // Curved Bottom Design
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipPath(
              clipper: BottomClipPath(),
              child: Container(
                height: 300,
                color: const Color.fromRGBO(240, 185, 11, 1),
              ),
            ),
          ),

          // Center Content
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/logos/logos.png', height: 200), 
                const SizedBox(height: 10),
                const Text(
                  "FoodyHub",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 30),

                // Continue Button
                SizedBox(
                  width: 250,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const Step1Screen()),
                        );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text("Continue"),
                  ),
                ),

                const SizedBox(height: 10),

                // Login Prompt
                TextButton(
                  onPressed: () {
                    // Navigate to login screen
                  },
                  child: const Text(
                    "Already have an account? Click here",
                    style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Custom Clipper for Bottom Curve
class BottomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height - 50);
    path.quadraticBezierTo(size.width / 2, size.height + 50, size.width, size.height - 50);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

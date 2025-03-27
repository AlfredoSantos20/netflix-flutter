import 'package:flutter/material.dart';
import 'dart:async';

import 'splash_screen2.dart';

class SplashScreen1 extends StatefulWidget {
  const SplashScreen1({super.key});

  @override
  _SplashScreen1State createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late double _orangePosition; // Controls the vertical position of the orange background

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();

    // Start animation after a short delay
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final screenHeight = MediaQuery.of(context).size.height;
      
      setState(() {
        _orangePosition = 0; // Start at the top
      });

      Future.delayed(const Duration(milliseconds: 1200), () {
        setState(() {
          _orangePosition = screenHeight; // Move the orange container down
        });
      });

      // Navigate after the animation completes
      Future.delayed(const Duration(milliseconds: 2200), () {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 600),
            pageBuilder: (_, __, ___) => const SplashScreen2(),
            transitionsBuilder: (_, animation, __, child) {
              return FadeTransition(opacity: animation, child: child);
            },
          ),
        );
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(240, 185, 11, 1),
      body: Stack(
        children: [
          // Orange Background that smoothly slides down
          AnimatedPositioned(
            duration: const Duration(milliseconds: 1000),
            curve: Curves.easeInOutQuad,
            top: _orangePosition, // Moves the container down
            left: 0,
            right: 0,
            height: screenHeight,
            child: Container(color: const Color(0xFF20402A)),
          ),

          // Curved Top Design
          Align(
            alignment: Alignment.topCenter,
            child: ClipPath(
              clipper: TopClipPath(),
              child: Container(
                height: 150,
                color:  const Color.fromRGBO(240, 185, 11, 1),
              ),
            ),
          ),

          // Centered Logo with Fade Animation
          Center(
            child: FadeTransition(
              opacity: _fadeAnimation,
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Custom Clipper for Top Curve
class TopClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(size.width / 2, size.height, size.width, size.height - 50);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

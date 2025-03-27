import 'package:ecom/authenticated/login.dart';
import 'package:ecom/components/bouncing_widget.dart';
import 'package:ecom/components/progress.dart';
import 'package:flutter/material.dart';


class Step3Screen extends StatelessWidget {
  const Step3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F5EE),
      body: SafeArea(
        child: Column(
          children: [
            // Progress Indicator (Step 3)
            const ProgressIndicatorWidget(step: 3),

            const Spacer(),

          BouncingWidget(
            child:
             Image.asset(
              'assets/logos/earth.png',
              height: 160,
            ),
            ),
          

            const SizedBox(height: 20),

            // Title
            const Text(
              "Save Planet",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF20402A),
              ),
            ),

            const SizedBox(height: 8),

            // Subtitle
            const Text(
              "Make a sustainable difference with\nevery meal you choose with FoodyHub",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),

            const Spacer(),

            // Get Started Button
            Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                       Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Login()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 120),
                    backgroundColor: const Color(0xFF20402A), // Dark green
                  ),
                  child: const Text(
                    "Get Started",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

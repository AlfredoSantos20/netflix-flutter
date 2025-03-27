import 'package:ecom/components/bouncing_widget.dart';
import 'package:ecom/components/progress.dart';
import 'package:ecom/screens/step3_screen.dart';
import 'package:flutter/material.dart';


class Step2Screen extends StatelessWidget {
  const Step2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F5EE),
      body: SafeArea(
        child: Column(
          children: [
            // Progress Indicator (Step 2)
            const ProgressIndicatorWidget(step: 2),

            const Spacer(),

            BouncingWidget(
              child:
               Image.asset(
              'assets/images/img3.png',
              height: 150,
            ),
            ),
           

            const SizedBox(height: 20),

            // Title
            const Text(
              "Save Money",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF20402A),
              ),
            ),

            const SizedBox(height: 8),

            // Subtitle
            const Text(
              "Savor your favorites at unbeatable\nprices with FoodyHub",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),

            const Spacer(),

            // Next Button
            Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                   Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            const Step3Screen(),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
                    backgroundColor: const Color(0xFF20402A),
                  ),
                  child: const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 36,
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

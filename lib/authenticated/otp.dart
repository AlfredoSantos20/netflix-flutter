import 'package:ecom/authenticated/register.dart';
import 'package:flutter/material.dart';

class Otp extends StatefulWidget {
  const Otp({super.key});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F0),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => {
             Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Register()),
            )
          },
        ),
        title: const Text(
          'OTP Verification',
          style: TextStyle(
            color: Color(0xFF20402A),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           const SizedBox(height: 20),
            const Image(
              image: AssetImage('assets/images/img6.png'), 
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 20),
            const Text(
              'Enter the 6 digit OTP sent to email',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const Text(
              'am******@**.com',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            const Align(
              alignment: Alignment.center,
              child: Text(
                'OTP',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: () {},
              child: const Text(
                "Didn't Receive the OTP? Click here to resend",
                style: TextStyle(color: Color(0xFF20402A), fontSize: 14),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF20402A),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Verify',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

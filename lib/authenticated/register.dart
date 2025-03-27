import 'package:ecom/authenticated/login.dart';
import 'package:ecom/authenticated/otp.dart';
import 'package:ecom/components/socials/google_icon.dart';
import 'package:ecom/components/socials/social_auth.dart';
import 'package:ecom/components/socials/social_icon.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _termsAccepted = false;

  void _register() {
    if (!_termsAccepted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("You must accept the Terms & Conditions to register."),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Simulate successful registration
    // ScaffoldMessenger.of(context).showSnackBar(
    //   const SnackBar(
    //     content: Text("Account created successfully! Redirecting to login..."),
    //     backgroundColor: Colors.green,
    //   ),
    // );

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Otp()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Create an account',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 24),
            _buildInputField(icon: Icons.person, hintText: 'Email', obscureText: false),
            const SizedBox(height: 16),
            _buildInputField(
              icon: Icons.lock,
              hintText: 'Password',
              obscureText: _obscurePassword,
              onToggle: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
            ),
            const SizedBox(height: 16),
            _buildInputField(
              icon: Icons.lock,
              hintText: 'Confirm Password',
              obscureText: _obscureConfirmPassword,
              onToggle: () {
                setState(() {
                  _obscureConfirmPassword = !_obscureConfirmPassword;
                });
              },
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Checkbox(
                  value: _termsAccepted,
                  onChanged: (bool? newValue) {
                    setState(() {
                      _termsAccepted = newValue ?? false;
                    });
                  },
                ),
                const Text('I agree to the '),
                GestureDetector(
                  onTap: _showTermsPopup,
                  child: const Text(
                    'Terms & Conditions',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _register,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF20402A),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text(
                'Create Account',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            const SizedBox(height: 24),
            const Text('- OR Continue with -', textAlign: TextAlign.center, style: TextStyle(fontSize: 14)),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GoogleIcon(imagePath: 'assets/logos/googlelogo.png', onTap: () => SocialAuth.handleSocialLogin('Google', context)),
                const SizedBox(width: 16),
                SocialIcon(icon: Icons.apple, color: Colors.black, onTap: () => SocialAuth.handleSocialLogin('Apple', context)),
                const SizedBox(width: 16),
                SocialIcon(icon: Icons.facebook, color: Colors.blue, onTap: () => SocialAuth.handleSocialLogin('Facebook', context)),
              ],
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('I Already Have an Account? '),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Login()),
                    );
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Color(0xFF20402A), fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField({required IconData icon, required String hintText, required bool obscureText, VoidCallback? onToggle}) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        suffixIcon: onToggle != null
            ? IconButton(
                icon: Icon(obscureText ? Icons.visibility : Icons.visibility_off),
                onPressed: onToggle,
              )
            : null,
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  void _showTermsPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Terms & Conditions"),
          content: const SingleChildScrollView(
            child: Text(
              "By using this app, you agree to our Terms & Conditions. Make sure to review them before proceeding.",
              textAlign: TextAlign.justify,
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text("Close")),
          ],
        );
      },
    );
  }
}

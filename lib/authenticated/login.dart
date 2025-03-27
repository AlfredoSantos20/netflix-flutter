import 'package:ecom/authenticated/forgot_password.dart';
import 'package:ecom/authenticated/register.dart';
import 'package:ecom/components/socials/google_icon.dart';
import 'package:ecom/components/socials/social_auth.dart';
import 'package:ecom/components/socials/social_icon.dart';
import 'package:ecom/screens/home_screen.dart';
import 'package:flutter/material.dart';  // Import the social authentication utility

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscurePassword = true;

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
              'Welcome Back!',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.person),
                hintText: 'Username or Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              obscureText: _obscurePassword,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(_obscurePassword ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
                hintText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                     Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ForgotPassword()),
                    );
                },
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(color: Color(0xFF20402A)),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                 Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomeScreen()),
                    );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF20402A),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text(
                'Login',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              '- OR Continue with -',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),

            /// **Clickable Social Icons**
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GoogleIcon(
                  imagePath: 'assets/logos/googlelogo.png',
                  onTap: () => SocialAuth.handleSocialLogin('Google', context),
                ),
                const SizedBox(width: 16),
                SocialIcon(
                  icon: Icons.apple,
                  color: Colors.black,
                  onTap: () => SocialAuth.handleSocialLogin('Apple', context),
                ),
                const SizedBox(width: 16),
                SocialIcon(
                  icon: Icons.facebook,
                  color: Colors.blue,
                  onTap: () => SocialAuth.handleSocialLogin('Facebook', context),
                ),
              ],
            ),

            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Create An Account '),
                GestureDetector(
                  onTap: () {          
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Register()),
                    );          
                  },
                  child: const Text(
                    'Sign Up',
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
}

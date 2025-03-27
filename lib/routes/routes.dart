
import 'package:ecom/authenticated/forgot_password.dart';
import 'package:ecom/authenticated/login.dart';
import 'package:ecom/authenticated/otp.dart';
import 'package:ecom/authenticated/register.dart';
import 'package:ecom/components/cards/card_profile.dart';
import 'package:ecom/screens/filters.dart';
import 'package:ecom/screens/home_screen.dart';
import 'package:ecom/screens/step1_screen.dart';
import 'package:ecom/screens/step2_screen.dart';
import 'package:ecom/splash/splash_screen1.dart';
import 'package:ecom/splash/splash_screen2.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String splash1 = '/';
  static const String splash2 = '/splash2';
  static const String step1 = '/step1';
  static const String step2 = '/step2';
  static const String login = '/login';
  static const String register = '/register';
  static const String otp = '/otp';
  static const String forgotpass = '/forgotpass';
  static const String homescreen = '/homescreen';
  static const String filter = '/filter';
  static const String cardProfile = '/cardProfile';

  static Map<String, WidgetBuilder> routes = {
    splash1: (context) => const SplashScreen1(),
    splash2: (context) => const SplashScreen2(),
    step1: (context) => const Step1Screen(),
    step2: (context) => const Step2Screen(),
    login: (context) => const Login(),
    register: (context) => const Register(),
    otp: (context) => const Otp(),
    forgotpass: (context) => const ForgotPassword(),
    homescreen: (context) => const HomeScreen(),
    filter:(context) => const Filters(),
    cardProfile: (context) => const CardProfile(),
  };
}

import 'package:contact_dairy_app/presentations/screens/add_contact_page/add_contact_page.dart';
import 'package:contact_dairy_app/presentations/screens/counter/counter_screen.dart';
import 'package:contact_dairy_app/presentations/screens/details/details_screen.dart';
import 'package:contact_dairy_app/presentations/screens/home/home_screen.dart';
import 'package:contact_dairy_app/presentations/screens/intro/intro_screen.dart';
import 'package:contact_dairy_app/presentations/screens/splash/splash_screen.dart';
import 'package:contact_dairy_app/start/login/login_screen.dart';
import 'package:contact_dairy_app/start/signup/signup_screen.dart';
import 'package:flutter/cupertino.dart';

class AppRoutes {
  static String splashscreen = '/';
  static String introscreen = 'intro_screen';
  static String loginscreen = 'login_screen';
  static String signupscreen = 'signup_screen';
  static String homepage = 'home_page';
  static String counterPage = 'counter_page';
  static String addContactPage = 'add_contact_page';
  static String detailsPage = 'details_page';

  static Map<String, WidgetBuilder> routes = {
    AppRoutes.splashscreen: (context) => const SplashScreen(),
    AppRoutes.introscreen: (context) => const IntroScreen(),
    AppRoutes.loginscreen: (context) => const LoginScreen(),
    AppRoutes.signupscreen: (context) => const SignUpScreen(),
    AppRoutes.homepage: (context) => const HomeScreen(),
    AppRoutes.counterPage: (context) => const CounterPage(),
    AppRoutes.addContactPage: (context) => const AddContactPage(),
    detailsPage: (context) => const DetailsScreen(),
  };
}

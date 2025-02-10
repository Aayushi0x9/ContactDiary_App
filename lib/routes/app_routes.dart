import 'package:contact_dairy_app/presentations/hide/hide_screen.dart';
import 'package:contact_dairy_app/presentations/practice/bottomnavigationBB.dart';
import 'package:contact_dairy_app/presentations/practice/pageview.dart';
import 'package:contact_dairy_app/presentations/screens/add_contact_page/add_contact_page.dart';
import 'package:contact_dairy_app/presentations/screens/counter/counter_screen.dart';
import 'package:contact_dairy_app/presentations/screens/details/details_screen.dart';
import 'package:contact_dairy_app/presentations/screens/home/home_screen.dart';
import 'package:contact_dairy_app/presentations/screens/intro/intro_screen.dart';
import 'package:contact_dairy_app/presentations/screens/splash/splash_screen.dart';
import 'package:contact_dairy_app/presentations/start/login/login_screen.dart';
import 'package:contact_dairy_app/presentations/start/signup/signup_screen.dart';
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
  static String hidePage = 'hide_page';
  static String bottomNav = 'bottom_nav';
  static String pageView = 'page_view';

  static Map<String, WidgetBuilder> routes = {
    AppRoutes.splashscreen: (context) => const SplashScreen(),
    AppRoutes.introscreen: (context) => const IntroScreen(),
    AppRoutes.loginscreen: (context) => const LoginScreen(),
    AppRoutes.signupscreen: (context) => const SignUpScreen(),
    AppRoutes.homepage: (context) => const HomeScreen(),
    AppRoutes.counterPage: (context) => const CounterPage(),
    AppRoutes.addContactPage: (context) => const AddContactPage(),
    AppRoutes.detailsPage: (context) => const DetailsScreen(),
    AppRoutes.hidePage: (context) => const HideScreen(),
    AppRoutes.bottomNav: (context) => HomeBNB(),
    AppRoutes.pageView: (context) => const PageviewPage(),
  };
}

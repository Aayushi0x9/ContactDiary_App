import 'package:contact_dairy_app/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: CupertinoColors.white,
        scaffoldBackgroundColor: CupertinoColors.secondarySystemBackground,
        appBarTheme: const AppBarTheme(
          color: CupertinoColors.secondarySystemBackground,
          titleTextStyle: TextStyle(
            color: CupertinoColors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          centerTitle: true,
        ),
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            color: CupertinoColors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          titleMedium: TextStyle(
            color: CupertinoColors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          labelMedium: TextStyle(
            fontSize: 18,
            color: CupertinoColors.black,
          ),
        ),
        iconTheme: const IconThemeData(color: CupertinoColors.black),
        fontFamily: 'SF-Pro',
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorSchemeSeed: CupertinoColors.black,
        scaffoldBackgroundColor: CupertinoColors.secondarySystemFill,
        appBarTheme: const AppBarTheme(
          color: CupertinoColors.secondarySystemFill,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: CupertinoColors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: CupertinoColors.white),
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            color: CupertinoColors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          titleMedium: TextStyle(
            color: CupertinoColors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          labelMedium: TextStyle(
            fontSize: 18,
            color: CupertinoColors.white,
          ),
        ),
        fontFamily: 'SF-Pro',
      ),
      themeMode: ThemeMode.system,
      initialRoute: AppRoutes.homepage,
      routes: AppRoutes.routes,
    );
  }
}

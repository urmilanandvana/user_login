import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:login_with_auth/screen/home_screen.dart';
import 'package:login_with_auth/screen/login_scree.dart';
import 'package:login_with_auth/screen/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final preferences = await SharedPreferences.getInstance();
  var email = preferences.getString('email');

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "splash_page",
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSwatch().copyWith(primary: const Color(0xff942D17)),
      ),
      routes: {
        '/': (context) => const HomePage(),
        'login_page': (context) => const LoginPage(),
        'splash_page': (context) => const SplashScreen(),
      },
    ),
  );
}

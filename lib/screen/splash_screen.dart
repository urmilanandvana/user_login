import 'dart:async';

import 'package:flutter/material.dart';
import 'package:login_with_auth/screen/home_screen.dart';
import 'package:login_with_auth/screen/login_scree.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    final preferences = await SharedPreferences.getInstance();
    var email = preferences.getString('email');

    Timer(Duration(seconds: 3), () {
      (email == null)
          ? Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (_) => LoginPage()))
          : Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (_) => HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/esra-afsar-uAHfdNJ2z3g-unsplash.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.only(bottom: 50),
              child: Text(
                "Welcome..",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          const Positioned(
              bottom: 120,
              left: 175,
              child: CircularProgressIndicator(
                color: Colors.white,
              )),
        ],
      ),
    );
  }
}

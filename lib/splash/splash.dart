import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import '../pages/homepage.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 5,
      navigateAfterSeconds: new Homepage(),
      title: new Text(
        'Coronavirus Tracker',
        style: new TextStyle(fontWeight: FontWeight.w900, fontSize: 27.0),
      ),
      image: new Image.asset("assets/covid.png"),
      photoSize: 80.0,
      backgroundColor: Colors.orange,
      loaderColor: Colors.black,
      loadingText: Text("Designed & Developed By Zaid Bashir",
          style: new TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0)),
    );
  }
}

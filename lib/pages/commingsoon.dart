import 'package:flutter/material.dart';

import 'countryPage.dart';

class CommingSoon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Comming Soon"),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => CountryPage()));
            }),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Image.asset("assets/commingsoon.jpg"),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
                child: Text(
              "Search Feature will be implemented soon,sorry for inconvenience",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w800,
              ),
            )),
          ),
        ],
      ),
    );
  }
}

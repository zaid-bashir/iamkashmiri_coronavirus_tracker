import 'package:flutter/material.dart';

import 'homepage.dart';

class AboutDeveloper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<bool> _onBackPressed() {
      return showDialog(
          context: context,
          builder: (context) => AlertDialog(
                backgroundColor: Colors.white,
                title: Text("Do You Really Want To Exit From App"),
                content: Text(
                  "From Coronavirus Tracker",
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontFamily: "monospace",
                      color: Colors.blue,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w700),
                ),
                actions: <Widget>[
                  FlatButton(
                    color: Colors.green,
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                    child: Text("No"),
                  ),
                  FlatButton(
                    color: Colors.red,
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    child: Text("Yes"),
                  ),
                ],
              ));
    }

    return WillPopScope(
      onWillPop: _onBackPressed,
      child: MaterialApp(
        title: "Coronavirus Tracker",
        routes: {
          "home": (context) => Homepage(),
        },
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.orange,
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Homepage()));
                }),
            title: Text("About Developer"),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "About",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 24.0,
                      fontWeight: FontWeight.w900),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Container(
                  child: CircleAvatar(
                      maxRadius: 70.0, child: Image.asset("assets/covid.png")),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Designed & Developed By Zaid Bashir",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      // decoration: TextDecoration.underline,
                      fontSize: 20.0,
                      color: Colors.redAccent,
                      fontWeight: FontWeight.w900),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Organisation : ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          // decoration: TextDecoration.underline,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'monospace'),
                    ),
                    Text(
                      "ProgrammerRockers",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'monospace'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text(
                      "Send bugs and Suggestions to : ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          // decoration: TextDecoration.underline,
                          fontStyle: FontStyle.italic,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      "developer.zaidwani@gmail.com",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.red,
                          fontStyle: FontStyle.italic,
                          decoration: TextDecoration.underline,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
              ),
              // Divider(
              //   height: 5,
              //   thickness: 5,
              // ),
              // Padding(
              //   padding: EdgeInsets.all(10),
              //   child: Column(
              //     children: [
              //       Padding(
              //         padding: EdgeInsets.all(10.0),
              //         child: Text(
              //           "About Me",
              //           textAlign: TextAlign.center,
              //           style: TextStyle(
              //               decoration: TextDecoration.underline,
              //               fontSize: 24.0,
              //               fontWeight: FontWeight.w900),
              //         ),
              //       ),
              //       Container(
              //         width: double.infinity,
              //         child: Card(
              //           shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(10.0),
              //           ),
              //           color: Colors.white,
              //           elevation: 10,
              //           child: Column(
              //             children: <Widget>[
              //               ButtonTheme(
              //                 child: ButtonBar(
              //                   children: <Widget>[
              //                     Column(
              //                       children: [
              //                         Padding(
              //                           padding: EdgeInsets.all(10),
              //                           child: Text(
              //                             "I Zaid Bashir, a Computer Science Student currently Pursuing Bachelor's of Computer Application from GDC Baramulla.I am Currently working on a Software Developer Profile",
              //                             textAlign: TextAlign.justify,
              //                             style: TextStyle(
              //                                 fontSize: 20.0,
              //                                 fontStyle: FontStyle.normal,
              //                                 fontWeight: FontWeight.normal),
              //                           ),
              //                         ),
              //                       ],
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

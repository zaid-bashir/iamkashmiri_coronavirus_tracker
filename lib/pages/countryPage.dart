import 'dart:ui';

import 'package:iamkashmiri_coronavirus_tracker/pages/commingsoon.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'homepage.dart';

class CountryPage extends StatefulWidget {
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  List countryData; //list variable(
  fetchCountryData() async {
    http.Response response =
        await http.get('https://corona.lmao.ninja/v2/countries');
    print(response.body);
    setState(() {
      countryData =
          json.decode(response.body); //decoding string format to json format
    });
  }

  @override
  void initState() {
    super.initState();
    fetchCountryData();
  }

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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Country Data'),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Homepage()));
              }),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CommingSoon()));
              },
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Icon(
                  Icons.search,
                  semanticLabel: "Search Here",
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: "Refresh Page",
          backgroundColor: Colors.orange,
          foregroundColor: Colors.black,
          child: Icon(Icons.refresh),
          onPressed: () {
            setState(() {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => CountryPage()));
            });
          },
        ),
        body: countryData == null
            ? Center(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Icon(Icons.wifi_off_outlined,size: 60,),
                      CircularProgressIndicator(),
                      SizedBox(
                        height: 20,
                      ),
                      //Text("Not Connected with Internet",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w800),),
                      Text(
                        "Loading Data...",
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                ),
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    height: 130,
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                          color: Colors.grey[100],
                          blurRadius: 10,
                          offset: Offset(0, 10))
                    ]),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              Text(
                                countryData[index]['country'],
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Image.network(
                                countryData[index]['countryInfo']['flag'],
                                height: 40,
                                width: 50,
                              )
                            ],
                          ),
                        ),
                        Expanded(
                            child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'CONFIRMED' +
                                    countryData[index]['cases'].toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red),
                              ),
                              Text(
                                  'ACTIVE' +
                                      countryData[index]['cases'].toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue)),
                              Text(
                                  'RECOVERED' +
                                      countryData[index]['cases'].toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green)),
                              Text(
                                  'DEATHS' +
                                      countryData[index]['cases'].toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[800])),
                            ],
                          ),
                        ))
                      ],
                    ),
                  );
                },
                itemCount: countryData == null ? 0 : countryData.length,
              ),
      ),
    );
  }
}

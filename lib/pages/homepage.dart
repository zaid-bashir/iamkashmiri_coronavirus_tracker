import 'package:iamkashmiri_coronavirus_tracker/Panels/mosteffectedcountries.dart';
import 'package:iamkashmiri_coronavirus_tracker/Panels/worldwidepanel.dart';
import 'package:iamkashmiri_coronavirus_tracker/pages/aboutdeveloper.dart';
import 'package:iamkashmiri_coronavirus_tracker/pages/countryPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Panels/infopanel.dart';
import 'countryPage.dart';
import 'package:flutter_offline/flutter_offline.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Map worldData; //map variable
  //fetching worldwide data...
  fetchWorldWideData() async {
    http.Response response = await http.get('https://corona.lmao.ninja/v2/all');
    setState(() {
      worldData =
          json.decode(response.body); //decoding string format to json format
    });
  }

  List countryData; //list variable
  fetchCountryData() async {
    http.Response response =
        await http.get('https://corona.lmao.ninja/v2/countries');
    print(response.body);
    setState(() {
      countryData =
          json.decode(response.body); //decoding string format to json format
    });
  }

  Widget connectionStatus() {
    return Builder(builder: (BuildContext context) {
      return OfflineBuilder(
        connectivityBuilder: (BuildContext context,
            ConnectivityResult connectivity, Widget child) {
          final bool connected = connectivity != ConnectivityResult.none;
          return Stack(
            fit: StackFit.expand,
            children: [
              child,
              Positioned(
                left: 0.0,
                right: 0.0,
                height: 32.0,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  color: connected ? Colors.green : Colors.red,
                  child: connected
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "ONLINE",
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              width: 8.0,
                            ),
                            SizedBox(
                              width: 12.0,
                              height: 12.0,
                              // child: CircularProgressIndicator(
                              //   strokeWidth: 2.0,
                              //   valueColor:
                              //       AlwaysStoppedAnimation<Color>(Colors.white),
                              // ),
                            ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "OFFLINE",
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              width: 8.0,
                            ),
                            SizedBox(
                              width: 12.0,
                              height: 12.0,
                              // child: CircularProgressIndicator(
                              //   strokeWidth: 2.0,
                              //   valueColor:
                              //       AlwaysStoppedAnimation<Color>(Colors.white),
                              // ),
                            ),
                          ],
                        ),
                ),
              ),
            ],
          );
        },
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "OFFLINE / ",
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.w900),
              ),
              Text(
                "ONLINE",
                style:
                    TextStyle(color: Colors.green, fontWeight: FontWeight.w900),
              ),
            ],
          ),
        ),
      );
    });
  }

  @override
  void initState() {
    fetchWorldWideData();
    fetchCountryData();
    super.initState();
  }

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
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.orange,
            title: Text("Coronavirus Tracker"),
            centerTitle: false,
          ),
          floatingActionButton: FloatingActionButton(
            tooltip: "Refresh Page",
            backgroundColor: Colors.orange,
            foregroundColor: Colors.black,
            child: Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Homepage()));
              });
            },
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  //header of drawer
                  decoration: BoxDecoration(
                    color: Colors.orange,
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Coronavirus Tracker',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                      CircleAvatar(
                        backgroundImage: ExactAssetImage("assets/covid.png"),
                        // backgroundColor: Colors.blue[900],
                        maxRadius: 50.0,
                      ),
                    ],
                  ),
                ),
                ListTile(
                  //menu item of Drawer
                  leading: Icon(Icons.home),
                  title: Text('Home Page'),
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Homepage()),
                    ); //con //context of drawer is different
                  },
                ),
                ListTile(
                  leading: Icon(Icons.info),
                  title: Text('Country Wise Details'),
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => CountryPage()),
                    ); //context of drawer is different
                  },
                ),
                ListTile(
                  leading: Icon(Icons.developer_mode_outlined),
                  title: Text('About Developer'),
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => AboutDeveloper()),
                    ); //co //context of drawer is different
                  },
                ),
                ListTile(
                    onTap: () {
                      Navigator.pop(context); //context of drawer is different
                    },
                    leading: Icon(Icons.close),
                    title: Text("Close Drawer"))
              ],
            ),
          ),
          body: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 30,
                alignment: Alignment.center,
                padding: EdgeInsets.all(0),
                color: Colors.white,
                child: connectionStatus(),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        'WorldWide Data',
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 26,
                            color: Colors.purple),
                      ),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.transparent,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CountryPage()));
                      },
                      child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.black,
                          ),
                          child: Text(
                            'Country Wise',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 19,
                                color: Colors.white),
                          )),
                    ),
                  ],
                ),
              ),
              worldData == null
                  ? Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, right: 10),
                          child: Icon(
                            Icons.refresh,
                            size: 40,
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              "Not Connected with Internet",
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.w800),
                            ),
                            Text(
                              "Please Refresh the Page",
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                      ],
                    )
                  : WorldwidePanel(
                      worldData: worldData,
                    ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Text(
                  'Most affected Countries',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 22),
                ),
              ),
              countryData == null
                  ? Container()
                  : MostAffectedPanel(
                      countryData: countryData,
                    ),
              Infopanel(),
              SizedBox(
                height: 10,
              ),
              Center(
                  child: Text(
                'Made with ❤️ from Kashmir India',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              )),
            ],
          )),
        ),
      ),
    );
  }
}

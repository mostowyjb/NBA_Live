import 'package:flutter/material.dart';
import 'package:flutter_application_1/api_manager.dart';
import 'package:flutter_application_1/pagerbody.dart';
import 'package:flutter_application_1/gamebody.dart';
import 'package:flutter_application_1/soccermodel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SoccerApp(),
    );
  }
}

class SoccerApp extends StatefulWidget {
  const SoccerApp({Key? key}) : super(key: key);

  @override
  _SoccerAppState createState() => _SoccerAppState();
}

class _SoccerAppState extends State<SoccerApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: Color(0xFFFAFAFA),
        elevation: 0.0,
        title: Text(
          "SCORERBOARD",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      //now we have finished the api service let's call it
      //Now befo re we create Our layout let's create our API service
      body: FutureBuilder<List<SoccerMatch>>(
        future: SoccerApi()
            .getAllMatches(), //Here we will call our getData() method,
        builder: (context, snapshot) {
          //the future builder is very intersting to use when you work with api
          if (snapshot.hasData) {
            return PageBody(snapshot.data!, context);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }, // here we will buil the app layout
      ),
    );
  }
}

class GameScreen extends StatelessWidget {
  final String data;
  final String idHome;
  final String idAway;

  const GameScreen(
      {Key? key,
      required this.data,
      required this.idHome,
      required this.idAway})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: Color(0xFF4373D9),
        elevation: 0.0,
        title: Text(
          "SCORERBOARD",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      //now we have finished the api service let's call it
      //Now befo re we create Our layout let's create our API service
      body: FutureBuilder<SoccerMatch>(
        future: SoccerApi()
            .getMatcheById(this.data), //Here we will call our getData() method,
        builder: (context, snapshot) {
          //the future builder is very intersting to use when you work with api
          if (snapshot.hasData) {
            return GameBody(snapshot.data!, context);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }, // here we will buil the app layout
      ),
    );
  }
}

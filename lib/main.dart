import 'package:flutter/material.dart';
import 'package:flutter_application_1/api_manager.dart';
import 'package:flutter_application_1/pagerbody.dart';
import 'package:flutter_application_1/gamebody.dart';
import 'package:flutter_application_1/playerbody.dart';
import 'package:flutter_application_1/playermodel.dart';
import 'package:flutter_application_1/soccermodel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAFAFA),
        elevation: 0.0,
        title: const Text(
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
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }, // here we will buil the app layout
      ),
    );
  }
}

class PlayerScreen extends StatelessWidget {
  final String data;

  const PlayerScreen({
    Key? key,
    required this.data,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    debugPrint(data);
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: const Color(0xFF4373D9),
        elevation: 0.0,
        title: const Text(
          "PLAYER",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      //now we have finished the api service let's call it
      //Now befo re we create Our layout let's create our API service
      body: FutureBuilder<PlayerModel>(
        future: SoccerApi()
            .getPlayerById(data), //Here we will call our getData() method,
        builder: (context, snapshot) {
          //the future builder is very intersting to use when you work with api
          if (snapshot.hasData) {
            return PlayerBody(snapshot.data!, context);
          } else if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          } else {
            return const Center(
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
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: const Color(0xFF4373D9),
        elevation: 0.0,
        title: const Text(
          "SCORERBOARD",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      //now we have finished the api service let's call it
      //Now befo re we create Our layout let's create our API service
      body: FutureBuilder<SoccerMatch>(
        future: SoccerApi()
            .getMatcheById(data), //Here we will call our getData() method,
        builder: (context, snapshot) {
          //the future builder is very intersting to use when you work with api
          if (snapshot.hasData) {
            return GameBody(snapshot.data!, context);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }, // here we will buil the app layout
      ),
    );
  }
}

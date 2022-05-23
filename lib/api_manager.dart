import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:flutter_application_1/soccermodel.dart';

class SoccerApi {
  //now let's set our variables
  //first : let's add the endpoint URL
  // we will get all the data from api-sport.io
  // we will just change our endpoint
  //the null means that the match didn't started yet
  //let's fix that
  final String apiUrl = "https://www.balldontlie.io/api/v1/games";
  final String apiUrlStats = "https://www.balldontlie.io/api/v1/stats/";

  //Now we will create our method
  //but before this we need to create our model

  //Now we finished with our Model
  Future<List<SoccerMatch>> getAllMatches() async {
    Response res = await get(Uri.parse(apiUrl));
    var body;

    if (res.statusCode == 200) {
      // this mean that we are connected to the data base
      body = jsonDecode(res.body);
      List<dynamic> matchesList = body['data'] as List;
      List<SoccerMatch> matches = matchesList
          .map((dynamic item) => SoccerMatch.fromJson(item))
          .toList();
      return matches;
    } else {
      throw "Error";
    }
  }

  Future<SoccerMatch> getMatcheById(String id) async {
    Response res = await get(Uri.parse("$apiUrl/$id"));
    var body, game;

    if (res.statusCode == 200) {
      // this mean that we are connected to the data base
      body = jsonDecode(res.body);
      List<dynamic> matchesList = [];
      matchesList.add(body);
      debugPrint('oui ${matchesList.runtimeType}');

      try {
        List<SoccerMatch> matches = matchesList
            .map((dynamic item) => SoccerMatch.fromJson(item))
            .toList();
        debugPrint('tes2 ${matches[0]}');
        return matches[0];
      } on Exception catch (_) {
        print("throwing new error");
        throw Exception("Error on server");
      }
    } else {
      throw "Error";
    }
  }

  Future<SoccerMatch> getStatMatcheById(String id) async {
    Response res = await get(Uri.parse("$apiUrlStats?game_ids[]=$id"));
    var body = [];
    var teamHome = [];
    var teamAway = [];

    if (res.statusCode == 200) {
      // this mean that we are connected to the data base
      body = jsonDecode(res.body);
      List<dynamic> matchesList = [];
      matchesList.add(body);
      debugPrint('oui $body');

      try {
        List<SoccerMatch> matches = matchesList
            .map((dynamic item) => SoccerMatch.fromJson(item))
            .toList();
        return matches[0];
      } on Exception catch (_) {
        print("throwing new error");
        throw Exception("Error on server");
      }
    } else {
      throw "Error";
    }
  }
}

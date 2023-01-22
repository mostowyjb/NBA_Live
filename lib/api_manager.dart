import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:flutter_application_1/soccermodel.dart';
import 'package:flutter_application_1/playermodel.dart';
import 'package:http/http.dart' as http;

class SoccerApi {
  //now let's set our variables
  //first : let's add the endpoint URL
  // we will get all the data from api-sport.io
  // we will just change our endpoint
  //the null means that the match didn't started yet
  //let's fix that
  final String apiUrl = "https://www.balldontlie.io/api/v1/games";
  final String apiUrlStats = "https://www.balldontlie.io/api/v1/stats";
  final String apiUrlPlayers = "https://www.balldontlie.io/api/v1/players";

  //Now we will create our method
  //but before this we need to create our model

  //Now we finished with our Model
  Future<List<SoccerMatch>> getAllMatches() async {
    Response res = await get(Uri.parse(apiUrl));

    if (res.statusCode == 200) {
      // this mean that we are connected to the data base
      var body = jsonDecode(res.body);
      debugPrint(body['data'][0]['home_team']['name']);
      var urlHome =
          "https://serpapi.com/search?q=${body['data'][0]['home_team']['name'].toString()}+logo+basketball+small&api_key=933fe8d80a623ccabd384d10815c80d79d2a9d5a97887bf53aa764debd8285a9&tbm=isch&ijn=0";

      var urlVisitor =
          "https://serpapi.com/search?q=${body['data'][0]['visitor_team']['name'].toString()}+logo+basketball+small&api_key=933fe8d80a623ccabd384d10815c80d79d2a9d5a97887bf53aa764debd8285a9&tbm=isch&ijn=0";
      Response resHome = await get(Uri.parse(urlHome));
      var bodyHome = jsonDecode(resHome.body);
      var imgHome = bodyHome['images_results'][0]['thumbnail'] as String;
      Response resAway = await get(Uri.parse(urlVisitor));
      var bodyAway = jsonDecode(resAway.body);
      var imgAway = bodyAway['images_results'][0]['thumbnail'] as String;
      debugPrint('ici² ${imgAway}');
      List<dynamic> matchesList = body['data'] as List;
      List<SoccerMatch> matches = matchesList
          .map((dynamic item) => SoccerMatch.fromJson(item, imgHome, imgAway))
          .toList();
      return matches;
    } else {
      throw "Error";
    }
  }

  Future<SoccerMatch> getMatcheById(String id) async {
    Response res = await get(Uri.parse("$apiUrl/$id"));

    if (res.statusCode == 200) {
      // this mean that we are connected to the data base
      var body = jsonDecode(res.body);
      List<dynamic> matchesList = [];
      matchesList.add(body);
      try {
        var urlHome =
            "https://serpapi.com/search?q=${body['home_team']['name'].toString()}+logo+basketball+small&api_key=933fe8d80a623ccabd384d10815c80d79d2a9d5a97887bf53aa764debd8285a9&tbm=isch&ijn=0";

        var urlVisitor =
            "https://serpapi.com/search?q=${body['visitor_team']['name'].toString()}+logo+basketball+small&api_key=933fe8d80a623ccabd384d10815c80d79d2a9d5a97887bf53aa764debd8285a9&tbm=isch&ijn=0";
        Response resHome = await get(Uri.parse(urlHome));
        var bodyHome = jsonDecode(resHome.body);
        var imgHome = bodyHome['images_results'][0]['thumbnail'] as String;
        debugPrint('ici²');
        Response resAway = await get(Uri.parse(urlVisitor));
        var bodyAway = jsonDecode(resAway.body);
        var imgAway = bodyAway['images_results'][0]['thumbnail'] as String;

        debugPrint('test : $urlVisitor');

        List<SoccerMatch> matches = matchesList
            .map((dynamic item) => SoccerMatch.fromJson(item, imgHome, imgAway))
            .toList();
        return matches[0];
      } on Exception catch (_) {
        throw Exception("Error on server");
      }
    } else {
      throw "Error";
    }
  }

  Future<List<dynamic>> getStatMatcheById(String id, String team) async {
    Response res = await get(Uri.parse("$apiUrlStats?game_ids[]=$id"));
    if (res.statusCode == 200) {
      // this mean that we are connected to the data base
      var body = jsonDecode(res.body);
      int size = body['meta']['total_count'];
      body = body['data'];
      int homeTeamId = body[0]['game']['home_team_id'] as int;
      int awayTeamId = body[0]['game']['visitor_team_id'] as int;

      List<dynamic> homePlayers = [];
      List<dynamic> visitorPlayers = [];

      try {
        for (var i = 0; i < size; i++) {
          if (body[i]['team']['id'] == homeTeamId) {
            homePlayers.add(body[i]['player']);
          } else if (body[i]['team']['id'] == awayTeamId) {
            visitorPlayers.add(body[i]['player']);
          }
        }
        if (team == 'home') {
          return homePlayers;
        } else {
          return visitorPlayers;
        }
      } on Exception catch (error) {
        throw Exception(error);
      }
    } else {
      throw "Error";
    }
  }

  Future<PlayerModel> getPlayerById(String id) async {
    Response res = await get(Uri.parse("$apiUrlPlayers/$id"));
    if (res.statusCode == 200) {
      // this mean that we are connected to the data base
      var body = jsonDecode(res.body);
      List<dynamic> playersList = [];
      playersList.add(body);
      var team = jsonEncode(playersList[0]['team']);

      try {
        var urltesr =
            "https://serpapi.com/search?q=${playersList[0]['first_name'].toString()}+${playersList[0]['last_name'].toString()}+${team[0].toString()}+dribble+background+transparent&tbs=ic:trans&api_key=933fe8d80a623ccabd384d10815c80d79d2a9d5a97887bf53aa764debd8285a9&tbm=isch&ijn=0";

        Response res2 = await get(Uri.parse(urltesr), headers: {
          'Access-Control-Allow-Origin': '*',
          'Access-Control-Allow-Credentials': 'true',
          'Access-Control-Allow-Headers':
              'Origin, Content-Type, X-Amz-Date, Authorization, X-Api-Key, X-Amz-Security-Token, locale',
          'Access-Control-Allow-Methods': 'GET, POST',
          'Access-Control-Max-Age': '86400',
        });
        var bodyUrl = jsonDecode(res2.body);
        var url = bodyUrl['images_results'][0]['original'] as String;
        List<PlayerModel> players = playersList
            .map((dynamic item) => PlayerModel.fromJson(item, url))
            .toList();

        return players[0];
      } on Exception catch (e) {
        throw e;
      }
    } else {
      throw "Error";
    }
  }
}

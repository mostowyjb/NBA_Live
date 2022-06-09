import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class SoccerMatch {
  //here we will see the different data
  //you will find every thing you need in the doc
  //I'm not going to use every data, just few ones

  Fixture fixture;
  Team home;
  Team away;
  Goal goal;

  SoccerMatch(this.fixture, this.home, this.away, this.goal);

  factory SoccerMatch.fromJson(
      Map<Object, dynamic> json, String urlHome, String urlVisitor) {
    var format = DateFormat('dd/MM/yyyy');
    var dateWOH = json['date'].split('T');
    var dateWOUTC = dateWOH[0].split(' ');
    var date = format.format(DateTime.parse(dateWOUTC[0]));
    return SoccerMatch(
        Fixture.fromJson(json['id'].toString(), date),
        Team.fromJson(json['home_team'], urlHome),
        Team.fromJson(json['visitor_team'], urlVisitor),
        Goal.fromJson(json['home_team_score'], json['visitor_team_score']));
  }
}

//here we will store the fixture
class Fixture {
  String id;
  String date;
  Fixture(this.id, this.date);

  factory Fixture.fromJson(String id, String date) {
    debugPrint('Fixture');
    return Fixture(id, date);
  }
}

//here we will store the Team data
class Team {
  int id;
  String abbreviation;
  String city;
  String conference;
  String division;
  String fullName;
  String name;
  String teamImg;
  Team(this.id, this.abbreviation, this.city, this.conference, this.division,
      this.fullName, this.name, this.teamImg);

  factory Team.fromJson(Map<String, dynamic> json, String url) {
    return Team(
        json['id'],
        json['abbreviation'].toString(),
        json['city'].toString(),
        json['conference'].toString(),
        json['division'].toString(),
        json['full_name'].toString(),
        json['name'].toString(),
        url);
  }
}

//here we will store the Goal data
class Goal {
  int home;
  int away;
  Goal(this.home, this.away);

  //Now we will create a factory method to copy the data from
  // the json file
  factory Goal.fromJson(int home, int away) {
    return Goal(home, away);
  }
}

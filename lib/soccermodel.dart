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

  factory SoccerMatch.fromJson(Map<Object, dynamic> json) {
    debugPrint(json['home_team'].toString());
    var format = DateFormat('dd/MM/yyyy');
    var date = format.format(DateTime.parse(json['date'].toString()));
    return SoccerMatch(
        Fixture.fromJson(json['id'].toString(), date),
        Team.fromJson(json['home_team']),
        Team.fromJson(json['visitor_team']),
        Goal.fromJson(json['home_team_score'], json['visitor_team_score']));
  }
}

//here we will store the fixture
class Fixture {
  String id;
  String date;
  Fixture(this.id, this.date);

  factory Fixture.fromJson(String id, String date) {
    return Fixture(id, date);
  }
}

//here we will store the Status
class Status {
  int elapsedTime;
  String long;
  Status(this.elapsedTime, this.long);

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(json['elapsed'], json['long']);
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
  Team(this.id, this.abbreviation, this.city, this.conference, this.division,
      this.fullName, this.name);

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(json['id'], json['abbreviation'], json['city'],
        json['conference'], json['division'], json['full_name'], json['name']);
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
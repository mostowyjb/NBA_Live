class PlayerModel {
  //here we will see the different data
  //you will find every thing you need in the doc
  //I'm not going to use every data, just few ones

  FixturePlayer fixture;
  TeamPlayer team;
  String firstName;
  String lastName;
  String position;
  String heightFeet;
  String heighInches;
  String weightPounds;
  String image;

  PlayerModel(
      this.fixture,
      this.team,
      this.firstName,
      this.lastName,
      this.heighInches,
      this.heightFeet,
      this.weightPounds,
      this.position,
      this.image);

  factory PlayerModel.fromJson(Map<Object, dynamic> json, String url) {
    return PlayerModel(
        FixturePlayer.fromJson(json['id'].toString()),
        TeamPlayer.fromJson(json['team']),
        json['first_name'].toString(),
        json['last_name'].toString(),
        json['height_inches'].toString(),
        json['height_feet'].toString(),
        json['weight_pounds'].toString(),
        json['position'].toString(),
        url.toString());
  }
}

//here we will store the fixture
class FixturePlayer {
  String id;
  FixturePlayer(this.id);

  factory FixturePlayer.fromJson(String id) {
    return FixturePlayer(id);
  }
}

//here we will store the Team data
class TeamPlayer {
  int id;
  String abbreviation;
  String city;
  String conference;
  String division;
  String fullName;
  String name;
  TeamPlayer(this.id, this.abbreviation, this.city, this.conference,
      this.division, this.fullName, this.name);

  factory TeamPlayer.fromJson(Map<String, dynamic> json) {
    return TeamPlayer(
        json['id'],
        json['abbreviation'].toString(),
        json['city'].toString(),
        json['conference'].toString(),
        json['division'].toString(),
        json['full_name'].toString(),
        json['name'].toString());
  }
}

//here we will store the Goal data


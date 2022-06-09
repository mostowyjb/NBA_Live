import 'package:flutter/material.dart';
import 'soccermodel.dart';
import 'main.dart';

void _navigateToNextScreen(
    BuildContext context, String id, String idHome, String idAway) {
  Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => GameScreen(
            data: id,
            idHome: idHome,
            idAway: idAway,
          )));
}

Widget matchTile(SoccerMatch match, context) {
  var homeGoal = match.goal.home;
  var awayGoal = match.goal.away;
  if (homeGoal == null) homeGoal = 0;
  if (awayGoal == null) awayGoal = 0;

  return InkWell(
      onTap: () {
        _navigateToNextScreen(context, match.fixture.id,
            match.home.id.toString(), match.away.id.toString());
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                match.home.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ),
            Expanded(
              child: Text(
                "${homeGoal} - ${awayGoal}",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ),
            Expanded(
              child: Text(
                match.away.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ));
}

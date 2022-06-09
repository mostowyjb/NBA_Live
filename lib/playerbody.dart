import 'package:flutter/material.dart';
import 'package:flutter_application_1/playermodel.dart';

// ignore: non_constant_identifier_names
Widget PlayerBody(PlayerModel player, context) {
  return SingleChildScrollView(
    child: Column(
      children: [
        const SizedBox(
          height: 60,
        ),
        CircleAvatar(
          radius: 60,
          backgroundImage: NetworkImage(player.image),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          "${player.firstName} ${player.lastName}",
          style: const TextStyle(
              fontSize: 25.0,
              color: Colors.blueGrey,
              letterSpacing: 2.0,
              fontWeight: FontWeight.w400),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "${player.team.abbreviation}, ${player.team.name}",
          style: const TextStyle(
              fontSize: 18.0,
              color: Colors.black45,
              letterSpacing: 2.0,
              fontWeight: FontWeight.w300),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "${player.team.fullName} , ${player.team.division}",
          style: const TextStyle(
              fontSize: 15.0,
              color: Colors.black45,
              letterSpacing: 2.0,
              fontWeight: FontWeight.w300),
        ),
        const SizedBox(
          height: 50,
        ),
        const Card(
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
            elevation: 2.0,
            child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "A propos",
                  style: TextStyle(
                      letterSpacing: 2.0, fontWeight: FontWeight.w300),
                ))),
        const SizedBox(
          height: 15,
        ),
        Card(
          margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      const Text(
                        "Taille",
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 22.0,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Text(
                        "${player.heightFeet} ft",
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 22.0,
                            fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        "Poids",
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 22.0,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "${player.weightPounds} lbs",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22.0,
                            fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Card(
          margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      const Text(
                        "Pointure",
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 22.0,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Text(
                        "${player.heighInches} US",
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 22.0,
                            fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      const Text(
                        "Poste",
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 22.0,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Text(
                        player.position,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 22.0,
                            fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
      ],
    ),
  );
}

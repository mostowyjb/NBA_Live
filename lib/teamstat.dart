import 'package:flutter/material.dart';

Widget teamStat(String team, String abr, String conf, String img) {
  debugPrint(img);
  return Expanded(
    child: Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(img),
        ),
        Text(
          team,
          style: const TextStyle(
            fontSize: 18.0,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          abr,
          style: const TextStyle(
            fontSize: 18.0,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          conf,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 18.0,
          ),
        ),
      ],
    ),
  );
}

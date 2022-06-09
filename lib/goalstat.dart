// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';

Widget goalStat(String expandedTime, int homeGoal, int awayGoal) {
  var home = homeGoal;
  var away = awayGoal;
  if (home == null) home = 0;
  if (away == null) away = 0;
  return Expanded(
    child: Column(
      children: [
        Text(
          expandedTime,
          style: const TextStyle(
            fontSize: 20.0,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          "${home} - ${away}",
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 25.0,
          ),
        ),
      ],
    ),
  );
}

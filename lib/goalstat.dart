// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';

Widget goalStat(String expandedTime, int homeGoal, int awayGoal) {
  var home = homeGoal;
  var away = awayGoal;
  if (home == null) home = 0;
  if (away == null) away = 0;
  return Expanded(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          expandedTime,
          style: const TextStyle(
            fontSize: 20.0,
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              "${home} - ${away}",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 26.0,
              ),
            ),
          ),
        )
      ],
    ),
  );
}

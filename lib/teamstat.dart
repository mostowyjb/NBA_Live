import 'package:flutter/material.dart';

Widget teamStat(String team, String abr, String conf) {
  return Expanded(
    child: Column(
      children: [
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

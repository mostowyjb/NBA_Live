// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import '../flutter_flow/flutter_flow_theme.dart';

Widget goalStat(dynamic context, int homeGoal, int awayGoal) {
  var home = homeGoal;
  var away = awayGoal;
  if (home == null) home = 0;
  if (away == null) away = 0;
  return Expanded(
    child: Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        SelectionArea(
            child: Text(
          '$homeGoal - $awayGoal',
          textAlign: TextAlign.center,
          style: FlutterFlowTheme.of(context).bodyText1.override(
                fontFamily: 'Poppins',
                color: Color(0xFFF3EED9),
                fontSize: 16,
              ),
        )),
      ],
    ),
  );
}

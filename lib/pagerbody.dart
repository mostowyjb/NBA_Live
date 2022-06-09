import 'package:flutter/material.dart';
import 'package:flutter_application_1/matchtile.dart';
import 'package:flutter_application_1/teamstat.dart';
import 'package:flutter_application_1/goalstat.dart';
import 'soccermodel.dart';

Widget PageBody(List<SoccerMatch> allmatches, context) {
  return Column(
    children: [
      Expanded(
        flex: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              teamStat(allmatches[0].home.name, allmatches[0].home.abbreviation,
                  allmatches[0].home.conference),
              goalStat(allmatches[0].fixture.date, allmatches[0].goal.home,
                  allmatches[0].goal.away),
              teamStat(allmatches[0].away.name, allmatches[0].away.abbreviation,
                  allmatches[0].away.conference),
            ],
          ),
        ),
      ),
      Expanded(
        flex: 5,
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xFF4373D9),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "MATCHES",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: allmatches.length,
                    itemBuilder: (context, index) {
                      return matchTile(allmatches[index], context);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      )
    ],
  );
}

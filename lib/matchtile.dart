import 'package:flutter/material.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import 'soccermodel.dart';
import 'main.dart';

void _navigateToNextScreen(
    BuildContext context, String id, String idHome, String idAway) {
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => GameScreen(
              key: UniqueKey(),
              data: id,
              idHome: idHome,
              idAway: idAway,
            )),
  );
}

Widget matchTile(SoccerMatch match, BuildContext context) {
  var homeGoal = match.goal.home;
  var awayGoal = match.goal.away;
  if (homeGoal == null) homeGoal = 0;
  if (awayGoal == null) awayGoal = 0;

  return Padding(
    padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
    child: InkWell(
      onTap: () {
        _navigateToNextScreen(context, match.fixture.id,
            match.home.id.toString(), match.away.id.toString());
      },
      child: Container(
        width: 100,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: const [
            BoxShadow(
              blurRadius: 4,
              color: Color(0x33000000),
              offset: Offset(0, 2),
            )
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0, 0),
                    child: Container(
                      width: 60,
                      height: 60,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.network(
                        match.home.teamImg,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 1),
                    child: SelectionArea(
                        child: Text(
                      '${match.home.name}',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            color: Color(0xFF202020),
                            fontSize: 16,
                          ),
                    )),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SelectionArea(
                      child: Text(
                    '$homeGoal - $awayGoal',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Poppins',
                          color: Color(0xFF202020),
                          fontSize: 16,
                        ),
                  )),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0, 0),
                    child: Container(
                      width: 60,
                      height: 60,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.network(
                        match.away.teamImg,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SelectionArea(
                      child: Text(
                    match.away.name,
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Poppins',
                          color: Color(0xFF202020),
                          fontSize: 16,
                        ),
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

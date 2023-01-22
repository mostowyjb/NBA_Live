import 'package:flutter/material.dart';
import '../flutter_flow/flutter_flow_theme.dart';
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

  return Padding(
    padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
    child: InkWell(
      onTap: () async {},
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
                      width: 50,
                      height: 75,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        'images/lb.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 1),
                    child: SelectionArea(
                        child: Text(
                      'Team 1',
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
                    '125 -118',
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
                    alignment: AlignmentDirectional(0, 0),
                    child: Container(
                      width: 50,
                      height: 50,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        'images/flutter_ui_dev_logo_dark.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SelectionArea(
                      child: Text(
                    'Team 2',
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

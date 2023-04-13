import 'package:flutter/material.dart';
import '../flutter_flow/flutter_flow_theme.dart';

Widget teamStat(String team, String img, dynamic context) {
  return Expanded(
    child: Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Align(
          alignment: const AlignmentDirectional(0, 0),
          child: Container(
            width: 120,
            height: 120,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Image.network(
              img,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
          child: SelectionArea(
              child: Text(
            team,
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).bodyText1.override(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                ),
          )),
        ),
      ],
    ),
  );
}

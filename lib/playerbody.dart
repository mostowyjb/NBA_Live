import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_application_1/playermodel.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class PlayerBody extends StatefulWidget {
  final PlayerModel playerModel;

  const PlayerBody(
    this.playerModel, {
    Key? key,
  }) : super(key: key);

  @override
  _PlayerBodyState createState() => _PlayerBodyState();
}

class _PlayerBodyState extends State<PlayerBody> with TickerProviderStateMixin {
  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0, -56),
          end: Offset(0, 0),
        ),
      ],
    ),
    'rowOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
    'rowOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
  };
  PageController? pageViewController;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFEDF0F5),
      appBar: AppBar(
        backgroundColor: Color(0xFF6AB4DC),
        iconTheme: IconThemeData(color: Color(0xFFF3EED9)),
        automaticallyImplyLeading: true,
        actions: [],
        flexibleSpace: FlexibleSpaceBar(
          title: Text(
            '',
            style: FlutterFlowTheme.of(context).title2.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 22,
                ),
          ),
          centerTitle: true,
          expandedTitleScale: 1.0,
        ),
        elevation: 0,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
        child: Align(
          alignment: AlignmentDirectional(0, 0),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
              child: PageView(
                controller: pageViewController ??=
                    PageController(initialPage: 0),
                scrollDirection: Axis.vertical,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0, -0.5),
                        child: Stack(
                          alignment:
                              AlignmentDirectional(0, 0.30000000000000004),
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.35,
                              decoration: BoxDecoration(
                                color: Color(0xFF6AB4DC),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(25),
                                  bottomRight: Radius.circular(25),
                                  topLeft: Radius.circular(0),
                                  topRight: Radius.circular(0),
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment: AlignmentDirectional(0, -1),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Expanded(
                                              child: Align(
                                                alignment:
                                                    AlignmentDirectional(0, 1),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      widget
                                                          .playerModel.firstName
                                                          .toUpperCase(),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          GoogleFonts.getFont(
                                                        'Poppins',
                                                        color:
                                                            Color(0xABA1C8D9),
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 80,
                                                        fontStyle:
                                                            FontStyle.italic,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ).animateOnPageLoad(animationsMap[
                                            'rowOnPageLoadAnimation1']!),
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(0, -1),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Align(
                                              alignment:
                                                  AlignmentDirectional(0, 1),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 150, 0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0, 0),
                                                      child: Text(
                                                        widget.playerModel
                                                            .lastName
                                                            .toUpperCase(),
                                                        style:
                                                            GoogleFonts.getFont(
                                                          'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 40,
                                                          fontStyle:
                                                              FontStyle.italic,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ).animateOnPageLoad(animationsMap[
                                            'rowOnPageLoadAnimation2']!),
                                      ),
                                    ],
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(3, 1),
                                    child: Image.network(
                                      widget.playerModel.image,
                                      width: MediaQuery.of(context).size.width *
                                          0.9,
                                      height: 250,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ],
                              ),
                            ).animateOnPageLoad(
                                animationsMap['containerOnPageLoadAnimation']!),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.95,
                                height: MediaQuery.of(context).size.height * 1,
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Expanded(
                                          child: Align(
                                            alignment: AlignmentDirectional(
                                                -0.9, -0.9),
                                            child: Padding(
                                              padding: EdgeInsets.all(16.0),
                                              child: Text(
                                                'A PROPOS',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .title2
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color:
                                                              Color(0xFFFF686D),
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Card(
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            elevation: 5,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: 100,
                                                  height: 100,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    shape: BoxShape.rectangle,
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            'Taille',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .subtitle2
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: Color(
                                                                      0xFFD50032),
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                      Text(
                                                        widget.playerModel
                                                                .heighInches
                                                                .toUpperCase() +
                                                            ' in',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .title3
                                                            .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: Color(
                                                                    0xFF101213)),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Card(
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            elevation: 5,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: 100,
                                                  height: 100,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    shape: BoxShape.rectangle,
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          InkWell(
                                                            onTap: () async {},
                                                            child: Text(
                                                              'Poids',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .subtitle2
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: Color(
                                                                        0xFFD50032),
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Text(
                                                        widget.playerModel
                                                                .weightPounds
                                                                .toUpperCase() +
                                                            ' lbs',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .title3
                                                            .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: Color(
                                                                    0xFF101213)),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Card(
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            elevation: 5,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: 100,
                                                  height: 100,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    shape: BoxShape.rectangle,
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            'Pointure',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .subtitle2
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: Color(
                                                                      0xFFD50032),
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                      Text(
                                                        widget.playerModel
                                                                .heightFeet
                                                                .toUpperCase() +
                                                            ' ft',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .title3
                                                            .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: Color(
                                                                    0xFF101213)),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Card(
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            elevation: 5,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: 100,
                                                  height: 100,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    shape: BoxShape.rectangle,
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            'Poste',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .subtitle2
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: Color(
                                                                      0xFFD50032),
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                      Text(
                                                        widget.playerModel
                                                            .position
                                                            .toUpperCase(),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .title3
                                                            .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: Color(
                                                                    0xFF101213)),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Expanded(
                                          child: Align(
                                            alignment: AlignmentDirectional(
                                                -0.9, -0.9),
                                            child: Padding(
                                              padding: EdgeInsets.all(16.0),
                                              child: Text(
                                                'SON ÉQUIPE',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .title2
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color:
                                                              Color(0xFFFF686D),
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Card(
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            elevation: 5,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.90,
                                                  height: 100,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    shape: BoxShape.rectangle,
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        widget.playerModel.team
                                                            .fullName
                                                            .toUpperCase(),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .title3
                                                            .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: Color(
                                                                    0xFF101213)),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

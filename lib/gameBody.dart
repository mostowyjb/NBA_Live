import 'package:flutter/material.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter_application_1/teamstat.dart';
import 'package:flutter_application_1/goalstat.dart';
import 'soccermodel.dart';
import 'package:flutter_application_1/api_manager.dart';
import 'package:tab_container/tab_container.dart';
import 'main.dart';

class TeamCard extends StatelessWidget {
  final Color? color;
  final String idTab;
  final String idGame;

  const TeamCard({
    Key? key,
    this.color,
    required this.idTab,
    required this.idGame,
  }) : super(key: key);

  void _navigateToNextScreen(BuildContext context, String id) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => PlayerScreen(
              data: id,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(14.0),
      ),
      child: FutureBuilder<List<dynamic>>(
          future: SoccerApi().getStatMatcheById(idGame, idTab),
          builder: (context, future) {
            if (!future.hasData) {
              return const Center(
                child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
              );
            } else {
              List? list = future.data;
              return ListView.builder(
                  itemCount: list!.length,
                  itemBuilder: (context, index) {
                    return Container(
                        margin: const EdgeInsets.symmetric(vertical: 12.0),
                        child: //Text(list[index].toString())
                            InkWell(
                          onTap: () {
                            _navigateToNextScreen(
                                context, '${list[index]['id']}');
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  list[index]['first_name'],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  list[index]['last_name'],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  list[index]['position'],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ));
                  });
            }
          }),
    );
  }
}

// ignore: non_constant_identifier_names
Widget GameBody(SoccerMatch game, BuildContext context) {
  List<Widget> _getChildren1(String id) {
    List<dynamic> cards = ['home', 'visitor']
        .map(
          (e) => (e),
        )
        .toList();

    return cards.map((e) => TeamCard(idTab: e, idGame: id)).toList();
  }

  List<dynamic> _getTabs1() {
    List cards = [game.home.fullName, game.away.fullName]
        .map(
          (e) => (e),
        )
        .toList();
    return cards
        .map(
          (e) => e,
        )
        .toList();
  }

  PageController? pageViewController;
  return Align(
    alignment: AlignmentDirectional(-1, 0),
    child: Container(
      width: double.infinity,
      height: double.infinity,
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 50),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
              child: Stack(
                alignment: AlignmentDirectional(0, 0.30000000000000004),
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                    height: MediaQuery.of(context).size.height * 0.211,
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          color: Color(0x33000000),
                          offset: Offset(0, 5),
                        )
                      ],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-0.8, -0.8),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SelectionArea(
                                            child: Text(
                                          game.fixture.date,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Poppins',
                                                fontSize: 20,
                                              ),
                                        )),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        teamStat(game.home.name,
                                            game.home.teamImg, context),
                                        goalStat(context, game.goal.home,
                                            game.goal.away),
                                        teamStat(game.away.name,
                                            game.away.teamImg, context),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.50,
                        child: AspectRatio(
                          aspectRatio: 10 / 8,
                          child: TabContainer(
                            radius: 20,
                            tabEdge: TabEdge.bottom,
                            tabCurve: Curves.easeIn,
                            transitionBuilder: (child, animation) {
                              animation = CurvedAnimation(
                                  curve: Curves.easeIn, parent: animation);
                              return SlideTransition(
                                position: Tween(
                                  begin: const Offset(0.2, 0.0),
                                  end: const Offset(0.0, 0.0),
                                ).animate(animation),
                                child: FadeTransition(
                                  opacity: animation,
                                  child: child,
                                ),
                              );
                            },
                            colors: const <Color>[
                              Colors.red,
                              Color(0xFF4373D9),
                            ],
                            children: _getChildren1(game.fixture.id),
                            tabs: _getTabs1(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
// import '../home_page/home_page_widget.dart';
import '../main.dart'; //changed
import '../score_page/score_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../qr_code_scanner_view/qr_code_scanner_view.dart';
import '../db/db_provider.dart';


class ScoreReadingWidget extends StatefulWidget {
  final ConfirmViewArguments args;
  // ScoreReadingWidget({Key key, @required this.data}) : super(key: key);
  const ScoreReadingWidget(this.args);
  @override
  _ScoreReadingWidgetState createState() => _ScoreReadingWidgetState();
}

class _ScoreReadingWidgetState extends State<ScoreReadingWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

// class ScoreReadingWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('To confirm the scan results'),
//       ),
//       body: _build(context),
//     );
//   }
  Widget build(BuildContext context) {
    final arguments =  widget.args; // ModalRoute.of(context).settings.arguments as ConfirmViewArguments;

    return Scaffold(
      // key: scaffoldKey,
      body: Padding(
        padding: EdgeInsets.fromLTRB(1, 0, 0, 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment(0, 0),
                  child: Image.asset(
                    'assets/images/BACk25.jpg',
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 1,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 80, 15, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(3, 0, 0, 0),
                            child: Text(
                              '今回の手洗いは、',
                              style: FlutterFlowTheme.title1.override(
                                fontFamily: 'Poppins',
                                fontSize: 30,
                              ),
                            ),
                          )
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Stack(
                            children: [
                              Align(
                                alignment: Alignment(0, 0),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                                  child: Image.asset(
                                    'assets/images/popup2.png',
                                    height: 175,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment(0, 0),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(115, 0, 0, 0),
                                        child: Text(
                                          arguments.data,
                                          style:
                                              FlutterFlowTheme.title1.override(
                                            fontFamily: 'Poppins',
                                            fontSize: 60,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(15, 20, 0, 0),
                                        child: Text(
                                          '点',
                                          style:
                                              FlutterFlowTheme.title1.override(
                                            fontFamily: 'Poppins',
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(5, 1, 100, 1),
                            child: Image.asset(
                              'assets/images/rascal.png',
                              width: 120,
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                            child: Text(
                              'でした。',
                              style: FlutterFlowTheme.title1.override(
                                fontFamily: 'Poppins',
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 90, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ScorePageWidget(),
                                  ),
                                );
                              },
                              text: 'スコアを確認する',
                              options: FFButtonOptions(
                                width: 300,
                                height: 60,
                                color: Colors.black,
                                textStyle: FlutterFlowTheme.title1.override(
                                  fontFamily: 'Poppins',
                                  color: FlutterFlowTheme.tertiaryColor,
                                  fontSize: 24,
                                ),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: 12,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomePageWidget(),
                                    ),
                                  );
                                },
                                text: 'ホームに戻る',
                                options: FFButtonOptions(
                                  width: 300,
                                  height: 60,
                                  color: FlutterFlowTheme.primaryColor,
                                  textStyle: FlutterFlowTheme.title1.override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.tertiaryColor,
                                  ),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: 12,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import '../qr_code_scanner_view/qr_code_scanner_view.dart';
import '../home_page_eng/home_page_eng_widget.dart';
import '../score_page_eng/score_page_eng_widget.dart';

class ScoreReadingEngWidget extends StatefulWidget {
  final ConfirmViewArguments args;
  const ScoreReadingEngWidget(this.args);
  @override
  _ScoreReadingEngWidgetState createState() => _ScoreReadingEngWidgetState();
}

class _ScoreReadingEngWidgetState extends State<ScoreReadingEngWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final arguments =  widget.args;
    return Scaffold(
      key: scaffoldKey,
      body: Column(
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
                padding: EdgeInsets.fromLTRB(15, 120, 15, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(3, 0, 0, 0),
                          child: Text(
                            'Your hand wash score is',
                            style: FlutterFlowTheme.title1.override(
                              fontFamily: 'Poppins',
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
                                        style: FlutterFlowTheme.title1.override(
                                          fontFamily: 'Poppins',
                                          fontSize: 60,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                      EdgeInsets.fromLTRB(15, 20, 0, 0),
                                      child: Text(
                                        'pt',
                                        style: FlutterFlowTheme.title1.override(
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
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 1, 10, 1),
                            child: Image.asset(
                              'assets/images/rascal.png',
                              width: 150,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          FFButtonWidget(
                            onPressed: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ScorePageEngWidget(),
                                ),
                              );
                            },
                            text: 'Check Your Score',
                            options: FFButtonOptions(
                              width: 300,
                              height: 60,
                              color: Colors.black,
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
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomePageEngWidget(),
                                  ),
                                );
                              },
                              text: 'Back To Home',
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
    );
  }
}

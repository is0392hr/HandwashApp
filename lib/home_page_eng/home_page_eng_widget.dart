import 'package:flutter/material.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../qr_code_scanner_view_en/qr_code_scanner_view_en.dart';
import '../score_page_eng/score_page_eng_widget.dart';
import '../main.dart';

class HomePageEngWidget extends StatefulWidget {
  HomePageEngWidget({Key key}) : super(key: key);

  @override
  _HomePageEngWidgetState createState() => _HomePageEngWidgetState();
}

class _HomePageEngWidgetState extends State<HomePageEngWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
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
              Align(
                alignment: Alignment(0, 0),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(15, 60, 15, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomePageWidget(),
                                    ),
                                  );
                                },
                                child: Image.asset(
                                  'assets/images/language.png',
                                  width: 40,
                                  height: 40,
                                  fit: BoxFit.cover,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                        child: Image.asset(
                          'assets/images/Racoon2.png',
                          width: 250,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: Image.asset(
                          'assets/images/HandWashPromotionSystemEng.png',
                          height: 40,
                          // width: MediaQuery.of(context).size.width * 0.6,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Image.asset(
                        'assets/images/Logo.png',
                        width: double.infinity,
                        height:140,
                        fit: BoxFit.cover,
                      ),
                      // Divider(
                      //   height: 20,
                      //   thickness: 20,
                      //   color: Colors.black,
                      // ),
                      // Text(
                      //   'An app that promotes hand washing',
                      //   style: FlutterFlowTheme.bodyText1.override(
                      //     fontFamily: 'Poppins',
                      //   ),
                      // ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(1, 0, 0, 0),
                        // child: Text(
                        //   'An app that promotes hand washing',
                        //   textAlign: TextAlign.center,
                        //   style: FlutterFlowTheme.bodyText1.override(
                        //     fontFamily: 'Poppins',
                        //   ),
                        // ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FFButtonWidget(
                              onPressed: () async{
                                print('Button pressed ...');
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => QRCodeScannerView_en(),
                                  ),
                                );
                              },
                              text: 'QR Camera',
                              options: FFButtonOptions(
                                width: 130,
                                height: 130,
                                color: Color(0xFF00B4FF),
                                textStyle: FlutterFlowTheme.title1.override(
                                  fontFamily: 'Poppins',
                                  color: FlutterFlowTheme.tertiaryColor,
                                  fontSize: 19,
                                ),
                                elevation: 20,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: 12,
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () async{
                                print('Button pressed ...');
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ScorePageEngWidget(),
                                  ),
                                );
                              },
                              text: 'Score Check',
                              options: FFButtonOptions(
                                width: 130,
                                height: 130,
                                color: Color(0xFF00B4FF),
                                textStyle: FlutterFlowTheme.title1.override(
                                  fontFamily: 'Poppins',
                                  color: FlutterFlowTheme.tertiaryColor,
                                  fontSize: 18,
                                ),
                                elevation: 20,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: 12,
                              ),
                            )
                          ],
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
    );
  }
}

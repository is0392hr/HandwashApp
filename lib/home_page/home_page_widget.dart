import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../score_page/score_page_widget.dart';
import '../qr_code_scanner_view/qr_code_scanner_view.dart';
import 'package:flutter/material.dart';
import '../score_reading/score_reading_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class Const {
  static const routeHomePage = '/home';
  static const routeQRCodeScanner = '/qr-code-scanner';
  static const routeScoreReading = '/score-reading';
}

class HomePageWidget extends StatefulWidget {
  HomePageWidget({Key key}) : super(key: key);
  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.white),
      routes: <String, WidgetBuilder>{
        Const.routeHomePage: (BuildContext context) => HomePageWidget(),
        Const.routeQRCodeScanner: (BuildContext context) => QRCodeScannerView(),
        // Const.routeScoreReading: (BuildContext context) => ScoreReadingWidget(),
      },
      // home: createState(),
    );
  }

}

class _HomePageWidgetState extends State<HomePageWidget> {
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
                              Image.asset(
                                'assets/images/language.png',
                                width: 40,
                                height: 40,
                                fit: BoxFit.cover,
                              )
                            ],
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                        child: Image.asset(
                          'assets/images/rascal.png',
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 5, 0, 1),
                        child: Image.asset(
                          'assets/images/handwash_promote_app.png',
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Image.asset(
                            'assets/images/rassukaru.png',
                            width: MediaQuery.of(context).size.width,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          Divider(
                            height: 10,
                            thickness: 20,
                            color: Colors.black,
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(1, 0, 0, 0),
                            child: Text(
                              'An app that promotes hand washing',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Poppins',
                              ),
                            ),
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
                                        builder: (context) => QRCodeScannerView(),
                                      ),
                                    );
                                  },
                                  text: 'QR撮影',
                                  options: FFButtonOptions(
                                    width: 130,
                                    height: 130,
                                    color: Color(0xFF00B4FF),
                                    textStyle: FlutterFlowTheme.title1.override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.tertiaryColor,
                                      fontSize: 22,
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
                                  onPressed: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ScorePageWidget(),
                                      ),
                                    );
                                  },
                                  text: 'スコア確認',
                                  options: FFButtonOptions(
                                    width: 130,
                                    height: 130,
                                    color: Color(0xFF00B4FF),
                                    textStyle: FlutterFlowTheme.title1.override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.tertiaryColor,
                                      fontSize: 22,
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

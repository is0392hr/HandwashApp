import 'package:flutter/material.dart';
// import 'package:demo/home_page/home_page_widget.dart';


//aa
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_widgets.dart';
import 'score_page/score_page_widget.dart';
import 'qr_code_scanner_view/qr_code_scanner_view.dart';
import 'home_page_eng/home_page_eng_widget.dart';

// libraries for geolocation based notification
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_background_geolocation/flutter_background_geolocation.dart' as bg;
import 'package:geocoder/geocoder.dart';
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

void main() async{

  runApp(MyApp());
  // Initialize local notifications plugin
  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  var initializationSettingsIOS = IOSInitializationSettings();
  var initializationSettings = InitializationSettings(null, initializationSettingsIOS);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rascal',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePageWidget(),
    );
  }
}

// from homepagewidget.dart
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

  void _addGeofence() {
    bg.BackgroundGeolocation.addGeofence(bg.Geofence(
      identifier: 'HOME',
      radius: 150,
      latitude: 35.0662392,
      longitude: 135.7803708,
      notifyOnEntry: true, // only notify on entry
      notifyOnExit: false,
      notifyOnDwell: false,
      loiteringDelay: 30000, // 30 seconds
    )).then((bool success) {
      print('[addGeofence] success with 大学'
//          '$_homeLatitude and $_homeLongitude'
      );
    }).catchError((error) {
      print('[addGeofence] FAILURE: $error');
    });
  }

  // background geolocation event handlers
  // triggered whenever a geofence event is detected - in this case when you ENTER a geofence that was added on the app home page
  void _onGeofence(bg.GeofenceEvent event) async {
    print('onGeofence $event');
    var platformChannelSpecifics =
    NotificationDetails(null, IOSNotificationDetails());
    flutterLocalNotificationsPlugin
        .show(0, 'Welcome home!', 'Don\'t forget to wash your hands!',
        platformChannelSpecifics)
        .then((result) {})
        .catchError((onError) {
      print('[flutterLocalNotificationsPlugin.show] ERROR: $onError');
    });
  }

  @override
  void initState() {
    super.initState();
    _addGeofence();
    // set background geolocation events
    bg.BackgroundGeolocation.onGeofence(_onGeofence);
    print('setはされた気がするけど');
    // Configure the plugin and call ready
    bg.BackgroundGeolocation.ready(bg.Config(
        desiredAccuracy: bg.Config.DESIRED_ACCURACY_HIGH,
        distanceFilter: 10.0,
        stopOnTerminate: false,
        startOnBoot: true,
        debug: false, // true
        logLevel: bg.Config.LOG_LEVEL_OFF, // bg.Config.LOG_LEVEL_VERBOSE
        autoSync: true))
        .then((bg.State state) {
      if (!state.enabled) {
        // start the plugin
        // bg.BackgroundGeolocation.start();
        print('start geofence');
        // start geofences only
        bg.BackgroundGeolocation.startGeofences();
      }
      print('start geofence');
      // start geofences only
      bg.BackgroundGeolocation.startGeofences();
    });
  }

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

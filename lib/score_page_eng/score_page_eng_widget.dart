import '../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScorePageEngWidget extends StatefulWidget {
  ScorePageEngWidget({Key key}) : super(key: key);

  @override
  _ScorePageEngWidgetState createState() => _ScorePageEngWidgetState();
}

class _ScorePageEngWidgetState extends State<ScorePageEngWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.tertiaryColor,
        automaticallyImplyLeading: true,
        leading: Icon(
          Icons.home_outlined,
          color: Colors.black,
          size: 24,
        ),
        title: Text(
          'Your score history',
          style: FlutterFlowTheme.title1.override(
            fontFamily: 'Poppins',
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
    );
  }
}

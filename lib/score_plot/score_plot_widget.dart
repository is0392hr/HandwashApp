import '../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import '../main.dart';

class ScorePlotWidget extends StatefulWidget {
  ScorePlotWidget({Key key}) : super(key: key);

  @override
  _ScorePlotWidgetState createState() => _ScorePlotWidgetState();
}

class _ScorePlotWidgetState extends State<ScorePlotWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.tertiaryColor,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePageWidget(),
              ),
            );
          },
          child: Icon(
            Icons.home_outlined,
            color: Colors.black,
            size: 24,
          ),
        ),
        title: Text(
          'スコアの推移',
          style: FlutterFlowTheme.title1.override(
            fontFamily: 'Poppins',
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Stack(
            children: [
              Align(
                alignment: Alignment(0, 0),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 1,
                  decoration: BoxDecoration(
                    color: Color(0xFFE7E7E7),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                          child: Image.network(
                            'https://picsum.photos/seed/348/600',
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.5,
                            fit: BoxFit.cover,
                          ),
                        )
                      ],
                    ),
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

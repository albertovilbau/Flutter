import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/flutter_flow_youtube_player.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavasWidget extends StatefulWidget {
  NavasWidget({Key key}) : super(key: key);

  @override
  _NavasWidgetState createState() => _NavasWidgetState();
}

class _NavasWidgetState extends State<NavasWidget> {
  bool _loadingButton = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(160),
        child: AppBar(
          backgroundColor: Color(0x003474E0),
          iconTheme: IconThemeData(color: Color(0xFFFF0027)),
          automaticallyImplyLeading: true,
          flexibleSpace: Image.network(
            'https://e00-elmundo.uecdn.es/mundial/2010/html/images/espanoles/navas.jpg',
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
          actions: [],
          elevation: 4,
        ),
      ),
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                  child: Text(
                    'Palmarés:',
                    style: FlutterFlowTheme.title1.override(
                      fontFamily: 'Poppins',
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                  child: Text(
                    '1 Mundial',
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(19, 0, 0, 0),
                  child: Text(
                    '1 Eurocopas',
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 20, 0, 0),
                  child: Text(
                    'Internacionalidades:',
                    style: FlutterFlowTheme.title1.override(
                      fontFamily: 'Poppins',
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                  child: Text(
                    '46 Partidos\n5 Goles',
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5, 25, 0, 0),
                  child: FlutterFlowYoutubePlayer(
                    url: 'https://www.youtube.com/watch?v=CHbkUbMj3aY',
                    width: 365,
                    autoPlay: false,
                    looping: true,
                    mute: false,
                    showControls: true,
                    showFullScreen: true,
                  ),
                )
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(105, 50, 0, 0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      setState(() => _loadingButton = true);
                      try {
                        await launchURL(
                            'https://es.wikipedia.org/wiki/Jesús_Navas');
                      } finally {
                        setState(() => _loadingButton = false);
                      }
                    },
                    text: 'Mas Información',
                    options: FFButtonOptions(
                      width: 165,
                      height: 40,
                      color: FlutterFlowTheme.primaryColor,
                      textStyle: FlutterFlowTheme.subtitle2.override(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                      elevation: 5,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: 12,
                    ),
                    loading: _loadingButton,
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

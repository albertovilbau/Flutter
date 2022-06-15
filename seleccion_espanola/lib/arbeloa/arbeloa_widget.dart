import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/flutter_flow_youtube_player.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ArbeloaWidget extends StatefulWidget {
  ArbeloaWidget({Key key}) : super(key: key);

  @override
  _ArbeloaWidgetState createState() => _ArbeloaWidgetState();
}

class _ArbeloaWidgetState extends State<ArbeloaWidget> {
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
            'data:image/jpeg;base64,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',
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
                    '2 Eurocopas',
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
                    '56 Partidos',
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
                    url: 'https://www.youtube.com/watch?v=IM4061DbVB0',
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
                            'https://es.wikipedia.org/wiki/Álvaro_Arbeloa');
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

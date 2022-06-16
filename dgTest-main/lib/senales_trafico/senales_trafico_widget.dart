import 'package:d_g_test/backend/schema/preguntas_senales_record.dart';
import 'package:d_g_test/custom_code/actions/query.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:d_g_test/modo_historia/modo_historia_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

class SenalesTraficoWidget extends StatefulWidget {
  const SenalesTraficoWidget({Key key}) : super(key: key);

  @override
  _SenalesTraficoWidgetState createState() => _SenalesTraficoWidgetState();
}

bool _hasBeenPressed = false;
bool _query = false;
int i = 0;

class _SenalesTraficoWidgetState extends State<SenalesTraficoWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  Widget _botonrespuesta1(String text) {
    return ElevatedButton(
        child: Text(text),
        onPressed: () {
          setState(() {
            _hasBeenPressed = !_hasBeenPressed;
          });
        },
        style: ButtonStyle(
          backgroundColor: _hasBeenPressed
              ? MaterialStateProperty.all(Colors.red)
              : MaterialStateProperty.all(Colors.white),
          fixedSize: MaterialStateProperty.all(const Size(300, 40)),
          textStyle: MaterialStateProperty.all(
            const TextStyle(fontSize: 16),
          ),
          foregroundColor: MaterialStateProperty.all(Colors.black),
          side: MaterialStateProperty.all(
            const BorderSide(
              color: Colors.black,
              width: 2,
            ),
          ),
        ));
  }

  Widget _botonrespuesta2(String text) {
    return ElevatedButton(
        child: Text(text),
        onPressed: () {
          setState(() {
            _hasBeenPressed = !_hasBeenPressed;
          });
        },
        style: ButtonStyle(
          backgroundColor: _hasBeenPressed
              ? MaterialStateProperty.all<Color>(Colors.red)
              : MaterialStateProperty.all<Color>(Colors.white),
          fixedSize: MaterialStateProperty.all(const Size(300, 40)),
          textStyle: MaterialStateProperty.all(
            const TextStyle(fontSize: 16),
          ),
          foregroundColor: MaterialStateProperty.all(Colors.black),
          side: MaterialStateProperty.all(
            const BorderSide(
              color: Colors.black,
              width: 2,
            ),
          ),
        ));
  }

  Widget _botonrespuestaCorrecta(String text) {
    return ElevatedButton(
        child: Text(text),
        onPressed: () {
          setState(() {
            _hasBeenPressed = !_hasBeenPressed;
          });
        },
        style: ButtonStyle(
          backgroundColor: _hasBeenPressed
              ? MaterialStateProperty.all<Color>(Colors.green)
              : MaterialStateProperty.all<Color>(Colors.white),
          fixedSize: MaterialStateProperty.all(const Size(300, 40)),
          textStyle: MaterialStateProperty.all(
            const TextStyle(fontSize: 16),
          ),
          foregroundColor: MaterialStateProperty.all(Colors.black),
          side: MaterialStateProperty.all(
            const BorderSide(
              color: Colors.black,
              width: 2,
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<PreguntasSenalesRecord>>(
      stream: queryPreguntasSenalesRecord(
        singleRecord: false,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primaryColor,
              ),
            ),
          );
        }
        List<PreguntasSenalesRecord> senalesTraficoPreguntasSenalesRecordList =
            snapshot.data;
        final senalesTraficoPreguntasSenalesRecord =
            senalesTraficoPreguntasSenalesRecordList.isNotEmpty
                ? senalesTraficoPreguntasSenalesRecordList.first
                : null;
        List<Widget> lista = [
          _botonrespuesta1(snapshot.data.elementAt(i).respuesta1),
          _botonrespuesta2(snapshot.data.elementAt(i).respuesta2),
          _botonrespuestaCorrecta(snapshot.data.elementAt(i).respuestaCorrecta)
        ];

        List<Widget> getRandomItem() {
          lista.shuffle();
          return lista;
        }

        return Scaffold(
          key: scaffoldKey,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(40),
            child: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryColor,
              automaticallyImplyLeading: false,
              flexibleSpace: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(150, 0, 0, 0),
                child: Text(
                  'Test',
                  style: FlutterFlowTheme.of(context).title2.override(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontSize: 22,
                      ),
                ),
              ),
              actions: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                  child: Text(
                    'Hello World',
                    style: FlutterFlowTheme.of(context).bodyText1,
                  ),
                ),
              ],
              elevation: 2,
            ),
          ),
          backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(40, 50, 40, 0),
                    child: Container(
                      width: 300,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                        shape: BoxShape.rectangle,
                      ),
                      child: Image.network(
                        snapshot.data.elementAt(i).recurso,
                        width: 100,
                        height: 100,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(40, 30, 40, 30),
                    child: Text(
                      snapshot.data.elementAt(i).pregunta,
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                  ),
                  Column(
                    children: getRandomItem(),
                  ),
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(250, 40, 0, 0),
                      child: FFButtonWidget(
                        onPressed: () {
                          setState(() {
                            _query = !_query;
                            _hasBeenPressed = !_hasBeenPressed;
                            i++;
                            getRandomItem();

                            if (i == 3) {
                              i = 0;
                              _hasBeenPressed = false;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ModoHistoriaWidget(),
                                ),
                              );
                            }
                          });
                        },
                        text: '',
                        icon: Icon(
                          Icons.arrow_forward_rounded,
                          size: 15,
                        ),
                        options: FFButtonOptions(
                          width: 70,
                          height: 40,
                          color: FlutterFlowTheme.of(context).primaryColor,
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: 60,
                        ),
                      )),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

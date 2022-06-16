import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../home_page/home_page_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginSingUpScreenWidget extends StatefulWidget {
  const LoginSingUpScreenWidget({Key key}) : super(key: key);

  @override
  _LoginSingUpScreenWidgetState createState() =>
      _LoginSingUpScreenWidgetState();
}

class _LoginSingUpScreenWidgetState extends State<LoginSingUpScreenWidget> {
  ProgressCollectionRecord crearProgreso;
  TextEditingController txtConfirmController;
  bool txtConfirmVisibility;
  TextEditingController txtEdadController;
  TextEditingController txtNameController;
  TextEditingController txtNumController;
  TextEditingController txtEmailController;
  TextEditingController txtPassController;
  bool txtPassVisibility;
  TextEditingController txtMailLoginController;
  TextEditingController txtPassLoginController;
  bool txtPassLoginVisibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    txtConfirmController = TextEditingController();
    txtConfirmVisibility = false;
    txtEdadController = TextEditingController();
    txtNameController = TextEditingController();
    txtNumController = TextEditingController();
    txtEmailController = TextEditingController();
    txtPassController = TextEditingController();
    txtPassVisibility = false;
    txtMailLoginController = TextEditingController();
    txtPassLoginController = TextEditingController();
    txtPassLoginVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          flexibleSpace: Image.asset(
            'assets/images/LOGO.png',
            width: 100,
            height: 100,
            fit: BoxFit.contain,
          ),
          actions: [],
          elevation: 4,
        ),
      ),
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
            child: DefaultTabController(
              length: 2,
              initialIndex: 0,
              child: Column(
                children: [
                  TabBar(
                    labelColor: FlutterFlowTheme.of(context).primaryColor,
                    labelStyle: FlutterFlowTheme.of(context).bodyText1,
                    indicatorColor: FlutterFlowTheme.of(context).secondaryColor,
                    tabs: [
                      Tab(
                        text: 'Log In',
                        icon: FaIcon(
                          FontAwesomeIcons.solidUser,
                          size: 25,
                        ),
                        iconMargin: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                      ),
                      Tab(
                        text: 'Sing Up',
                        icon: Icon(
                          Icons.person_add,
                          size: 30,
                        ),
                        iconMargin: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                              child: TextFormField(
                                controller: txtMailLoginController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText:
                                      'Correo electronico (ejemplo@dgtest.com)',
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.alternate_email,
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ),
                            TextFormField(
                              controller: txtPassLoginController,
                              obscureText: !txtPassLoginVisibility,
                              decoration: InputDecoration(
                                hintText: 'Contraseña',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryColor,
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryColor,
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryColor,
                                  size: 20,
                                ),
                                suffixIcon: InkWell(
                                  onTap: () => setState(
                                    () => txtPassLoginVisibility =
                                        !txtPassLoginVisibility,
                                  ),
                                  child: Icon(
                                    txtPassLoginVisibility
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    color: Color(0xFF757575),
                                    size: 22,
                                  ),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  final user = await signInWithEmail(
                                    context,
                                    txtMailLoginController.text,
                                    txtPassLoginController.text,
                                  );
                                  if (user == null) {
                                    return;
                                  }

                                  await Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomePageWidget(),
                                    ),
                                    (r) => false,
                                  );
                                },
                                text: 'Acceder',
                                icon: Icon(
                                  Icons.sensor_door_outlined,
                                  size: 15,
                                ),
                                options: FFButtonOptions(
                                  width: 130,
                                  height: 40,
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                      ),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                              child: TextFormField(
                                controller: txtNameController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: 'Nombre',
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: Colors.black,
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ),
                            TextFormField(
                              controller: txtEdadController,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: 'Edad',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                contentPadding:
                                    EdgeInsetsDirectional.fromSTEB(0, 14, 0, 0),
                                prefixIcon: Icon(
                                  Icons.calendar_today,
                                  color: Colors.black,
                                ),
                              ),
                              style: FlutterFlowTheme.of(context).bodyText1,
                              keyboardType: TextInputType.number,
                            ),
                            TextFormField(
                              controller: txtNumController,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: 'Telefono móvil',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                prefixIcon: Icon(
                                  Icons.phone_enabled,
                                  color: Colors.black,
                                ),
                              ),
                              style: FlutterFlowTheme.of(context).bodyText1,
                              keyboardType: TextInputType.phone,
                            ),
                            TextFormField(
                              controller: txtEmailController,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: 'Email',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                prefixIcon: Icon(
                                  Icons.mail,
                                  color: Colors.black,
                                ),
                              ),
                              style: FlutterFlowTheme.of(context).bodyText1,
                              keyboardType: TextInputType.emailAddress,
                            ),
                            TextFormField(
                              controller: txtPassController,
                              obscureText: !txtPassVisibility,
                              decoration: InputDecoration(
                                hintText: 'Contraseña',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.black,
                                ),
                                suffixIcon: InkWell(
                                  onTap: () => setState(
                                    () =>
                                        txtPassVisibility = !txtPassVisibility,
                                  ),
                                  child: Icon(
                                    txtPassVisibility
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    color: Color(0xFF757575),
                                    size: 22,
                                  ),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                            TextFormField(
                              controller: txtConfirmController,
                              obscureText: !txtConfirmVisibility,
                              decoration: InputDecoration(
                                hintText: 'Confirmar contraseña',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.black,
                                ),
                                suffixIcon: InkWell(
                                  onTap: () => setState(
                                    () => txtConfirmVisibility =
                                        !txtConfirmVisibility,
                                  ),
                                  child: Icon(
                                    txtConfirmVisibility
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    color: Color(0xFF757575),
                                    size: 22,
                                  ),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  final progressCollectionCreateData =
                                      createProgressCollectionRecordData(
                                    nivel: 0,
                                    progreso: 0,
                                  );
                                  var progressCollectionRecordReference =
                                      ProgressCollectionRecord.collection.doc();
                                  await progressCollectionRecordReference
                                      .set(progressCollectionCreateData);
                                  crearProgreso = ProgressCollectionRecord
                                      .getDocumentFromData(
                                          progressCollectionCreateData,
                                          progressCollectionRecordReference);
                                  if (txtPassController.text !=
                                      txtConfirmController.text) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Passwords don\'t match!',
                                        ),
                                      ),
                                    );
                                    return;
                                  }

                                  final user = await createAccountWithEmail(
                                    context,
                                    txtEmailController.text,
                                    txtPassController.text,
                                  );
                                  if (user == null) {
                                    return;
                                  }

                                  final usersCreateData = createUsersRecordData(
                                    edad: txtEdadController.text,
                                    nivel: crearProgreso.reference,
                                    email: txtEmailController.text,
                                    displayName: txtNameController.text,
                                    photoUrl: '',
                                    createdTime: getCurrentTimestamp,
                                    phoneNumber: txtNumController.text,
                                  );
                                  await UsersRecord.collection
                                      .doc(user.uid)
                                      .update(usersCreateData);

                                  await Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomePageWidget(),
                                    ),
                                    (r) => false,
                                  );

                                  setState(() {});
                                },
                                text: 'Registrarse',
                                icon: Icon(
                                  Icons.assignment_turned_in_outlined,
                                  size: 15,
                                ),
                                options: FFButtonOptions(
                                  width: 160,
                                  height: 40,
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                      ),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

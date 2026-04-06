import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_mashov_model.dart';
export 'add_mashov_model.dart';

class AddMashovWidget extends StatefulWidget {
  const AddMashovWidget({
    super.key,
    required this.userForAddition,
    required this.thisSession,
  });

  final UsersRecord? userForAddition;
  final SessionsRecord? thisSession;

  @override
  State<AddMashovWidget> createState() => _AddMashovWidgetState();
}

class _AddMashovWidgetState extends State<AddMashovWidget> {
  late AddMashovModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddMashovModel());

    _model.mashovTextController ??= TextEditingController();
    _model.mashovFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(50.0, 0.0, 50.0, 0.0),
        child: Material(
          color: Colors.transparent,
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              boxShadow: [
                BoxShadow(
                  blurRadius: 4.0,
                  color: Color(0x33000000),
                  offset: Offset(
                    0.0,
                    2.0,
                  ),
                )
              ],
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(
                color: FlutterFlowTheme.of(context).primary,
                width: 2.0,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.cancel_outlined,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: MediaQuery.sizeOf(context).width <
                                  kBreakpointSmall
                              ? 24.0
                              : 32.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 10.0),
                  child: Text(
                    'המשוב שלך עבור ${widget!.userForAddition?.displayName}',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          fontSize: MediaQuery.sizeOf(context).width <
                                  kBreakpointSmall
                              ? 18.0
                              : 28.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 20.0),
                  child: TextFormField(
                    controller: _model.mashovTextController,
                    focusNode: _model.mashovFocusNode,
                    autofocus: true,
                    textCapitalization: TextCapitalization.words,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'משוב מאמן...',
                      labelStyle:
                          FlutterFlowTheme.of(context).labelLarge.override(
                                font: GoogleFonts.outfit(
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .fontStyle,
                                ),
                                color: Color(0xFF606A85),
                                fontSize: MediaQuery.sizeOf(context).width <
                                        kBreakpointSmall
                                    ? 16.0
                                    : 24.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .fontStyle,
                              ),
                      alignLabelWithHint: true,
                      hintStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                font: GoogleFonts.outfit(
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                ),
                                color: Color(0xFF606A85),
                                fontSize: 14.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .fontStyle,
                              ),
                      errorStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                font: GoogleFonts.figtree(
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                                color: Color(0xFFFF5963),
                                fontSize: 12.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFE5E7EB),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF6F61EF),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFFF5963),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFFF5963),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 16.0, 16.0, 16.0),
                    ),
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                          font: GoogleFonts.figtree(
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .fontStyle,
                          ),
                          color: Color(0xFF15161E),
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                        ),
                    maxLines: 9,
                    minLines: 5,
                    cursorColor: Color(0xFF6F61EF),
                    validator: _model.mashovTextControllerValidator
                        .asValidator(context),
                    inputFormatters: [
                      if (!isAndroid && !isiOS)
                        TextInputFormatter.withFunction((oldValue, newValue) {
                          return TextEditingValue(
                            selection: newValue.selection,
                            text: newValue.text
                                .toCapitalization(TextCapitalization.words),
                          );
                        }),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            visualDensity: VisualDensity.compact,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                          unselectedWidgetColor:
                              FlutterFlowTheme.of(context).alternate,
                        ),
                        child: Checkbox(
                          value: _model.everyoneCheckBoxValue ??= false,
                          onChanged: (newValue) async {
                            safeSetState(
                                () => _model.everyoneCheckBoxValue = newValue!);
                          },
                          side: (FlutterFlowTheme.of(context).alternate != null)
                              ? BorderSide(
                                  width: 2,
                                  color:
                                      FlutterFlowTheme.of(context).alternate!,
                                )
                              : null,
                          activeColor: FlutterFlowTheme.of(context).primary,
                          checkColor: FlutterFlowTheme.of(context).info,
                        ),
                      ),
                      Flexible(
                        child: Text(
                          'הוספת משוב לכולם (סימון אופציה זו יוסיף את המשוב שכתבת לכל השחקנים שהיו באימון)',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: MediaQuery.sizeOf(context).width <
                                            kBreakpointSmall
                                        ? 16.0
                                        : 24.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                    child: StreamBuilder<List<UsersRecord>>(
                      stream: queryUsersRecord(
                        queryBuilder: (usersRecord) => usersRecord.whereIn(
                            'uid', widget!.thisSession?.arriving),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        List<UsersRecord> buttonUsersRecordList =
                            snapshot.data!;

                        return FFButtonWidget(
                          onPressed: () async {
                            if (_model.mashovTextController.text != null &&
                                _model.mashovTextController.text != '') {
                              if (_model.everyoneCheckBoxValue!) {
                                for (int loop1Index = 0;
                                    loop1Index <
                                        widget!.thisSession!.arriving.length;
                                    loop1Index++) {
                                  final currentLoop1Item =
                                      widget!.thisSession!.arriving[loop1Index];
                                  // adds mashov to everyone

                                  await widget!.thisSession!.reference.update({
                                    ...mapToFirestore(
                                      {
                                        'mahsovim': FieldValue.arrayUnion([
                                          getMashovFirestoreData(
                                            updateMashovStruct(
                                              MashovStruct(
                                                coach: currentUserUid,
                                                description: _model
                                                    .mashovTextController.text,
                                                player: currentLoop1Item,
                                              ),
                                              clearUnsetFields: false,
                                            ),
                                            true,
                                          )
                                        ]),
                                      },
                                    ),
                                  });
                                  // adds mashov to notifications

                                  await buttonUsersRecordList
                                      .where((e) => e.uid == currentLoop1Item)
                                      .toList()
                                      .firstOrNull!
                                      .reference
                                      .update({
                                    ...mapToFirestore(
                                      {
                                        'notifications': FieldValue.arrayUnion([
                                          getNotificationFirestoreData(
                                            updateNotificationStruct(
                                              NotificationStruct(
                                                type: NotificationType.mashov,
                                                mashovRef: MashovStruct(
                                                  coach: currentUserUid,
                                                  description: _model
                                                      .mashovTextController
                                                      .text,
                                                  player: currentLoop1Item,
                                                ),
                                                sessionRef: widget!
                                                    .thisSession?.reference,
                                                time: getCurrentTimestamp,
                                              ),
                                              clearUnsetFields: false,
                                            ),
                                            true,
                                          )
                                        ]),
                                      },
                                    ),
                                  });
                                  // adds to parent

                                  await buttonUsersRecordList
                                      .where((e) => e.uid == currentLoop1Item)
                                      .toList()
                                      .firstOrNull!
                                      .parent!
                                      .update({
                                    ...mapToFirestore(
                                      {
                                        'notifications': FieldValue.arrayUnion([
                                          getNotificationFirestoreData(
                                            updateNotificationStruct(
                                              NotificationStruct(
                                                type: NotificationType.mashov,
                                                mashovRef: MashovStruct(
                                                  coach: currentUserUid,
                                                  description: _model
                                                      .mashovTextController
                                                      .text,
                                                  player: currentLoop1Item,
                                                ),
                                                sessionRef: widget!
                                                    .thisSession?.reference,
                                                time: getCurrentTimestamp,
                                              ),
                                              clearUnsetFields: false,
                                            ),
                                            true,
                                          )
                                        ]),
                                      },
                                    ),
                                  });
                                  _model.addToListCreator(currentLoop1Item);
                                  safeSetState(() {});
                                  _model.addToListCreator(buttonUsersRecordList
                                      .where((e) => e.uid == currentLoop1Item)
                                      .toList()
                                      .firstOrNull!
                                      .parent!
                                      .id);
                                  safeSetState(() {});
                                  await PushNotificationCall.call(
                                    title: 'משוב חדש',
                                    body:
                                        'נשלח משוב חדש על ידי ${currentUserDisplayName}',
                                    userIdsList: _model.listCreator,
                                  );

                                  _model.listCreator = [];
                                  safeSetState(() {});
                                }
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'המשוב נשלח לכל השחקנים שנכחו באימון',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                );
                              } else {
                                // adds mashov

                                await widget!.thisSession!.reference.update({
                                  ...mapToFirestore(
                                    {
                                      'mahsovim': FieldValue.arrayUnion([
                                        getMashovFirestoreData(
                                          updateMashovStruct(
                                            MashovStruct(
                                              coach: currentUserUid,
                                              description: _model
                                                  .mashovTextController.text,
                                              player:
                                                  widget!.userForAddition?.uid,
                                            ),
                                            clearUnsetFields: false,
                                          ),
                                          true,
                                        )
                                      ]),
                                    },
                                  ),
                                });
                                // adds mashov to notifications

                                await widget!.userForAddition!.reference
                                    .update({
                                  ...mapToFirestore(
                                    {
                                      'notifications': FieldValue.arrayUnion([
                                        getNotificationFirestoreData(
                                          updateNotificationStruct(
                                            NotificationStruct(
                                              type: NotificationType.mashov,
                                              mashovRef: MashovStruct(
                                                coach: currentUserUid,
                                                description: _model
                                                    .mashovTextController.text,
                                                player: widget!
                                                    .userForAddition?.uid,
                                              ),
                                              sessionRef: widget!
                                                  .thisSession?.reference,
                                              time: getCurrentTimestamp,
                                            ),
                                            clearUnsetFields: false,
                                          ),
                                          true,
                                        )
                                      ]),
                                    },
                                  ),
                                });
                                // adds to parent

                                await widget!.userForAddition!.parent!.update({
                                  ...mapToFirestore(
                                    {
                                      'notifications': FieldValue.arrayUnion([
                                        getNotificationFirestoreData(
                                          updateNotificationStruct(
                                            NotificationStruct(
                                              type: NotificationType.mashov,
                                              mashovRef: MashovStruct(
                                                coach: currentUserUid,
                                                description: _model
                                                    .mashovTextController.text,
                                                player: widget!
                                                    .userForAddition?.uid,
                                              ),
                                              sessionRef: widget!
                                                  .thisSession?.reference,
                                              time: getCurrentTimestamp,
                                            ),
                                            clearUnsetFields: false,
                                          ),
                                          true,
                                        )
                                      ]),
                                    },
                                  ),
                                });
                                _model.addToListCreator(
                                    widget!.userForAddition!.uid);
                                safeSetState(() {});
                                _model.addToListCreator(
                                    widget!.userForAddition!.parent!.id);
                                safeSetState(() {});
                                await PushNotificationCall.call(
                                  title: 'משוב חדש',
                                  body:
                                      'נשלח משוב חדש על ידי ${currentUserDisplayName}',
                                  userIdsList: _model.listCreator,
                                );

                                _model.listCreator = [];
                                safeSetState(() {});
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'המשוב שלך נשלח בהצלחה ל${widget!.userForAddition?.displayName}',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                );
                              }

                              Navigator.pop(context);
                            } else {
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: Text('שגיאה!'),
                                    content: Text('שדה המשוב חייב להיות מלא'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: Text('אישור'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          },
                          text: 'הוסף',
                          options: FFButtonOptions(
                            height: MediaQuery.sizeOf(context).width <
                                    kBreakpointSmall
                                ? 35.0
                                : 43.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  font: GoogleFonts.interTight(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  fontSize: MediaQuery.sizeOf(context).width <
                                          kBreakpointSmall
                                      ? 18.0
                                      : 26.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'attendence_submit_model.dart';
export 'attendence_submit_model.dart';

class AttendenceSubmitWidget extends StatefulWidget {
  const AttendenceSubmitWidget({
    super.key,
    required this.thisSession,
  });

  final SessionsRecord? thisSession;

  @override
  State<AttendenceSubmitWidget> createState() => _AttendenceSubmitWidgetState();
}

class _AttendenceSubmitWidgetState extends State<AttendenceSubmitWidget> {
  late AttendenceSubmitModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AttendenceSubmitModel());

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
        padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
        child: Container(
          width: double.infinity,
          constraints: BoxConstraints(
            maxWidth: MediaQuery.sizeOf(context).width < kBreakpointSmall
                ? 570.0
                : 1000.0,
          ),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(
              color: FlutterFlowTheme.of(context).primary,
              width: 2.0,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
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
                        Icons.cancel_sharp,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size:
                            MediaQuery.sizeOf(context).width < kBreakpointSmall
                                ? 24.0
                                : 32.0,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 10.0),
                  child: Text(
                    'סימון נוכחות',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          fontSize: MediaQuery.sizeOf(context).width <
                                  kBreakpointSmall
                              ? 24.0
                              : 36.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                  child: RichText(
                    textScaler: MediaQuery.of(context).textScaler,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: valueOrDefault<String>(
                            widget!.thisSession?.name,
                            'אימון אקדמיה',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: MediaQuery.sizeOf(context).width <
                                            kBreakpointSmall
                                        ? 18.0
                                        : 30.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                        TextSpan(
                          text: '  ',
                          style: TextStyle(),
                        ),
                        TextSpan(
                          text: dateTimeFormat(
                            "d/M H:mm",
                            widget!.thisSession!.time!,
                            locale: FFLocalizations.of(context).languageCode,
                          ),
                          style: TextStyle(
                            fontSize: MediaQuery.sizeOf(context).width <
                                    kBreakpointSmall
                                ? 14.0
                                : 26.0,
                          ),
                        )
                      ],
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            fontSize: MediaQuery.sizeOf(context).width <
                                    kBreakpointSmall
                                ? 14.0
                                : 26.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                    textAlign: TextAlign.end,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Builder(
                    builder: (context) {
                      final arrivingPlayerWidget =
                          widget!.thisSession?.arriving?.toList() ?? [];

                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: arrivingPlayerWidget.length,
                        itemBuilder: (context, arrivingPlayerWidgetIndex) {
                          final arrivingPlayerWidgetItem =
                              arrivingPlayerWidget[arrivingPlayerWidgetIndex];
                          return Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
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
                                  value: _model.arrivedCheckboxValueMap[
                                      arrivingPlayerWidgetItem] ??= false,
                                  onChanged: (newValue) async {
                                    safeSetState(() => _model
                                            .arrivedCheckboxValueMap[
                                        arrivingPlayerWidgetItem] = newValue!);
                                  },
                                  side: (FlutterFlowTheme.of(context)
                                              .alternate !=
                                          null)
                                      ? BorderSide(
                                          width: 2,
                                          color: FlutterFlowTheme.of(context)
                                              .alternate!,
                                        )
                                      : null,
                                  activeColor:
                                      FlutterFlowTheme.of(context).primary,
                                  checkColor: FlutterFlowTheme.of(context).info,
                                ),
                              ),
                              StreamBuilder<List<UsersRecord>>(
                                stream: queryUsersRecord(
                                  queryBuilder: (usersRecord) =>
                                      usersRecord.where(
                                    'uid',
                                    isEqualTo: arrivingPlayerWidgetItem,
                                  ),
                                  singleRecord: true,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<UsersRecord> textUsersRecordList =
                                      snapshot.data!;
                                  // Return an empty Container when the item does not exist.
                                  if (snapshot.data!.isEmpty) {
                                    return Container();
                                  }
                                  final textUsersRecord =
                                      textUsersRecordList.isNotEmpty
                                          ? textUsersRecordList.first
                                          : null;

                                  return Text(
                                    valueOrDefault<String>(
                                      textUsersRecord?.displayName,
                                      'רן סעד',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          fontSize:
                                              MediaQuery.sizeOf(context).width <
                                                      kBreakpointSmall
                                                  ? 16.0
                                                  : 28.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  );
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                  child: Text(
                    'לא אישרו הגעה',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          fontSize: MediaQuery.sizeOf(context).width <
                                  kBreakpointSmall
                              ? 18.0
                              : 30.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Builder(
                    builder: (context) {
                      final unAprrovedPlayerWidget = widget!
                              .thisSession?.players
                              ?.where((e) =>
                                  !widget!.thisSession!.arriving.contains(e))
                              .toList()
                              ?.toList() ??
                          [];

                      return ListView.separated(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: unAprrovedPlayerWidget.length,
                        separatorBuilder: (_, __) => SizedBox(height: 2.0),
                        itemBuilder: (context, unAprrovedPlayerWidgetIndex) {
                          final unAprrovedPlayerWidgetItem =
                              unAprrovedPlayerWidget[
                                  unAprrovedPlayerWidgetIndex];
                          return Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              StreamBuilder<List<UsersRecord>>(
                                stream: queryUsersRecord(
                                  queryBuilder: (usersRecord) =>
                                      usersRecord.where(
                                    'uid',
                                    isEqualTo: unAprrovedPlayerWidgetItem,
                                  ),
                                  singleRecord: true,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<UsersRecord> textUsersRecordList =
                                      snapshot.data!;
                                  // Return an empty Container when the item does not exist.
                                  if (snapshot.data!.isEmpty) {
                                    return Container();
                                  }
                                  final textUsersRecord =
                                      textUsersRecordList.isNotEmpty
                                          ? textUsersRecordList.first
                                          : null;

                                  return Text(
                                    valueOrDefault<String>(
                                      textUsersRecord?.displayName,
                                      'רן סעד',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          fontSize:
                                              MediaQuery.sizeOf(context).width <
                                                      kBreakpointSmall
                                                  ? 16.0
                                                  : 28.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  );
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: StreamBuilder<List<UsersRecord>>(
                    stream: queryUsersRecord(
                      queryBuilder: (usersRecord) => usersRecord.whereIn(
                          'childUID', widget!.thisSession?.players),
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
                      List<UsersRecord> buttonUsersRecordList = snapshot.data!;

                      return FFButtonWidget(
                        onPressed: () async {
                          await widget!.thisSession!.reference.update({
                            ...mapToFirestore(
                              {
                                'indeedArrivedPlayers':
                                    _model.arrivedCheckboxCheckedItems,
                              },
                            ),
                          });
                          // notifies the arrived players
                          triggerPushNotification(
                            notificationTitle: 'נוכחות סומנה!',
                            notificationText: 'בנך/בתך הגיעו לאימון!',
                            userRefs: buttonUsersRecordList
                                .where((e) => widget!
                                    .thisSession!.indeedArrivedPlayers
                                    .contains(e.childUID))
                                .toList()
                                .map((e) => e.reference)
                                .toList(),
                            initialPageName: 'HomePage',
                            parameterData: {},
                          );
                          // notifies the unarrived players
                          triggerPushNotification(
                            notificationTitle: 'נוכחות סומנה!',
                            notificationText: 'בנך/בתך לא הגיעו לאימון!',
                            userRefs: buttonUsersRecordList
                                .where((e) => !widget!
                                    .thisSession!.indeedArrivedPlayers
                                    .contains(e.childUID))
                                .toList()
                                .map((e) => e.reference)
                                .toList(),
                            initialPageName: 'HomePage',
                            parameterData: {},
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'הנוכחות עודכנה בהצלחה',
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).secondary,
                            ),
                          );
                          Navigator.pop(context);
                        },
                        text: 'אישור נוכחות',
                        options: FFButtonOptions(
                          height: MediaQuery.sizeOf(context).width <
                                  kBreakpointSmall
                              ? 30.0
                              : 42.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
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
                                        ? 16.0
                                        : 28.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(18.0),
                          hoverElevation: 5.0,
                        ),
                      );
                    },
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

import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/add_session_componet_widget.dart';
import '/components/custom_app_bar_widget.dart';
import '/components/custom_drawer_widget.dart';
import '/delete_confirmations/delete_session_confirmation/delete_session_confirmation_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'next_sessions_model.dart';
export 'next_sessions_model.dart';

class NextSessionsWidget extends StatefulWidget {
  const NextSessionsWidget({super.key});

  static String routeName = 'nextSessions';
  static String routePath = '/nextPractice';

  @override
  State<NextSessionsWidget> createState() => _NextSessionsWidgetState();
}

class _NextSessionsWidgetState extends State<NextSessionsWidget> {
  late NextSessionsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NextSessionsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<SessionsRecord>>(
      stream: querySessionsRecord(
        queryBuilder: (sessionsRecord) => sessionsRecord
            .where(
              'status',
              isEqualTo: SessionStatus.upcoming.serialize(),
            )
            .orderBy('time'),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondary,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<SessionsRecord> nextSessionsSessionsRecordList = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondary,
            endDrawer: Drawer(
              elevation: 16.0,
              child: wrapWithModel(
                model: _model.customDrawerModel,
                updateCallback: () => safeSetState(() {}),
                child: CustomDrawerWidget(),
              ),
            ),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (responsiveVisibility(
                    context: context,
                    desktop: false,
                  ))
                    AuthUserStreamWidget(
                      builder: (context) => wrapWithModel(
                        model: _model.customAppBarModel,
                        updateCallback: () => safeSetState(() {}),
                        child: CustomAppBarWidget(),
                      ),
                    ),
                  Flexible(
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              'https://images.unsplash.com/photo-1608245449230-4ac19066d2d0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8YmFza2V0YmFsbHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60',
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Opacity(
                            opacity: 0.7,
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(valueOrDefault<double>(
                              MediaQuery.sizeOf(context).width <
                                      kBreakpointSmall
                                  ? 0.0
                                  : 8.0,
                              0.0,
                            )),
                            child: RefreshIndicator(
                              color: FlutterFlowTheme.of(context).primary,
                              onRefresh: () async {
                                await nextSessionsSessionsRecordList
                                    .where((e) => e.time! < getCurrentTimestamp)
                                    .toList()
                                    .firstOrNull!
                                    .reference
                                    .update(createSessionsRecordData(
                                      status: SessionStatus.pendingForSum,
                                    ));
                              },
                              child: SingleChildScrollView(
                                physics: const AlwaysScrollableScrollPhysics(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        if (responsiveVisibility(
                                          context: context,
                                          phone: false,
                                        ))
                                          Align(
                                            alignment:
                                                AlignmentDirectional(1.0, -1.0),
                                            child: Padding(
                                              padding: EdgeInsets.all(5.0),
                                              child: FlutterFlowIconButton(
                                                borderRadius: 8.0,
                                                buttonSize: 60.0,
                                                icon: Icon(
                                                  Icons.notes,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                  size: 45.0,
                                                ),
                                                onPressed: () async {
                                                  scaffoldKey.currentState!
                                                      .openEndDrawer();
                                                },
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                    Flexible(
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Builder(
                                          builder: (context) {
                                            if (nextSessionsSessionsRecordList
                                                .where((e) =>
                                                    e.players.contains(
                                                        currentUserUid) ||
                                                    (e.coach ==
                                                        currentUserUid) ||
                                                    ((currentUserDocument
                                                                ?.role ==
                                                            Role.coach) &&
                                                        (e.name ==
                                                            'אימון אקדמיה')) ||
                                                    (currentUserDocument
                                                                ?.role ==
                                                            Role.parent
                                                        ? e.players.contains(
                                                            valueOrDefault(
                                                                currentUserDocument
                                                                    ?.childUID,
                                                                ''))
                                                        : false))
                                                .toList()
                                                .isNotEmpty) {
                                              return Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Builder(
                                                      builder: (context) {
                                                        if (currentUserDocument
                                                                ?.role ==
                                                            Role.parent) {
                                                          return Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        15.0,
                                                                        0.0,
                                                                        0.0,
                                                                        12.0),
                                                            child: StreamBuilder<
                                                                List<
                                                                    UsersRecord>>(
                                                              stream:
                                                                  queryUsersRecord(
                                                                queryBuilder:
                                                                    (usersRecord) =>
                                                                        usersRecord
                                                                            .where(
                                                                  'parent',
                                                                  isEqualTo:
                                                                      currentUserReference,
                                                                ),
                                                                singleRecord:
                                                                    true,
                                                              ),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          50.0,
                                                                      height:
                                                                          50.0,
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        valueColor:
                                                                            AlwaysStoppedAnimation<Color>(
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                List<UsersRecord>
                                                                    textUsersRecordList =
                                                                    snapshot
                                                                        .data!;
                                                                // Return an empty Container when the item does not exist.
                                                                if (snapshot
                                                                    .data!
                                                                    .isEmpty) {
                                                                  return Container();
                                                                }
                                                                final textUsersRecord =
                                                                    textUsersRecordList
                                                                            .isNotEmpty
                                                                        ? textUsersRecordList
                                                                            .first
                                                                        : null;

                                                                return Text(
                                                                  'האימון הבא של ${textUsersRecord?.displayName}',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .heebo(
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .headlineMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                        fontSize: MediaQuery.sizeOf(context).width <
                                                                                kBreakpointSmall
                                                                            ? 28.0
                                                                            : 36.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .headlineMedium
                                                                            .fontStyle,
                                                                      ),
                                                                );
                                                              },
                                                            ),
                                                          );
                                                        } else {
                                                          return Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        10.0,
                                                                        12.0),
                                                            child: Text(
                                                              'האימון הבא שלך',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .heebo(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                                    fontSize: MediaQuery.sizeOf(context).width <
                                                                            kBreakpointSmall
                                                                        ? 30.0
                                                                        : 38.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          );
                                                        }
                                                      },
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  15.0,
                                                                  0.0,
                                                                  15.0,
                                                                  0.0),
                                                      child: Material(
                                                        color:
                                                            Colors.transparent,
                                                        elevation: 5.0,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        child: Container(
                                                          width: MediaQuery.sizeOf(
                                                                          context)
                                                                      .width <
                                                                  kBreakpointSmall
                                                              ? double.infinity
                                                              : 800.0,
                                                          height: MediaQuery.sizeOf(
                                                                          context)
                                                                      .width <
                                                                  kBreakpointSmall
                                                              ? 210.0
                                                              : 280.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              nextSessionsSessionsRecordList
                                                                      .where((e) =>
                                                                          e.players.contains(
                                                                              currentUserUid) ||
                                                                          (e.coach ==
                                                                              currentUserUid) ||
                                                                          ((currentUserDocument?.role == Role.coach) &&
                                                                              e
                                                                                  .isAcademy) ||
                                                                          (currentUserDocument?.role == Role.parent
                                                                              ? e.players.contains(valueOrDefault(
                                                                                  currentUserDocument
                                                                                      ?.childUID,
                                                                                  ''))
                                                                              : false))
                                                                      .toList()
                                                                      .firstOrNull!
                                                                      .arriving
                                                                      .contains(
                                                                          currentUserUid)
                                                                  ? Color(
                                                                      0xFF1FCD12)
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary,
                                                            ),
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 5.0,
                                                                color: Color(
                                                                    0x33000000),
                                                                offset: Offset(
                                                                  0.0,
                                                                  2.0,
                                                                ),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              5.0),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          nextSessionsSessionsRecordList
                                                                              .where((e) => e.players.contains(currentUserUid) || (e.coach == currentUserUid) || ((currentUserDocument?.role == Role.coach) && (e.name == 'אימון אקדמיה')) || (currentUserDocument?.role == Role.parent ? e.players.contains(valueOrDefault(currentUserDocument?.childUID, '')) : false))
                                                                              .toList()
                                                                              .firstOrNull
                                                                              ?.name,
                                                                          'אימון אקדמיה',
                                                                        ),
                                                                        textAlign:
                                                                            TextAlign.end,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .headlineSmall
                                                                            .override(
                                                                              font: GoogleFonts.plusJakartaSans(
                                                                                fontWeight: FontWeight.bold,
                                                                                fontStyle: FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                                                                              ),
                                                                              color: Color(0xFF101213),
                                                                              fontSize: MediaQuery.sizeOf(context).width < kBreakpointSmall ? 24.0 : 32.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                              fontStyle: FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    if (valueOrDefault<
                                                                            String>(
                                                                          nextSessionsSessionsRecordList
                                                                              .where((e) => e.players.contains(currentUserUid) || (e.coach == currentUserUid) || ((currentUserDocument?.role == Role.coach) && (e.name == 'אימון אקדמיה')) || (currentUserDocument?.role == Role.parent ? e.players.contains(valueOrDefault(currentUserDocument?.childUID, '')) : false))
                                                                              .toList()
                                                                              .firstOrNull
                                                                              ?.coach,
                                                                          'אימון אקדמיה',
                                                                        ) ==
                                                                        currentUserUid)
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            Builder(
                                                                              builder: (context) => InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  await showDialog(
                                                                                    context: context,
                                                                                    builder: (dialogContext) {
                                                                                      return Dialog(
                                                                                        elevation: 0,
                                                                                        insetPadding: EdgeInsets.zero,
                                                                                        backgroundColor: Colors.transparent,
                                                                                        alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                        child: GestureDetector(
                                                                                          onTap: () {
                                                                                            FocusScope.of(dialogContext).unfocus();
                                                                                            FocusManager.instance.primaryFocus?.unfocus();
                                                                                          },
                                                                                          child: AddSessionComponetWidget(
                                                                                            seesoionDoc: nextSessionsSessionsRecordList.where((e) => e.players.contains(currentUserUid) || (e.coach == currentUserUid) || ((currentUserDocument?.role == Role.coach) && (e.name == 'אימון אקדמיה')) || (currentUserDocument?.role == Role.parent ? e.players.contains(valueOrDefault(currentUserDocument?.childUID, '')) : false)).toList().firstOrNull,
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  );
                                                                                },
                                                                                child: Icon(
                                                                                  Icons.edit,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  size: MediaQuery.sizeOf(context).width < kBreakpointSmall ? 24.0 : 32.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Builder(
                                                                              builder: (context) => InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  await showDialog(
                                                                                    context: context,
                                                                                    builder: (dialogContext) {
                                                                                      return Dialog(
                                                                                        elevation: 0,
                                                                                        insetPadding: EdgeInsets.zero,
                                                                                        backgroundColor: Colors.transparent,
                                                                                        alignment: AlignmentDirectional(-0.0, 0.0).resolve(Directionality.of(context)),
                                                                                        child: GestureDetector(
                                                                                          onTap: () {
                                                                                            FocusScope.of(dialogContext).unfocus();
                                                                                            FocusManager.instance.primaryFocus?.unfocus();
                                                                                          },
                                                                                          child: DeleteSessionConfirmationWidget(
                                                                                            sessionsDoc: nextSessionsSessionsRecordList.where((e) => e.players.contains(currentUserUid) || (e.coach == currentUserUid) || ((currentUserDocument?.role == Role.coach) && (e.name == 'אימון אקדמיה')) || (currentUserDocument?.role == Role.parent ? e.players.contains(valueOrDefault(currentUserDocument?.childUID, '')) : false)).toList().firstOrNull!,
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  );
                                                                                },
                                                                                child: Icon(
                                                                                  Icons.delete,
                                                                                  color: FlutterFlowTheme.of(context).error,
                                                                                  size: MediaQuery.sizeOf(context).width < kBreakpointSmall ? 24.0 : 32.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ].divide(SizedBox(width: 5.0)),
                                                                        ),
                                                                      ),
                                                                  ].divide(SizedBox(
                                                                      width:
                                                                          2.0)),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children:
                                                                            [
                                                                          Icon(
                                                                            Icons.calendar_month,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            size: MediaQuery.sizeOf(context).width < kBreakpointSmall
                                                                                ? 24.0
                                                                                : 32.0,
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                4.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              valueOrDefault<String>(
                                                                                dateTimeFormat(
                                                                                  "d/M H:mm",
                                                                                  nextSessionsSessionsRecordList.where((e) => e.players.contains(currentUserUid) || (e.coach == currentUserUid) || ((currentUserDocument?.role == Role.coach) && (e.name == 'אימון אקדמיה')) || (currentUserDocument?.role == Role.parent ? e.players.contains(valueOrDefault(currentUserDocument?.childUID, '')) : false)).toList().firstOrNull?.time,
                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                ),
                                                                                'אימון אקדמיה',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.plusJakartaSans(
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: FlutterFlowTheme.of(context).accent1,
                                                                                    fontSize: MediaQuery.sizeOf(context).width < kBreakpointSmall ? 14.0 : 22.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(width: 5.0)).around(SizedBox(width: 5.0)),
                                                                      ),
                                                                      Builder(
                                                                        builder:
                                                                            (context) {
                                                                          if (currentUserDocument?.role ==
                                                                              Role.coach) {
                                                                            return Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                children: [
                                                                                  Icon(
                                                                                    Icons.group,
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    size: MediaQuery.sizeOf(context).width < kBreakpointSmall ? 24.0 : 32.0,
                                                                                  ),
                                                                                  Align(
                                                                                    alignment: AlignmentDirectional(1.0, 0.0),
                                                                                    child: Builder(
                                                                                      builder: (context) {
                                                                                        if (!nextSessionsSessionsRecordList.where((e) => e.players.contains(currentUserUid) || (e.coach == currentUserUid) || ((currentUserDocument?.role == Role.coach) && (e.name == 'אימון אקדמיה')) || (currentUserDocument?.role == Role.parent ? e.players.contains(valueOrDefault(currentUserDocument?.childUID, '')) : false)).toList().firstOrNull!.isAcademy) {
                                                                                          return StreamBuilder<List<UsersRecord>>(
                                                                                            stream: queryUsersRecord(
                                                                                              queryBuilder: (usersRecord) => usersRecord.whereIn('uid', nextSessionsSessionsRecordList.where((e) => e.players.contains(currentUserUid) || (e.coach == currentUserUid) || ((currentUserDocument?.role == Role.coach) && e.isAcademy) || (currentUserDocument?.role == Role.parent ? e.players.contains(valueOrDefault(currentUserDocument?.childUID, '')) : false)).toList().firstOrNull?.players),
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
                                                                                              List<UsersRecord> rowUsersRecordList = snapshot.data!;

                                                                                              return Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                                                children: List.generate(rowUsersRecordList.length, (rowIndex) {
                                                                                                  final rowUsersRecord = rowUsersRecordList[rowIndex];
                                                                                                  return Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 12.0),
                                                                                                    child: Text(
                                                                                                      rowIndex == 0 ? rowUsersRecord.displayName : ', ${rowUsersRecord.displayName}',
                                                                                                      textAlign: TextAlign.end,
                                                                                                      style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                            font: GoogleFonts.plusJakartaSans(
                                                                                                              fontWeight: FontWeight.w500,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                            ),
                                                                                                            color: Color(0xFF57636C),
                                                                                                            fontSize: MediaQuery.sizeOf(context).width < kBreakpointSmall ? 14.0 : 22.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.w500,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                          ),
                                                                                                    ),
                                                                                                  );
                                                                                                }),
                                                                                              );
                                                                                            },
                                                                                          );
                                                                                        } else {
                                                                                          return Text(
                                                                                            'קבוצת אקדמיה ${valueOrDefault<String>(
                                                                                              nextSessionsSessionsRecordList.where((e) => e.players.contains(currentUserUid) || (e.coach == currentUserUid) || ((currentUserDocument?.role == Role.coach) && (e.name == 'אימון אקדמיה')) || (currentUserDocument?.role == Role.parent ? e.players.contains(valueOrDefault(currentUserDocument?.childUID, '')) : false)).toList().firstOrNull?.academyGroup,
                                                                                              '1',
                                                                                            )}',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  font: GoogleFonts.inter(
                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                                  fontSize: MediaQuery.sizeOf(context).width < kBreakpointSmall ? 14.0 : 22.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                          );
                                                                                        }
                                                                                      },
                                                                                    ),
                                                                                  ),
                                                                                ].divide(SizedBox(width: 5.0)).around(SizedBox(width: 5.0)),
                                                                              ),
                                                                            );
                                                                          } else {
                                                                            return Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                children: [
                                                                                  Icon(
                                                                                    Icons.group,
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    size: MediaQuery.sizeOf(context).width < kBreakpointSmall ? 24.0 : 32.0,
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 12.0),
                                                                                    child: StreamBuilder<List<UsersRecord>>(
                                                                                      stream: queryUsersRecord(
                                                                                        queryBuilder: (usersRecord) => usersRecord.where(
                                                                                          'uid',
                                                                                          isEqualTo: nextSessionsSessionsRecordList.where((e) => e.players.contains(currentUserUid) || (e.coach == currentUserUid) || ((currentUserDocument?.role == Role.coach) && e.isAcademy) || (currentUserDocument?.role == Role.parent ? e.players.contains(valueOrDefault(currentUserDocument?.childUID, '')) : false)).toList().firstOrNull?.coach,
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
                                                                                                valueColor: AlwaysStoppedAnimation<Color>(
                                                                                                  FlutterFlowTheme.of(context).primary,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        }
                                                                                        List<UsersRecord> textUsersRecordList = snapshot.data!;
                                                                                        // Return an empty Container when the item does not exist.
                                                                                        if (snapshot.data!.isEmpty) {
                                                                                          return Container();
                                                                                        }
                                                                                        final textUsersRecord = textUsersRecordList.isNotEmpty ? textUsersRecordList.first : null;

                                                                                        return Text(
                                                                                          valueOrDefault<String>(
                                                                                            nextSessionsSessionsRecordList.where((e) => e.players.contains(currentUserUid) || (e.coach == currentUserUid) || ((currentUserDocument?.role == Role.coach) && e.isAcademy) || (currentUserDocument?.role == Role.parent ? e.players.contains(valueOrDefault(currentUserDocument?.childUID, '')) : false)).toList().firstOrNull!.isAcademy ? 'צוות האקדמיה' : textUsersRecord?.displayName,
                                                                                            'אסף נוני',
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                font: GoogleFonts.plusJakartaSans(
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                ),
                                                                                                color: Color(0xFF57636C),
                                                                                                fontSize: MediaQuery.sizeOf(context).width < kBreakpointSmall ? 14.0 : 20.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w500,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                        );
                                                                                      },
                                                                                    ),
                                                                                  ),
                                                                                ].divide(SizedBox(width: 5.0)).around(SizedBox(width: 5.0)),
                                                                              ),
                                                                            );
                                                                          }
                                                                        },
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children:
                                                                            [
                                                                          Icon(
                                                                            Icons.place,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            size: MediaQuery.sizeOf(context).width < kBreakpointSmall
                                                                                ? 24.0
                                                                                : 32.0,
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                8.0,
                                                                                0.0,
                                                                                12.0),
                                                                            child:
                                                                                Text(
                                                                              valueOrDefault<String>(
                                                                                nextSessionsSessionsRecordList.where((e) => e.players.contains(currentUserUid) || (e.coach == currentUserUid) || ((currentUserDocument?.role == Role.coach) && (e.name == 'אימון אקדמיה')) || (currentUserDocument?.role == Role.parent ? e.players.contains(valueOrDefault(currentUserDocument?.childUID, '')) : false)).toList().firstOrNull?.location,
                                                                                'אימון אקדמיה',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                    font: GoogleFonts.plusJakartaSans(
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                    ),
                                                                                    color: Color(0xFF57636C),
                                                                                    fontSize: MediaQuery.sizeOf(context).width < kBreakpointSmall ? 14.0 : 22.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(width: 5.0)).around(SizedBox(width: 5.0)),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          2.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      if (currentUserDocument
                                                                              ?.role ==
                                                                          Role.coach)
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                              child: FlutterFlowIconButton(
                                                                                borderRadius: 15.0,
                                                                                buttonSize: MediaQuery.sizeOf(context).width < kBreakpointSmall ? 40.0 : 48.0,
                                                                                fillColor: FlutterFlowTheme.of(context).primary,
                                                                                icon: Icon(
                                                                                  Icons.arrow_forward_sharp,
                                                                                  color: FlutterFlowTheme.of(context).info,
                                                                                  size: MediaQuery.sizeOf(context).width < kBreakpointSmall ? 24.0 : 32.0,
                                                                                ),
                                                                                onPressed: () async {
                                                                                  context.pushNamed(
                                                                                    PlayersPageWidget.routeName,
                                                                                    queryParameters: {
                                                                                      'titleText': serializeParam(
                                                                                        'אישרו הגעה',
                                                                                        ParamType.String,
                                                                                      ),
                                                                                      'navigtionAction': serializeParam(
                                                                                        1,
                                                                                        ParamType.int,
                                                                                      ),
                                                                                      'arrivingList': serializeParam(
                                                                                        nextSessionsSessionsRecordList.where((e) => e.players.contains(currentUserUid) || (e.coach == currentUserUid) || ((currentUserDocument?.role == Role.coach) && (e.name == 'אימון אקדמיה')) || (currentUserDocument?.role == Role.parent ? e.players.contains(valueOrDefault(currentUserDocument?.childUID, '')) : false)).toList().firstOrNull?.arriving,
                                                                                        ParamType.String,
                                                                                        isList: true,
                                                                                      ),
                                                                                    }.withoutNulls,
                                                                                  );
                                                                                },
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      if (currentUserDocument
                                                                              ?.role ==
                                                                          Role.player)
                                                                        Builder(
                                                                          builder:
                                                                              (context) {
                                                                            if (!nextSessionsSessionsRecordList.where((e) => e.players.contains(currentUserUid) || (e.coach == currentUserUid) || ((currentUserDocument?.role == Role.coach) && (e.name == 'אימון אקדמיה')) || (currentUserDocument?.role == Role.parent ? e.players.contains(valueOrDefault(currentUserDocument?.childUID, '')) : false)).toList().firstOrNull!.arriving.contains(currentUserUid)) {
                                                                              return Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
                                                                                child: FFButtonWidget(
                                                                                  onPressed: () async {
                                                                                    await nextSessionsSessionsRecordList.where((e) => e.players.contains(currentUserUid) || (e.coach == currentUserUid) || ((currentUserDocument?.role == Role.coach) && (e.name == 'אימון אקדמיה')) || (currentUserDocument?.role == Role.parent ? e.players.contains(valueOrDefault(currentUserDocument?.childUID, '')) : false)).toList().firstOrNull!.reference.update({
                                                                                      ...mapToFirestore(
                                                                                        {
                                                                                          'arriving': FieldValue.arrayUnion([
                                                                                            currentUserUid
                                                                                          ]),
                                                                                        },
                                                                                      ),
                                                                                    });
                                                                                  },
                                                                                  text: 'אישור הגעה',
                                                                                  options: FFButtonOptions(
                                                                                    height: MediaQuery.sizeOf(context).width < kBreakpointSmall ? 30.0 : 38.0,
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                          font: GoogleFonts.interTight(
                                                                                            fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                          ),
                                                                                          color: Colors.white,
                                                                                          fontSize: MediaQuery.sizeOf(context).width < kBreakpointSmall ? 16.0 : 24.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                        ),
                                                                                    elevation: 0.0,
                                                                                    borderRadius: BorderRadius.circular(valueOrDefault<double>(
                                                                                      MediaQuery.sizeOf(context).width < kBreakpointSmall ? 15.0 : 20.0,
                                                                                      0.0,
                                                                                    )),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            } else {
                                                                              return Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 3.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    ClipRRect(
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                      child: Image.asset(
                                                                                        'assets/images/BEYOND_(7).png',
                                                                                        width: MediaQuery.sizeOf(context).width < kBreakpointSmall ? 35.0 : 50.0,
                                                                                        height: MediaQuery.sizeOf(context).width < kBreakpointSmall ? 35.0 : 50.0,
                                                                                        fit: BoxFit.fill,
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                      child: Text(
                                                                                        'אישרת הגעה ',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FontWeight.w600,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              fontSize: MediaQuery.sizeOf(context).width < kBreakpointSmall ? 16.0 : 24.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w600,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ].divide(SizedBox(width: 5.0)),
                                                                                ),
                                                                              );
                                                                            }
                                                                          },
                                                                        ),
                                                                      if (currentUserDocument
                                                                              ?.role ==
                                                                          Role.parent)
                                                                        Builder(
                                                                          builder:
                                                                              (context) {
                                                                            if (nextSessionsSessionsRecordList.where((e) => e.players.contains(currentUserUid) || (e.coach == currentUserUid) || ((currentUserDocument?.role == Role.coach) && (e.name == 'אימון אקדמיה')) || (currentUserDocument?.role == Role.parent ? e.players.contains(valueOrDefault(currentUserDocument?.childUID, '')) : false)).toList().firstOrNull?.arriving?.contains(valueOrDefault(currentUserDocument?.childUID, '')) ??
                                                                                false) {
                                                                              return Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                child: Material(
                                                                                  color: Colors.transparent,
                                                                                  elevation: 3.0,
                                                                                  shape: RoundedRectangleBorder(
                                                                                    borderRadius: BorderRadius.circular(15.0),
                                                                                  ),
                                                                                  child: Container(
                                                                                    decoration: BoxDecoration(
                                                                                      color: Color(0xFF11AF11),
                                                                                      borderRadius: BorderRadius.circular(15.0),
                                                                                      border: Border.all(
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        width: 2.0,
                                                                                      ),
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsets.all(5.0),
                                                                                      child: Text(
                                                                                        'אושרה הגעה!',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FontWeight.w600,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              fontSize: MediaQuery.sizeOf(context).width < kBreakpointSmall ? 14.0 : 22.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w600,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            } else {
                                                                              return Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                child: Material(
                                                                                  color: Colors.transparent,
                                                                                  elevation: 3.0,
                                                                                  shape: RoundedRectangleBorder(
                                                                                    borderRadius: BorderRadius.circular(15.0),
                                                                                  ),
                                                                                  child: Container(
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).secondary,
                                                                                      borderRadius: BorderRadius.circular(15.0),
                                                                                      border: Border.all(
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        width: 2.0,
                                                                                      ),
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsets.all(5.0),
                                                                                      child: Text(
                                                                                        'לא אושרה הגעה!',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FontWeight.w600,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              fontSize: MediaQuery.sizeOf(context).width < kBreakpointSmall ? 14.0 : 22.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w600,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            }
                                                                          },
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ].addToStart(
                                                                  SizedBox(
                                                                      height:
                                                                          5.0)),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            } else {
                                              return Container(
                                                width: double.infinity,
                                                height: 100.0,
                                                decoration: BoxDecoration(),
                                                child: AuthUserStreamWidget(
                                                  builder: (context) => Text(
                                                    currentUserDocument?.role ==
                                                            Role.coach
                                                        ? 'לא קיימים לך אימונים צפויים'
                                                        : 'אין אימונים צפויים, צור קשר עם המאמן על מנת לקבוע אימון',
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          fontSize: 24.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ),
                                              );
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                    Builder(
                                      builder: (context) {
                                        if (nextSessionsSessionsRecordList
                                                .where((e) =>
                                                    e.players.contains(
                                                        currentUserUid) ||
                                                    (e.coach ==
                                                        currentUserUid) ||
                                                    ((currentUserDocument
                                                                ?.role ==
                                                            Role.coach) &&
                                                        (e.name ==
                                                            'אימון אקדמיה')) ||
                                                    (currentUserDocument
                                                                ?.role ==
                                                            Role.parent
                                                        ? e.players.contains(
                                                            valueOrDefault(
                                                                currentUserDocument
                                                                    ?.childUID,
                                                                ''))
                                                        : false))
                                                .toList()
                                                .length >
                                            1) {
                                          return Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        15.0, 0.0, 0.0, 5.0),
                                                child: StreamBuilder<
                                                    List<UsersRecord>>(
                                                  stream: queryUsersRecord(
                                                    queryBuilder:
                                                        (usersRecord) =>
                                                            usersRecord.where(
                                                      'parent',
                                                      isEqualTo:
                                                          currentUserReference,
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
                                                          child:
                                                              CircularProgressIndicator(
                                                            valueColor:
                                                                AlwaysStoppedAnimation<
                                                                    Color>(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<UsersRecord>
                                                        textUsersRecordList =
                                                        snapshot.data!;
                                                    final textUsersRecord =
                                                        textUsersRecordList
                                                                .isNotEmpty
                                                            ? textUsersRecordList
                                                                .first
                                                            : null;

                                                    return Text(
                                                      valueOrDefault<String>(
                                                        textUsersRecord != null
                                                            ? 'שאר האימונים של ${textUsersRecord?.displayName}'
                                                            : 'שאר האימונים שלך',
                                                        'שאר האימונים שלך',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .heebo(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                                fontSize: MediaQuery.sizeOf(context)
                                                                            .width <
                                                                        kBreakpointSmall
                                                                    ? 26.0
                                                                    : 34.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMedium
                                                                    .fontStyle,
                                                              ),
                                                    );
                                                  },
                                                ),
                                              ),
                                              Builder(
                                                builder: (context) {
                                                  final upcomingSessionWidget = nextSessionsSessionsRecordList
                                                      .where((e) =>
                                                          e.players.contains(
                                                              currentUserUid) ||
                                                          (e.coach ==
                                                              currentUserUid) ||
                                                          ((currentUserDocument
                                                                      ?.role ==
                                                                  Role.coach) &&
                                                              (e.name ==
                                                                  'אימון אקדמיה')) ||
                                                          (currentUserDocument
                                                                      ?.role ==
                                                                  Role.parent
                                                              ? e.players.contains(
                                                                  valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.childUID,
                                                                      ''))
                                                              : false))
                                                      .toList()
                                                      .take(10)
                                                      .toList();

                                                  return ListView.separated(
                                                    padding: EdgeInsets.zero,
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        upcomingSessionWidget
                                                            .length,
                                                    separatorBuilder: (_, __) =>
                                                        SizedBox(height: 8.0),
                                                    itemBuilder: (context,
                                                        upcomingSessionWidgetIndex) {
                                                      final upcomingSessionWidgetItem =
                                                          upcomingSessionWidget[
                                                              upcomingSessionWidgetIndex];
                                                      return Visibility(
                                                        visible:
                                                            upcomingSessionWidgetIndex >
                                                                0,
                                                        child: StreamBuilder<
                                                            List<
                                                                SessionsRecord>>(
                                                          stream:
                                                              querySessionsRecord(
                                                            queryBuilder:
                                                                (sessionsRecord) =>
                                                                    sessionsRecord
                                                                        .where(
                                                              'sessionID',
                                                              isEqualTo:
                                                                  upcomingSessionWidgetItem
                                                                      .sessionID,
                                                            ),
                                                            singleRecord: true,
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    valueColor:
                                                                        AlwaysStoppedAnimation<
                                                                            Color>(
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<SessionsRecord>
                                                                containerSessionsRecordList =
                                                                snapshot.data!;
                                                            // Return an empty Container when the item does not exist.
                                                            if (snapshot.data!
                                                                .isEmpty) {
                                                              return Container();
                                                            }
                                                            final containerSessionsRecord =
                                                                containerSessionsRecordList
                                                                        .isNotEmpty
                                                                    ? containerSessionsRecordList
                                                                        .first
                                                                    : null;

                                                            return Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width: MediaQuery.sizeOf(context).width <
                                                                              kBreakpointSmall
                                                                          ? double
                                                                              .infinity
                                                                          : 800.0,
                                                                      height: MediaQuery.sizeOf(context).width <
                                                                              kBreakpointSmall
                                                                          ? 50.0
                                                                          : 60.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                        borderRadius:
                                                                            BorderRadius.only(
                                                                          bottomLeft:
                                                                              Radius.circular(valueOrDefault<double>(
                                                                            containerSessionsRecord!.flag
                                                                                ? 0.0
                                                                                : 12.0,
                                                                            0.0,
                                                                          )),
                                                                          bottomRight:
                                                                              Radius.circular(valueOrDefault<double>(
                                                                            containerSessionsRecord!.flag
                                                                                ? 0.0
                                                                                : 12.0,
                                                                            0.0,
                                                                          )),
                                                                          topLeft:
                                                                              Radius.circular(12.0),
                                                                          topRight:
                                                                              Radius.circular(12.0),
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            EdgeInsets.all(5.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                upcomingSessionWidgetItem.name,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FontWeight.w600,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      fontSize: MediaQuery.sizeOf(context).width < kBreakpointSmall ? 22.0 : 30.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                              child: Builder(
                                                                                builder: (context) {
                                                                                  if (upcomingSessionWidgetItem.flag) {
                                                                                    return InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        await upcomingSessionWidgetItem.reference.update(createSessionsRecordData(
                                                                                          flag: false,
                                                                                        ));
                                                                                      },
                                                                                      child: Icon(
                                                                                        Icons.keyboard_arrow_down_rounded,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        size: MediaQuery.sizeOf(context).width < kBreakpointSmall ? 24.0 : 32.0,
                                                                                      ),
                                                                                    );
                                                                                  } else {
                                                                                    return InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        await upcomingSessionWidgetItem.reference.update(createSessionsRecordData(
                                                                                          flag: true,
                                                                                        ));
                                                                                      },
                                                                                      child: Icon(
                                                                                        Icons.keyboard_arrow_left,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        size: MediaQuery.sizeOf(context).width < kBreakpointSmall ? 24.0 : 32.0,
                                                                                      ),
                                                                                    );
                                                                                  }
                                                                                },
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  if (upcomingSessionWidgetItem
                                                                      .flag)
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width: MediaQuery.sizeOf(context).width <
                                                                                kBreakpointSmall
                                                                            ? double.infinity
                                                                            : 800.0,
                                                                        height: MediaQuery.sizeOf(context).width <
                                                                                kBreakpointSmall
                                                                            ? 124.0
                                                                            : 150.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          boxShadow: [
                                                                            BoxShadow(
                                                                              blurRadius: 1.0,
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              offset: Offset(
                                                                                0.0,
                                                                                2.0,
                                                                              ),
                                                                              spreadRadius: 2.0,
                                                                            )
                                                                          ],
                                                                          borderRadius:
                                                                              BorderRadius.only(
                                                                            bottomLeft:
                                                                                Radius.circular(15.0),
                                                                            bottomRight:
                                                                                Radius.circular(15.0),
                                                                            topLeft:
                                                                                Radius.circular(0.0),
                                                                            topRight:
                                                                                Radius.circular(0.0),
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 0.0),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                      children: [
                                                                                        Icon(
                                                                                          Icons.calendar_month,
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          size: MediaQuery.sizeOf(context).width < kBreakpointSmall ? 24.0 : 32.0,
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            dateTimeFormat(
                                                                                              "d/M H:mm",
                                                                                              upcomingSessionWidgetItem.time!,
                                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  font: GoogleFonts.plusJakartaSans(
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                                  color: Color(0xFF4B39EF),
                                                                                                  fontSize: MediaQuery.sizeOf(context).width < kBreakpointSmall ? 14.0 : 22.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ].divide(SizedBox(width: 5.0)).around(SizedBox(width: 5.0)),
                                                                                    ),
                                                                                    Builder(
                                                                                      builder: (context) {
                                                                                        if (currentUserDocument?.role == Role.coach) {
                                                                                          return Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                                              children: [
                                                                                                Icon(
                                                                                                  Icons.group,
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                  size: MediaQuery.sizeOf(context).width < kBreakpointSmall ? 24.0 : 32.0,
                                                                                                ),
                                                                                                Align(
                                                                                                  alignment: AlignmentDirectional(1.0, 0.0),
                                                                                                  child: Builder(
                                                                                                    builder: (context) {
                                                                                                      if (!upcomingSessionWidgetItem.isAcademy) {
                                                                                                        return StreamBuilder<List<UsersRecord>>(
                                                                                                          stream: queryUsersRecord(
                                                                                                            queryBuilder: (usersRecord) => usersRecord.whereIn('uid', containerSessionsRecord?.players),
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
                                                                                                            List<UsersRecord> rowUsersRecordList = snapshot.data!;

                                                                                                            return Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                                                              children: List.generate(rowUsersRecordList.length, (rowIndex) {
                                                                                                                final rowUsersRecord = rowUsersRecordList[rowIndex];
                                                                                                                return Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 12.0),
                                                                                                                  child: Text(
                                                                                                                    rowIndex == 0 ? rowUsersRecord.displayName : ', ${rowUsersRecord.displayName}',
                                                                                                                    textAlign: TextAlign.end,
                                                                                                                    style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                          font: GoogleFonts.plusJakartaSans(
                                                                                                                            fontWeight: FontWeight.w500,
                                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                                          ),
                                                                                                                          color: Color(0xFF57636C),
                                                                                                                          fontSize: MediaQuery.sizeOf(context).width < kBreakpointSmall ? 14.0 : 22.0,
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          fontWeight: FontWeight.w500,
                                                                                                                          fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                );
                                                                                                              }),
                                                                                                            );
                                                                                                          },
                                                                                                        );
                                                                                                      } else {
                                                                                                        return Text(
                                                                                                          'קבוצת אקדמיה ${upcomingSessionWidgetItem.academyGroup}',
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                font: GoogleFonts.inter(
                                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                ),
                                                                                                                fontSize: MediaQuery.sizeOf(context).width < kBreakpointSmall ? 14.0 : 22.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                              ),
                                                                                                        );
                                                                                                      }
                                                                                                    },
                                                                                                  ),
                                                                                                ),
                                                                                              ].divide(SizedBox(width: 5.0)).around(SizedBox(width: 5.0)),
                                                                                            ),
                                                                                          );
                                                                                        } else {
                                                                                          return Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                                              children: [
                                                                                                Icon(
                                                                                                  Icons.group,
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                  size: MediaQuery.sizeOf(context).width < kBreakpointSmall ? 24.0 : 32.0,
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 12.0),
                                                                                                  child: StreamBuilder<List<UsersRecord>>(
                                                                                                    stream: queryUsersRecord(
                                                                                                      queryBuilder: (usersRecord) => usersRecord.where(
                                                                                                        'uid',
                                                                                                        isEqualTo: upcomingSessionWidgetItem.coach,
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
                                                                                                              valueColor: AlwaysStoppedAnimation<Color>(
                                                                                                                FlutterFlowTheme.of(context).primary,
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        );
                                                                                                      }
                                                                                                      List<UsersRecord> textUsersRecordList = snapshot.data!;
                                                                                                      // Return an empty Container when the item does not exist.
                                                                                                      if (snapshot.data!.isEmpty) {
                                                                                                        return Container();
                                                                                                      }
                                                                                                      final textUsersRecord = textUsersRecordList.isNotEmpty ? textUsersRecordList.first : null;

                                                                                                      return Text(
                                                                                                        valueOrDefault<String>(
                                                                                                          upcomingSessionWidgetItem.isAcademy ? 'צוות האקדמיה' : textUsersRecord?.displayName,
                                                                                                          'אסף נוני',
                                                                                                        ),
                                                                                                        style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                              font: GoogleFonts.plusJakartaSans(
                                                                                                                fontWeight: FontWeight.w500,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                              ),
                                                                                                              color: Color(0xFF57636C),
                                                                                                              fontSize: MediaQuery.sizeOf(context).width < kBreakpointSmall ? 14.0 : 22.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FontWeight.w500,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                            ),
                                                                                                      );
                                                                                                    },
                                                                                                  ),
                                                                                                ),
                                                                                              ].divide(SizedBox(width: 5.0)).around(SizedBox(width: 5.0)),
                                                                                            ),
                                                                                          );
                                                                                        }
                                                                                      },
                                                                                    ),
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                                                          children: [
                                                                                            Icon(
                                                                                              Icons.place,
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              size: MediaQuery.sizeOf(context).width < kBreakpointSmall ? 24.0 : 32.0,
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 12.0),
                                                                                              child: Text(
                                                                                                upcomingSessionWidgetItem.location,
                                                                                                style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                      font: GoogleFonts.plusJakartaSans(
                                                                                                        fontWeight: FontWeight.w500,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                      ),
                                                                                                      color: Color(0xFF57636C),
                                                                                                      fontSize: MediaQuery.sizeOf(context).width < kBreakpointSmall ? 14.0 : 22.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ].divide(SizedBox(width: 5.0)).around(SizedBox(width: 5.0)),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsets.all(8.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                                children: [
                                                                                  if (upcomingSessionWidgetItem.coach == currentUserUid)
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Builder(
                                                                                          builder: (context) => InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              await showDialog(
                                                                                                context: context,
                                                                                                builder: (dialogContext) {
                                                                                                  return Dialog(
                                                                                                    elevation: 0,
                                                                                                    insetPadding: EdgeInsets.zero,
                                                                                                    backgroundColor: Colors.transparent,
                                                                                                    alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                    child: GestureDetector(
                                                                                                      onTap: () {
                                                                                                        FocusScope.of(dialogContext).unfocus();
                                                                                                        FocusManager.instance.primaryFocus?.unfocus();
                                                                                                      },
                                                                                                      child: AddSessionComponetWidget(
                                                                                                        seesoionDoc: upcomingSessionWidgetItem,
                                                                                                      ),
                                                                                                    ),
                                                                                                  );
                                                                                                },
                                                                                              );
                                                                                            },
                                                                                            child: Icon(
                                                                                              Icons.edit,
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              size: MediaQuery.sizeOf(context).width < kBreakpointSmall ? 24.0 : 32.0,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Builder(
                                                                                          builder: (context) => InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              await showDialog(
                                                                                                context: context,
                                                                                                builder: (dialogContext) {
                                                                                                  return Dialog(
                                                                                                    elevation: 0,
                                                                                                    insetPadding: EdgeInsets.zero,
                                                                                                    backgroundColor: Colors.transparent,
                                                                                                    alignment: AlignmentDirectional(-0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                    child: GestureDetector(
                                                                                                      onTap: () {
                                                                                                        FocusScope.of(dialogContext).unfocus();
                                                                                                        FocusManager.instance.primaryFocus?.unfocus();
                                                                                                      },
                                                                                                      child: DeleteSessionConfirmationWidget(
                                                                                                        sessionsDoc: upcomingSessionWidgetItem,
                                                                                                      ),
                                                                                                    ),
                                                                                                  );
                                                                                                },
                                                                                              );
                                                                                            },
                                                                                            child: Icon(
                                                                                              Icons.delete,
                                                                                              color: FlutterFlowTheme.of(context).error,
                                                                                              size: MediaQuery.sizeOf(context).width < kBreakpointSmall ? 24.0 : 32.0,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ].divide(SizedBox(width: 5.0)),
                                                                                    ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ],
                                          );
                                        } else {
                                          return Container(
                                            width: 0.0,
                                            height: 0.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                    if (currentUserDocument?.role == Role.coach)
                                      Builder(
                                        builder: (context) => Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 0.0),
                                          child: AuthUserStreamWidget(
                                            builder: (context) => InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await showDialog(
                                                  barrierDismissible: false,
                                                  context: context,
                                                  builder: (dialogContext) {
                                                    return Dialog(
                                                      elevation: 0,
                                                      insetPadding:
                                                          EdgeInsets.zero,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      alignment:
                                                          AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          FocusScope.of(
                                                                  dialogContext)
                                                              .unfocus();
                                                          FocusManager.instance
                                                              .primaryFocus
                                                              ?.unfocus();
                                                        },
                                                        child:
                                                            AddSessionComponetWidget(),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                                .width <
                                                            kBreakpointSmall
                                                        ? double.infinity
                                                        : 800.0,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                                .width <
                                                            kBreakpointSmall
                                                        ? 50.0
                                                        : 60.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'הוספת אימון',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize: MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointSmall
                                                                      ? 22.0
                                                                      : 30.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                      Icon(
                                                        Icons.add,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: MediaQuery.sizeOf(
                                                                        context)
                                                                    .width <
                                                                kBreakpointSmall
                                                            ? 30.0
                                                            : 38.0,
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 5.0)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                  ]
                                      .divide(SizedBox(height: 10.0))
                                      .addToStart(SizedBox(height: 10.0)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

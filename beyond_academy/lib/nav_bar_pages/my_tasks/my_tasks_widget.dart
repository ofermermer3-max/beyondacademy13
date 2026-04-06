import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/custom_app_bar_widget.dart';
import '/components/custom_drawer_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/task_widgets/task_check/task_check_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'my_tasks_model.dart';
export 'my_tasks_model.dart';

class MyTasksWidget extends StatefulWidget {
  const MyTasksWidget({super.key});

  static String routeName = 'myTasks';
  static String routePath = '/myTasks';

  @override
  State<MyTasksWidget> createState() => _MyTasksWidgetState();
}

class _MyTasksWidgetState extends State<MyTasksWidget> {
  late MyTasksModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyTasksModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<TasksRecord>>(
      stream: queryTasksRecord(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
        List<TasksRecord> myTasksTasksRecordList = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/resize.jpg',
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
                        SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (responsiveVisibility(
                                context: context,
                                phone: false,
                              ))
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
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                              if (currentUserDocument?.role != Role.coach)
                                AuthUserStreamWidget(
                                  builder: (context) => Builder(
                                    builder: (context) {
                                      final toDoTaskWidget =
                                          myTasksTasksRecordList
                                              .where((e) =>
                                                  ((e.player ==
                                                          currentUserUid) ||
                                                      (e.player ==
                                                          valueOrDefault(
                                                              currentUserDocument
                                                                  ?.childUID,
                                                              ''))) &&
                                                  (e.status ==
                                                      TaskStatus.assigned))
                                              .toList()
                                              .sortedList(
                                                  keyOf: (e) => e.deadLine!,
                                                  desc: true)
                                              .toList()
                                              .take(3)
                                              .toList();

                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: toDoTaskWidget.length,
                                        itemBuilder:
                                            (context, toDoTaskWidgetIndex) {
                                          final toDoTaskWidgetItem =
                                              toDoTaskWidget[
                                                  toDoTaskWidgetIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 5.0, 15.0, 0.0),
                                            child: Material(
                                              color: Colors.transparent,
                                              elevation: 2.0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
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
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(12.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                toDoTaskWidgetItem
                                                                    .title,
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .plusJakartaSans(
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyLarge
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Color(
                                                                          0xFF15161E),
                                                                      fontSize: MediaQuery.sizeOf(context).width <
                                                                              kBreakpointSmall
                                                                          ? 20.0
                                                                          : 30.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLarge
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  toDoTaskWidgetItem
                                                                      .description,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .outfit(
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: Color(
                                                                            0xFF606A85),
                                                                        fontSize: MediaQuery.sizeOf(context).width <
                                                                                kBreakpointSmall
                                                                            ? 16.0
                                                                            : 26.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              1.0,
                                                                              0.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children:
                                                                              [
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Icon(
                                                                                  Icons.people_alt,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  size: MediaQuery.sizeOf(context).width < kBreakpointSmall ? 24.0 : 32.0,
                                                                                ),
                                                                                Builder(
                                                                                  builder: (context) {
                                                                                    if (currentUserDocument?.role == Role.coach) {
                                                                                      return Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                        child: StreamBuilder<List<UsersRecord>>(
                                                                                          stream: queryUsersRecord(
                                                                                            queryBuilder: (usersRecord) => usersRecord.where(
                                                                                              'uid',
                                                                                              isEqualTo: toDoTaskWidgetItem.player,
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
                                                                                                textUsersRecord?.displayName,
                                                                                                'יובל בידרמן',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    font: GoogleFonts.inter(
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                                    fontSize: MediaQuery.sizeOf(context).width < kBreakpointSmall ? 14.0 : 24.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                            );
                                                                                          },
                                                                                        ),
                                                                                      );
                                                                                    } else {
                                                                                      return Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                        child: StreamBuilder<List<UsersRecord>>(
                                                                                          stream: queryUsersRecord(
                                                                                            queryBuilder: (usersRecord) => usersRecord.where(
                                                                                              'uid',
                                                                                              isEqualTo: toDoTaskWidgetItem.coach,
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
                                                                                                textUsersRecord?.displayName,
                                                                                                'אסף נוני',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    font: GoogleFonts.inter(
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                                    fontSize: MediaQuery.sizeOf(context).width < kBreakpointSmall ? 14.0 : 24.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                            );
                                                                                          },
                                                                                        ),
                                                                                      );
                                                                                    }
                                                                                  },
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Icon(
                                                                                  Icons.access_time,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  size: MediaQuery.sizeOf(context).width < kBreakpointSmall ? 24.0 : 32.0,
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    dateTimeFormat(
                                                                                      "d/M H:mm",
                                                                                      toDoTaskWidgetItem.deadLine!,
                                                                                      locale: FFLocalizations.of(context).languageCode,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          fontSize: MediaQuery.sizeOf(context).width < kBreakpointSmall ? 14.0 : 24.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ].divide(SizedBox(height: 5.0)),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    if (currentUserDocument
                                                                            ?.role ==
                                                                        Role.player)
                                                                      FFButtonWidget(
                                                                        onPressed:
                                                                            () async {
                                                                          context
                                                                              .pushNamed(
                                                                            TaskSubmitWidget.routeName,
                                                                            queryParameters:
                                                                                {
                                                                              'thisTask': serializeParam(
                                                                                toDoTaskWidgetItem,
                                                                                ParamType.Document,
                                                                              ),
                                                                            }.withoutNulls,
                                                                            extra: <String,
                                                                                dynamic>{
                                                                              'thisTask': toDoTaskWidgetItem,
                                                                            },
                                                                          );
                                                                        },
                                                                        text:
                                                                            'ביצוע',
                                                                        options:
                                                                            FFButtonOptions(
                                                                          height: MediaQuery.sizeOf(context).width < kBreakpointSmall
                                                                              ? 30.0
                                                                              : 38.0,
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              16.0,
                                                                              0.0,
                                                                              16.0,
                                                                              0.0),
                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).accent1,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .override(
                                                                                font: GoogleFonts.interTight(
                                                                                  fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                ),
                                                                                color: Colors.white,
                                                                                fontSize: MediaQuery.sizeOf(context).width < kBreakpointSmall ? 18.0 : 26.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                              ),
                                                                          elevation:
                                                                              0.0,
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                        ),
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
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              if (currentUserDocument?.role != Role.coach)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15.0, 10.0, 15.0, 0.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => Material(
                                      color: Colors.transparent,
                                      elevation: 2.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(
                                              valueOrDefault<double>(
                                            _model.taskDoneToggle ? 0.0 : 15.0,
                                            0.0,
                                          )),
                                          bottomRight: Radius.circular(
                                              valueOrDefault<double>(
                                            _model.taskDoneToggle ? 0.0 : 15.0,
                                            0.0,
                                          )),
                                          topLeft: Radius.circular(15.0),
                                          topRight: Radius.circular(15.0),
                                        ),
                                      ),
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
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
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(
                                                valueOrDefault<double>(
                                              _model.taskDoneToggle
                                                  ? 0.0
                                                  : 15.0,
                                              0.0,
                                            )),
                                            bottomRight: Radius.circular(
                                                valueOrDefault<double>(
                                              _model.taskDoneToggle
                                                  ? 0.0
                                                  : 15.0,
                                              0.0,
                                            )),
                                            topLeft: Radius.circular(15.0),
                                            topRight: Radius.circular(15.0),
                                          ),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(12.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                'משימות שבוצעו',
                                                textAlign: TextAlign.end,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          font: GoogleFonts
                                                              .plusJakartaSans(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .fontStyle,
                                                          ),
                                                          color:
                                                              Color(0xFF15161E),
                                                          fontSize: MediaQuery.sizeOf(
                                                                          context)
                                                                      .width <
                                                                  kBreakpointSmall
                                                              ? 20.0
                                                              : 30.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLarge
                                                                  .fontStyle,
                                                        ),
                                              ),
                                              ToggleIcon(
                                                onPressed: () async {
                                                  safeSetState(() => _model
                                                          .taskDoneToggle =
                                                      !_model.taskDoneToggle);
                                                },
                                                value: _model.taskDoneToggle,
                                                onIcon: Icon(
                                                  Icons.keyboard_arrow_down,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size:
                                                      MediaQuery.sizeOf(context)
                                                                  .width <
                                                              kBreakpointSmall
                                                          ? 24.0
                                                          : 32.0,
                                                ),
                                                offIcon: Icon(
                                                  Icons.keyboard_arrow_left,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size:
                                                      MediaQuery.sizeOf(context)
                                                                  .width <
                                                              kBreakpointSmall
                                                          ? 24.0
                                                          : 32.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              if (_model.taskDoneToggle)
                                Builder(
                                  builder: (context) {
                                    if (myTasksTasksRecordList
                                        .where((e) =>
                                            ((e.player == currentUserUid) ||
                                                (e.player ==
                                                    valueOrDefault(
                                                        currentUserDocument
                                                            ?.childUID,
                                                        ''))) &&
                                            ((e.status == TaskStatus.pending) ||
                                                (e.status == TaskStatus.done)))
                                        .toList()
                                        .isNotEmpty) {
                                      return Builder(
                                        builder: (context) {
                                          final doneTasksWidget =
                                              myTasksTasksRecordList
                                                  .where((e) =>
                                                      ((e.player ==
                                                              currentUserUid) ||
                                                          (e.player ==
                                                              valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.childUID,
                                                                  ''))) &&
                                                      ((e.status ==
                                                              TaskStatus
                                                                  .pending) ||
                                                          (e.status ==
                                                              TaskStatus.done)))
                                                  .toList()
                                                  .sortedList(
                                                      keyOf: (e) =>
                                                          e.assignedTime!,
                                                      desc: true)
                                                  .toList()
                                                  .take(5)
                                                  .toList();

                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: doneTasksWidget.length,
                                            itemBuilder: (context,
                                                doneTasksWidgetIndex) {
                                              final doneTasksWidgetItem =
                                                  doneTasksWidget[
                                                      doneTasksWidgetIndex];
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        15.0, 0.0, 15.0, 0.0),
                                                child: StreamBuilder<
                                                    List<UsersRecord>>(
                                                  stream: queryUsersRecord(
                                                    queryBuilder:
                                                        (usersRecord) =>
                                                            usersRecord.where(
                                                      'uid',
                                                      isEqualTo:
                                                          doneTasksWidgetItem
                                                              .coach,
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
                                                        containerUsersRecordList =
                                                        snapshot.data!;
                                                    // Return an empty Container when the item does not exist.
                                                    if (snapshot
                                                        .data!.isEmpty) {
                                                      return Container();
                                                    }
                                                    final containerUsersRecord =
                                                        containerUsersRecordList
                                                                .isNotEmpty
                                                            ? containerUsersRecordList
                                                                .first
                                                            : null;

                                                    return Material(
                                                      color: Colors.transparent,
                                                      elevation: 2.0,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  valueOrDefault<
                                                                      double>(
                                                            doneTasksWidgetIndex ==
                                                                    (myTasksTasksRecordList
                                                                            .where((e) =>
                                                                                ((e.player == currentUserUid) || (e.player == valueOrDefault(currentUserDocument?.childUID, ''))) &&
                                                                                ((e.status == TaskStatus.pending) || (e.status == TaskStatus.done)))
                                                                            .toList()
                                                                            .sortedList(keyOf: (e) => e.assignedTime!, desc: false)
                                                                            .length -
                                                                        1)
                                                                ? 15.0
                                                                : 0.0,
                                                            0.0,
                                                          )),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  valueOrDefault<
                                                                      double>(
                                                            doneTasksWidgetIndex ==
                                                                    (myTasksTasksRecordList
                                                                            .where((e) =>
                                                                                ((e.player == currentUserUid) || (e.player == valueOrDefault(currentUserDocument?.childUID, ''))) &&
                                                                                ((e.status == TaskStatus.pending) || (e.status == TaskStatus.done)))
                                                                            .toList()
                                                                            .sortedList(keyOf: (e) => e.assignedTime!, desc: false)
                                                                            .length -
                                                                        1)
                                                                ? 15.0
                                                                : 0.0,
                                                            0.0,
                                                          )),
                                                          topLeft:
                                                              Radius.circular(
                                                                  0.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  0.0),
                                                        ),
                                                      ),
                                                      child: Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              blurRadius: 4.0,
                                                              color: Color(
                                                                  0x33000000),
                                                              offset: Offset(
                                                                0.0,
                                                                2.0,
                                                              ),
                                                            )
                                                          ],
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    valueOrDefault<
                                                                        double>(
                                                              doneTasksWidgetIndex ==
                                                                      (myTasksTasksRecordList
                                                                              .where((e) => ((e.player == currentUserUid) || (e.player == valueOrDefault(currentUserDocument?.childUID, ''))) && ((e.status == TaskStatus.pending) || (e.status == TaskStatus.done)))
                                                                              .toList()
                                                                              .sortedList(keyOf: (e) => e.assignedTime!, desc: false)
                                                                              .length -
                                                                          1)
                                                                  ? 15.0
                                                                  : 0.0,
                                                              0.0,
                                                            )),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    valueOrDefault<
                                                                        double>(
                                                              doneTasksWidgetIndex ==
                                                                      (myTasksTasksRecordList
                                                                              .where((e) => ((e.player == currentUserUid) || (e.player == valueOrDefault(currentUserDocument?.childUID, ''))) && ((e.status == TaskStatus.pending) || (e.status == TaskStatus.done)))
                                                                              .toList()
                                                                              .sortedList(keyOf: (e) => e.assignedTime!, desc: false)
                                                                              .length -
                                                                          1)
                                                                  ? 15.0
                                                                  : 0.0,
                                                              0.0,
                                                            )),
                                                            topLeft:
                                                                Radius.circular(
                                                                    0.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    0.0),
                                                          ),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  8.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    doneTasksWidgetItem
                                                                        .title,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.plusJakartaSans(
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                          ),
                                                                          color:
                                                                              Color(0xFF15161E),
                                                                          fontSize: MediaQuery.sizeOf(context).width < kBreakpointSmall
                                                                              ? 20.0
                                                                              : 30.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                  Builder(
                                                                    builder:
                                                                        (context) {
                                                                      if (doneTasksWidgetItem
                                                                              .status ==
                                                                          TaskStatus
                                                                              .done) {
                                                                        return Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              8.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Icon(
                                                                            Icons.check_circle,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            size: MediaQuery.sizeOf(context).width < kBreakpointSmall
                                                                                ? 24.0
                                                                                : 32.0,
                                                                          ),
                                                                        );
                                                                      } else {
                                                                        return Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              8.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Icon(
                                                                            Icons.pending,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            size: MediaQuery.sizeOf(context).width < kBreakpointSmall
                                                                                ? 24.0
                                                                                : 32.0,
                                                                          ),
                                                                        );
                                                                      }
                                                                    },
                                                                  ),
                                                                ],
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  doneTasksWidgetItem
                                                                      .description,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .outfit(
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: Color(
                                                                            0xFF606A85),
                                                                        fontSize: MediaQuery.sizeOf(context).width <
                                                                                kBreakpointSmall
                                                                            ? 16.0
                                                                            : 26.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ),
                                                              Builder(
                                                                builder:
                                                                    (context) {
                                                                  if (doneTasksWidgetItem
                                                                          .status ==
                                                                      TaskStatus
                                                                          .done) {
                                                                    return Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          8.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Container(
                                                                            width: MediaQuery.sizeOf(context).width < kBreakpointSmall
                                                                                ? 40.0
                                                                                : 55.0,
                                                                            height: MediaQuery.sizeOf(context).width < kBreakpointSmall
                                                                                ? 40.0
                                                                                : 55.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0x4D9489F5),
                                                                              shape: BoxShape.circle,
                                                                              border: Border.all(
                                                                                color: FlutterFlowTheme.of(context).accent1,
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Container(
                                                                              width: MediaQuery.sizeOf(context).width < kBreakpointSmall ? 30.0 : 45.0,
                                                                              height: MediaQuery.sizeOf(context).width < kBreakpointSmall ? 30.0 : 45.0,
                                                                              clipBehavior: Clip.antiAlias,
                                                                              decoration: BoxDecoration(
                                                                                shape: BoxShape.circle,
                                                                              ),
                                                                              child: Image.network(
                                                                                containerUsersRecord!.photoUrl,
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                5.0,
                                                                                0.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.min,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(3.0, 8.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    valueOrDefault<String>(
                                                                                      containerUsersRecord?.displayName,
                                                                                      'אסף נוני',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FontWeight.w600,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          fontSize: MediaQuery.sizeOf(context).width < kBreakpointSmall ? 16.0 : 26.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w600,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                  child: Container(
                                                                                    constraints: BoxConstraints(
                                                                                      maxWidth: 570.0,
                                                                                    ),
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).alternate,
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
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                      border: Border.all(
                                                                                        color: Color(0xFFE5E7EB),
                                                                                        width: 1.0,
                                                                                      ),
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsets.all(4.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                            child: Text(
                                                                                              'תגובת המאמן',
                                                                                              textAlign: TextAlign.start,
                                                                                              style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                    font: GoogleFonts.outfit(
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                                                                                                    ),
                                                                                                    color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                    fontSize: MediaQuery.sizeOf(context).width < kBreakpointSmall ? 18.0 : 28.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w600,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 16.0),
                                                                                            child: Text(
                                                                                              doneTasksWidgetItem.checkFeedback,
                                                                                              textAlign: TextAlign.start,
                                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                    font: GoogleFonts.plusJakartaSans(
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                    ),
                                                                                                    color: FlutterFlowTheme.of(context).secondary,
                                                                                                    fontSize: MediaQuery.sizeOf(context).width < kBreakpointSmall ? 14.0 : 24.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    );
                                                                  } else {
                                                                    return Container(
                                                                      width:
                                                                          0.0,
                                                                      height:
                                                                          0.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                    );
                                                                  }
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      );
                                    } else {
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15.0, 1.0, 15.0, 0.0),
                                        child: Material(
                                          color: Colors.transparent,
                                          elevation: 2.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(15.0),
                                              bottomRight:
                                                  Radius.circular(15.0),
                                              topLeft: Radius.circular(0.0),
                                              topRight: Radius.circular(0.0),
                                            ),
                                          ),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
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
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(15.0),
                                                bottomRight:
                                                    Radius.circular(15.0),
                                                topLeft: Radius.circular(0.0),
                                                topRight: Radius.circular(0.0),
                                              ),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'לא קיימות משימות!',
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          font: GoogleFonts
                                                              .plusJakartaSans(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .fontStyle,
                                                          ),
                                                          color:
                                                              Color(0xFF15161E),
                                                          fontSize: MediaQuery.sizeOf(
                                                                          context)
                                                                      .width <
                                                                  kBreakpointSmall
                                                              ? 20.0
                                                              : 30.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLarge
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 4.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      'לקבלת משימות לביצוע בקש מהמאמן לשלוח משימה באימון הקרוב',
                                                      textAlign:
                                                          TextAlign.start,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .outfit(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: Color(
                                                                    0xFF606A85),
                                                                fontSize: MediaQuery.sizeOf(context)
                                                                            .width <
                                                                        kBreakpointSmall
                                                                    ? 14.0
                                                                    : 24.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
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
                                  },
                                ),
                              if (currentUserDocument?.role != Role.coach)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15.0, 10.0, 15.0, 0.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => Material(
                                      color: Colors.transparent,
                                      elevation: 2.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(
                                              valueOrDefault<double>(
                                            _model.taskNotDoneToggle
                                                ? 0.0
                                                : 15.0,
                                            0.0,
                                          )),
                                          bottomRight: Radius.circular(
                                              valueOrDefault<double>(
                                            _model.taskNotDoneToggle
                                                ? 0.0
                                                : 15.0,
                                            0.0,
                                          )),
                                          topLeft: Radius.circular(15.0),
                                          topRight: Radius.circular(15.0),
                                        ),
                                      ),
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
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
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(
                                                valueOrDefault<double>(
                                              _model.taskNotDoneToggle
                                                  ? 0.0
                                                  : 15.0,
                                              0.0,
                                            )),
                                            bottomRight: Radius.circular(
                                                valueOrDefault<double>(
                                              _model.taskNotDoneToggle
                                                  ? 0.0
                                                  : 15.0,
                                              0.0,
                                            )),
                                            topLeft: Radius.circular(15.0),
                                            topRight: Radius.circular(15.0),
                                          ),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(12.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                'משימות שלא בוצעו',
                                                textAlign: TextAlign.end,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          font: GoogleFonts
                                                              .plusJakartaSans(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .fontStyle,
                                                          ),
                                                          color:
                                                              Color(0xFF15161E),
                                                          fontSize: MediaQuery.sizeOf(
                                                                          context)
                                                                      .width <
                                                                  kBreakpointSmall
                                                              ? 20.0
                                                              : 30.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLarge
                                                                  .fontStyle,
                                                        ),
                                              ),
                                              ToggleIcon(
                                                onPressed: () async {
                                                  safeSetState(() => _model
                                                          .taskNotDoneToggle =
                                                      !_model
                                                          .taskNotDoneToggle);
                                                },
                                                value: _model.taskNotDoneToggle,
                                                onIcon: Icon(
                                                  Icons.keyboard_arrow_down,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size:
                                                      MediaQuery.sizeOf(context)
                                                                  .width <
                                                              kBreakpointSmall
                                                          ? 24.0
                                                          : 32.0,
                                                ),
                                                offIcon: Icon(
                                                  Icons.keyboard_arrow_left,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size:
                                                      MediaQuery.sizeOf(context)
                                                                  .width <
                                                              kBreakpointSmall
                                                          ? 24.0
                                                          : 32.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              if (_model.taskNotDoneToggle)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15.0, 0.0, 15.0, 0.0),
                                  child: Builder(
                                    builder: (context) {
                                      if (myTasksTasksRecordList
                                          .where((e) =>
                                              ((e.player == currentUserUid) ||
                                                  (e.player ==
                                                      valueOrDefault(
                                                          currentUserDocument
                                                              ?.childUID,
                                                          ''))) &&
                                              (e.status ==
                                                  TaskStatus.outOfDate))
                                          .toList()
                                          .isNotEmpty) {
                                        return Builder(
                                          builder: (context) {
                                            final tasksNOTDoneWidget =
                                                myTasksTasksRecordList
                                                    .where((e) =>
                                                        ((e.player ==
                                                                currentUserUid) ||
                                                            (e.player ==
                                                                valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.childUID,
                                                                    ''))) &&
                                                        (e.status ==
                                                            TaskStatus
                                                                .outOfDate))
                                                    .toList()
                                                    .sortedList(
                                                        keyOf: (e) =>
                                                            e.assignedTime!,
                                                        desc: true)
                                                    .toList()
                                                    .take(5)
                                                    .toList();

                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              primary: false,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount:
                                                  tasksNOTDoneWidget.length,
                                              itemBuilder: (context,
                                                  tasksNOTDoneWidgetIndex) {
                                                final tasksNOTDoneWidgetItem =
                                                    tasksNOTDoneWidget[
                                                        tasksNOTDoneWidgetIndex];
                                                return Material(
                                                  color: Colors.transparent,
                                                  elevation: 2.0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(
                                                              valueOrDefault<
                                                                  double>(
                                                        tasksNOTDoneWidgetIndex ==
                                                                (myTasksTasksRecordList
                                                                        .where((e) =>
                                                                            ((e.player == currentUserUid) || (e.player == valueOrDefault(currentUserDocument?.childUID, ''))) &&
                                                                            (e.status ==
                                                                                TaskStatus
                                                                                    .outOfDate))
                                                                        .toList()
                                                                        .sortedList(
                                                                            keyOf: (e) =>
                                                                                e.assignedTime!,
                                                                            desc: false)
                                                                        .length -
                                                                    1)
                                                            ? 15.0
                                                            : 0.0,
                                                        0.0,
                                                      )),
                                                      bottomRight:
                                                          Radius.circular(
                                                              valueOrDefault<
                                                                  double>(
                                                        tasksNOTDoneWidgetIndex ==
                                                                (myTasksTasksRecordList
                                                                        .where((e) =>
                                                                            ((e.player == currentUserUid) || (e.player == valueOrDefault(currentUserDocument?.childUID, ''))) &&
                                                                            (e.status ==
                                                                                TaskStatus
                                                                                    .outOfDate))
                                                                        .toList()
                                                                        .sortedList(
                                                                            keyOf: (e) =>
                                                                                e.assignedTime!,
                                                                            desc: false)
                                                                        .length -
                                                                    1)
                                                            ? 15.0
                                                            : 0.0,
                                                        0.0,
                                                      )),
                                                      topLeft:
                                                          Radius.circular(0.0),
                                                      topRight:
                                                          Radius.circular(0.0),
                                                    ),
                                                  ),
                                                  child: Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 4.0,
                                                          color:
                                                              Color(0x33000000),
                                                          offset: Offset(
                                                            0.0,
                                                            2.0,
                                                          ),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                valueOrDefault<
                                                                    double>(
                                                          tasksNOTDoneWidgetIndex ==
                                                                  (myTasksTasksRecordList
                                                                          .where((e) =>
                                                                              ((e.player == currentUserUid) || (e.player == valueOrDefault(currentUserDocument?.childUID, ''))) &&
                                                                              (e.status == TaskStatus.outOfDate))
                                                                          .toList()
                                                                          .sortedList(keyOf: (e) => e.assignedTime!, desc: false)
                                                                          .length -
                                                                      1)
                                                              ? 15.0
                                                              : 0.0,
                                                          0.0,
                                                        )),
                                                        bottomRight:
                                                            Radius.circular(
                                                                valueOrDefault<
                                                                    double>(
                                                          tasksNOTDoneWidgetIndex ==
                                                                  (myTasksTasksRecordList
                                                                          .where((e) =>
                                                                              ((e.player == currentUserUid) || (e.player == valueOrDefault(currentUserDocument?.childUID, ''))) &&
                                                                              (e.status == TaskStatus.outOfDate))
                                                                          .toList()
                                                                          .sortedList(keyOf: (e) => e.assignedTime!, desc: false)
                                                                          .length -
                                                                      1)
                                                              ? 15.0
                                                              : 0.0,
                                                          0.0,
                                                        )),
                                                        topLeft:
                                                            Radius.circular(
                                                                0.0),
                                                        topRight:
                                                            Radius.circular(
                                                                0.0),
                                                      ),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                tasksNOTDoneWidgetItem
                                                                    .title,
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .plusJakartaSans(
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyLarge
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Color(
                                                                          0xFF15161E),
                                                                      fontSize: MediaQuery.sizeOf(context).width <
                                                                              kBreakpointSmall
                                                                          ? 20.0
                                                                          : 30.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLarge
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: FaIcon(
                                                                  FontAwesomeIcons
                                                                      .solidTimesCircle,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  size: MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointSmall
                                                                      ? 20.0
                                                                      : 28.0,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                tasksNOTDoneWidgetItem
                                                                    .description,
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .outfit(
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Color(
                                                                          0xFF606A85),
                                                                      fontSize: MediaQuery.sizeOf(context).width <
                                                                              kBreakpointSmall
                                                                          ? 16.0
                                                                          : 26.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontStyle,
                                                                    ),
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
                                          },
                                        );
                                      } else {
                                        return Material(
                                          color: Colors.transparent,
                                          elevation: 2.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(15.0),
                                              bottomRight:
                                                  Radius.circular(15.0),
                                              topLeft: Radius.circular(0.0),
                                              topRight: Radius.circular(0.0),
                                            ),
                                          ),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
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
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(15.0),
                                                bottomRight:
                                                    Radius.circular(15.0),
                                                topLeft: Radius.circular(0.0),
                                                topRight: Radius.circular(0.0),
                                              ),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'ביצעת בזמן את כל המשימות שלך!',
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          font: GoogleFonts
                                                              .plusJakartaSans(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .fontStyle,
                                                          ),
                                                          color:
                                                              Color(0xFF15161E),
                                                          fontSize: MediaQuery.sizeOf(
                                                                          context)
                                                                      .width <
                                                                  kBreakpointSmall
                                                              ? 20.0
                                                              : 30.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLarge
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 4.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      'לקבלת משימות חדשות לביצוע בקש מהמאמן לשלוח משימה באימון הקרוב',
                                                      textAlign:
                                                          TextAlign.start,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .outfit(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: Color(
                                                                    0xFF606A85),
                                                                fontSize: MediaQuery.sizeOf(context)
                                                                            .width <
                                                                        kBreakpointSmall
                                                                    ? 14.0
                                                                    : 24.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ),
                              if (currentUserDocument?.role == Role.coach)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15.0, 10.0, 15.0, 0.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => Material(
                                      color: Colors.transparent,
                                      elevation: 2.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(
                                              valueOrDefault<double>(
                                            _model.taskForCheckToggle
                                                ? 0.0
                                                : 15.0,
                                            0.0,
                                          )),
                                          bottomRight: Radius.circular(
                                              valueOrDefault<double>(
                                            _model.taskForCheckToggle
                                                ? 0.0
                                                : 15.0,
                                            0.0,
                                          )),
                                          topLeft: Radius.circular(15.0),
                                          topRight: Radius.circular(15.0),
                                        ),
                                      ),
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
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
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(
                                                valueOrDefault<double>(
                                              _model.taskForCheckToggle
                                                  ? 0.0
                                                  : 15.0,
                                              0.0,
                                            )),
                                            bottomRight: Radius.circular(
                                                valueOrDefault<double>(
                                              _model.taskForCheckToggle
                                                  ? 0.0
                                                  : 15.0,
                                              0.0,
                                            )),
                                            topLeft: Radius.circular(15.0),
                                            topRight: Radius.circular(15.0),
                                          ),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(12.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                'משימות לבדיקה',
                                                textAlign: TextAlign.end,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          font: GoogleFonts
                                                              .plusJakartaSans(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .fontStyle,
                                                          ),
                                                          color:
                                                              Color(0xFF15161E),
                                                          fontSize: MediaQuery.sizeOf(
                                                                          context)
                                                                      .width <
                                                                  kBreakpointSmall
                                                              ? 20.0
                                                              : 30.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLarge
                                                                  .fontStyle,
                                                        ),
                                              ),
                                              ToggleIcon(
                                                onPressed: () async {
                                                  safeSetState(() => _model
                                                          .taskForCheckToggle =
                                                      !_model
                                                          .taskForCheckToggle);
                                                },
                                                value:
                                                    _model.taskForCheckToggle,
                                                onIcon: Icon(
                                                  Icons.keyboard_arrow_down,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size:
                                                      MediaQuery.sizeOf(context)
                                                                  .width <
                                                              kBreakpointSmall
                                                          ? 24.0
                                                          : 32.0,
                                                ),
                                                offIcon: Icon(
                                                  Icons.keyboard_arrow_left,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size:
                                                      MediaQuery.sizeOf(context)
                                                                  .width <
                                                              kBreakpointSmall
                                                          ? 24.0
                                                          : 32.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              if (_model.taskForCheckToggle)
                                Builder(
                                  builder: (context) {
                                    final taskForCheckWidget =
                                        myTasksTasksRecordList
                                            .where((e) =>
                                                (e.coach == currentUserUid) &&
                                                (e.status ==
                                                    TaskStatus.pending))
                                            .toList()
                                            .sortedList(
                                                keyOf: (e) => e.assignedTime!,
                                                desc: true)
                                            .toList()
                                            .take(10)
                                            .toList();

                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: taskForCheckWidget.length,
                                      itemBuilder:
                                          (context, taskForCheckWidgetIndex) {
                                        final taskForCheckWidgetItem =
                                            taskForCheckWidget[
                                                taskForCheckWidgetIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 1.0, 15.0, 0.0),
                                          child: Material(
                                            color: Colors.transparent,
                                            elevation: 2.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(
                                                    valueOrDefault<double>(
                                                  taskForCheckWidgetIndex ==
                                                          (myTasksTasksRecordList
                                                                  .where((e) =>
                                                                      (e.coach ==
                                                                          currentUserUid) &&
                                                                      (e.status ==
                                                                          TaskStatus
                                                                              .pending))
                                                                  .toList()
                                                                  .sortedList(
                                                                      keyOf: (e) => e
                                                                          .assignedTime!,
                                                                      desc:
                                                                          false)
                                                                  .length -
                                                              1)
                                                      ? 15.0
                                                      : 0.0,
                                                  0.0,
                                                )),
                                                bottomRight: Radius.circular(
                                                    valueOrDefault<double>(
                                                  taskForCheckWidgetIndex ==
                                                          (myTasksTasksRecordList
                                                                  .where((e) =>
                                                                      (e.coach ==
                                                                          currentUserUid) &&
                                                                      (e.status ==
                                                                          TaskStatus
                                                                              .pending))
                                                                  .toList()
                                                                  .sortedList(
                                                                      keyOf: (e) => e
                                                                          .assignedTime!,
                                                                      desc:
                                                                          false)
                                                                  .length -
                                                              1)
                                                      ? 15.0
                                                      : 0.0,
                                                  0.0,
                                                )),
                                                topLeft: Radius.circular(0.0),
                                                topRight: Radius.circular(0.0),
                                              ),
                                            ),
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
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
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft: Radius.circular(
                                                      valueOrDefault<double>(
                                                    taskForCheckWidgetIndex ==
                                                            (myTasksTasksRecordList
                                                                    .where((e) =>
                                                                        (e.coach ==
                                                                            currentUserUid) &&
                                                                        (e.status ==
                                                                            TaskStatus
                                                                                .pending))
                                                                    .toList()
                                                                    .sortedList(
                                                                        keyOf: (e) => e
                                                                            .assignedTime!,
                                                                        desc:
                                                                            false)
                                                                    .length -
                                                                1)
                                                        ? 15.0
                                                        : 0.0,
                                                    0.0,
                                                  )),
                                                  bottomRight: Radius.circular(
                                                      valueOrDefault<double>(
                                                    taskForCheckWidgetIndex ==
                                                            (myTasksTasksRecordList
                                                                    .where((e) =>
                                                                        (e.coach ==
                                                                            currentUserUid) &&
                                                                        (e.status ==
                                                                            TaskStatus
                                                                                .pending))
                                                                    .toList()
                                                                    .sortedList(
                                                                        keyOf: (e) => e
                                                                            .assignedTime!,
                                                                        desc:
                                                                            false)
                                                                    .length -
                                                                1)
                                                        ? 15.0
                                                        : 0.0,
                                                    0.0,
                                                  )),
                                                  topLeft: Radius.circular(0.0),
                                                  topRight:
                                                      Radius.circular(0.0),
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 0.0, 5.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Text(
                                                                taskForCheckWidgetItem
                                                                    .title,
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .plusJakartaSans(
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyLarge
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Color(
                                                                          0xFF15161E),
                                                                      fontSize: MediaQuery.sizeOf(context).width <
                                                                              kBreakpointSmall
                                                                          ? 20.0
                                                                          : 30.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLarge
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Icon(
                                                                  Icons
                                                                      .pending_actions,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  size: MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointSmall
                                                                      ? 24.0
                                                                      : 32.0,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          StreamBuilder<
                                                              List<
                                                                  UsersRecord>>(
                                                            stream:
                                                                queryUsersRecord(
                                                              queryBuilder:
                                                                  (usersRecord) =>
                                                                      usersRecord
                                                                          .where(
                                                                'uid',
                                                                isEqualTo:
                                                                    taskForCheckWidgetItem
                                                                        .player,
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
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      valueColor:
                                                                          AlwaysStoppedAnimation<
                                                                              Color>(
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
                                                              if (snapshot.data!
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
                                                                valueOrDefault<
                                                                    String>(
                                                                  textUsersRecord
                                                                      ?.displayName,
                                                                  'רן סעד',
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .end,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .outfit(
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Color(
                                                                          0xFF606A85),
                                                                      fontSize: MediaQuery.sizeOf(context).width <
                                                                              kBreakpointSmall
                                                                          ? 16.0
                                                                          : 26.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontStyle,
                                                                    ),
                                                              );
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Builder(
                                                      builder: (context) =>
                                                          Padding(
                                                        padding: EdgeInsets.all(
                                                            10.0),
                                                        child: FFButtonWidget(
                                                          onPressed: () async {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (dialogContext) {
                                                                return Dialog(
                                                                  elevation: 0,
                                                                  insetPadding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  alignment: AlignmentDirectional(
                                                                          0.0,
                                                                          0.0)
                                                                      .resolve(
                                                                          Directionality.of(
                                                                              context)),
                                                                  child:
                                                                      GestureDetector(
                                                                    onTap: () {
                                                                      FocusScope.of(
                                                                              dialogContext)
                                                                          .unfocus();
                                                                      FocusManager
                                                                          .instance
                                                                          .primaryFocus
                                                                          ?.unfocus();
                                                                    },
                                                                    child:
                                                                        TaskCheckWidget(
                                                                      taskForCheck:
                                                                          taskForCheckWidgetItem,
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                          text: 'לבדיקה',
                                                          options:
                                                              FFButtonOptions(
                                                            height: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width <
                                                                    kBreakpointSmall
                                                                ? 30.0
                                                                : 38.0,
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .accent1,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .interTight(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize: MediaQuery.sizeOf(context).width <
                                                                              kBreakpointSmall
                                                                          ? 16.0
                                                                          : 24.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontStyle,
                                                                    ),
                                                            elevation: 0.0,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                            ],
                          ),
                        ),
                      ],
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

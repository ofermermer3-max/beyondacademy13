import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_session_componet_model.dart';
export 'add_session_componet_model.dart';

class AddSessionComponetWidget extends StatefulWidget {
  const AddSessionComponetWidget({
    super.key,
    this.seesoionDoc,
  });

  final SessionsRecord? seesoionDoc;

  @override
  State<AddSessionComponetWidget> createState() =>
      _AddSessionComponetWidgetState();
}

class _AddSessionComponetWidgetState extends State<AddSessionComponetWidget> {
  late AddSessionComponetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddSessionComponetModel());

    _model.locationTextController ??=
        TextEditingController(text: widget!.seesoionDoc?.location);
    _model.locationFocusNode ??= FocusNode();

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
        padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
        child: Material(
          color: Colors.transparent,
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Container(
            width: MediaQuery.sizeOf(context).width < kBreakpointSmall
                ? double.infinity
                : 800.0,
            height: MediaQuery.sizeOf(context).width < kBreakpointSmall
                ? 520.0
                : 650.0,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 0.0,
                  color: FlutterFlowTheme.of(context).primary,
                  offset: Offset(
                    0.0,
                    0.0,
                  ),
                  spreadRadius: 1.0,
                )
              ],
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
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
                  Text(
                    widget!.seesoionDoc != null ? 'ערוך אימון' : 'הוסף אימון',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          fontSize: MediaQuery.sizeOf(context).width <
                                  kBreakpointSmall
                              ? 30.0
                              : 42.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                  Text(
                    'סוג האימון',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                              : 26.0,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                  AuthUserStreamWidget(
                    builder: (context) => FlutterFlowDropDown<String>(
                      controller: _model.sessionTypeValueController ??=
                          FormFieldController<String>(
                        _model.sessionTypeValue ??= widget!.seesoionDoc?.name,
                      ),
                      options: valueOrDefault<bool>(
                              currentUserDocument?.isAdmin, false)
                          ? ((String academy, String personal, String mental,
                                  String group) {
                              return [academy, personal, mental, group];
                            }('אימון אקדמיה', 'אימון אישי', 'אימון מנטלי',
                              'אימון מנטלי קבוצתי'))
                          : ((String personal, String mental, String group) {
                              return [personal, mental, group];
                            }('אימון אישי', 'אימון מנטלי',
                              'אימון מנטלי קבוצתי')),
                      onChanged: (val) =>
                          safeSetState(() => _model.sessionTypeValue = val),
                      width: MediaQuery.sizeOf(context).width < kBreakpointSmall
                          ? 200.0
                          : 300.0,
                      height:
                          MediaQuery.sizeOf(context).width < kBreakpointSmall
                              ? 40.0
                              : 60.0,
                      textStyle:
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
                                    ? 14.0
                                    : 24.0,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                      hintText: 'בחר...',
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      elevation: 2.0,
                      borderColor: FlutterFlowTheme.of(context).tertiary,
                      borderWidth: 1.0,
                      borderRadius: 8.0,
                      margin:
                          EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                      hidesUnderline: true,
                      isOverButton: false,
                      isSearchable: false,
                      isMultiSelect: false,
                    ),
                  ),
                  Text(
                    'איפה האימון?',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                              : 26.0,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                  TextFormField(
                    controller: _model.locationTextController,
                    focusNode: _model.locationFocusNode,
                    autofocus: false,
                    enabled: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      isDense: false,
                      labelStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                font: GoogleFonts.inter(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                ),
                                fontSize: MediaQuery.sizeOf(context).width <
                                        kBreakpointSmall
                                    ? 14.0
                                    : 24.0,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .fontStyle,
                              ),
                      hintText: 'מיקום האימון...',
                      hintStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                font: GoogleFonts.inter(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                ),
                                fontSize: MediaQuery.sizeOf(context).width <
                                        kBreakpointSmall
                                    ? 14.0
                                    : 24.0,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .fontStyle,
                              ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).tertiary,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).accent1,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      filled: true,
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                              ? 14.0
                              : 24.0,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                    minLines: 1,
                    cursorColor: FlutterFlowTheme.of(context).primaryText,
                    enableInteractiveSelection: true,
                    validator: _model.locationTextControllerValidator
                        .asValidator(context),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'מתי האימון?',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                  : 26.0,
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                      FlutterFlowIconButton(
                        borderRadius: 15.0,
                        buttonSize:
                            MediaQuery.sizeOf(context).width < kBreakpointSmall
                                ? 40.0
                                : 50.0,
                        fillColor: FlutterFlowTheme.of(context).primary,
                        icon: Icon(
                          Icons.access_time,
                          color: FlutterFlowTheme.of(context).info,
                          size: MediaQuery.sizeOf(context).width <
                                  kBreakpointSmall
                              ? 24.0
                              : 34.0,
                        ),
                        onPressed: () async {
                          final _datePickedDate = await showDatePicker(
                            context: context,
                            initialDate: getCurrentTimestamp,
                            firstDate: getCurrentTimestamp,
                            lastDate: DateTime(2050),
                            builder: (context, child) {
                              return wrapInMaterialDatePickerTheme(
                                context,
                                child!,
                                headerBackgroundColor:
                                    FlutterFlowTheme.of(context).primary,
                                headerForegroundColor:
                                    FlutterFlowTheme.of(context).info,
                                headerTextStyle: FlutterFlowTheme.of(context)
                                    .headlineLarge
                                    .override(
                                      font: GoogleFonts.interTight(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .headlineLarge
                                            .fontStyle,
                                      ),
                                      fontSize: 32.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineLarge
                                          .fontStyle,
                                    ),
                                pickerBackgroundColor:
                                    FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                pickerForegroundColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                selectedDateTimeBackgroundColor:
                                    FlutterFlowTheme.of(context).primary,
                                selectedDateTimeForegroundColor:
                                    FlutterFlowTheme.of(context).info,
                                actionButtonForegroundColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                iconSize: 24.0,
                              );
                            },
                          );

                          TimeOfDay? _datePickedTime;
                          if (_datePickedDate != null) {
                            _datePickedTime = await showTimePicker(
                              context: context,
                              initialTime:
                                  TimeOfDay.fromDateTime(getCurrentTimestamp),
                              builder: (context, child) {
                                return wrapInMaterialTimePickerTheme(
                                  context,
                                  child!,
                                  headerBackgroundColor:
                                      FlutterFlowTheme.of(context).primary,
                                  headerForegroundColor:
                                      FlutterFlowTheme.of(context).info,
                                  headerTextStyle: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .override(
                                        font: GoogleFonts.interTight(
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineLarge
                                                  .fontStyle,
                                        ),
                                        fontSize: 32.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .headlineLarge
                                            .fontStyle,
                                      ),
                                  pickerBackgroundColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                  pickerForegroundColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  selectedDateTimeBackgroundColor:
                                      FlutterFlowTheme.of(context).primary,
                                  selectedDateTimeForegroundColor:
                                      FlutterFlowTheme.of(context).info,
                                  actionButtonForegroundColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  iconSize: 24.0,
                                );
                              },
                            );
                          }

                          if (_datePickedDate != null &&
                              _datePickedTime != null) {
                            safeSetState(() {
                              _model.datePicked = DateTime(
                                _datePickedDate.year,
                                _datePickedDate.month,
                                _datePickedDate.day,
                                _datePickedTime!.hour,
                                _datePickedTime.minute,
                              );
                            });
                          } else if (_model.datePicked != null) {
                            safeSetState(() {
                              _model.datePicked = getCurrentTimestamp;
                            });
                          }
                        },
                      ),
                    ].divide(SizedBox(height: 8.0)),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Builder(
                        builder: (context) {
                          if ((_model.sessionTypeValue == 'אימון אקדמיה') ||
                              (_model.sessionTypeValue ==
                                  'אימון מנטלי קבוצתי')) {
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'קבוצת אקדמיה',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        fontSize:
                                            MediaQuery.sizeOf(context).width <
                                                    kBreakpointSmall
                                                ? 16.0
                                                : 26.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                                StreamBuilder<List<AcademyGroupRecord>>(
                                  stream: queryAcademyGroupRecord(),
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
                                    List<AcademyGroupRecord>
                                        agroupSelectionAcademyGroupRecordList =
                                        snapshot.data!;

                                    return FlutterFlowDropDown<String>(
                                      controller: _model
                                              .agroupSelectionValueController ??=
                                          FormFieldController<String>(
                                        _model.agroupSelectionValue ??=
                                            widget!.seesoionDoc?.academyGroup,
                                      ),
                                      options:
                                          agroupSelectionAcademyGroupRecordList
                                              .map((e) => e.groupNumber)
                                              .toList(),
                                      onChanged: (val) => safeSetState(() =>
                                          _model.agroupSelectionValue = val),
                                      width: 120.0,
                                      height: MediaQuery.sizeOf(context).width <
                                              kBreakpointSmall
                                          ? 40.0
                                          : 50.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            fontSize: MediaQuery.sizeOf(context)
                                                        .width <
                                                    kBreakpointSmall
                                                ? 14.0
                                                : 24.0,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                      hintText: 'בחר...',
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      elevation: 2.0,
                                      borderColor: Colors.transparent,
                                      borderWidth: 0.0,
                                      borderRadius: 8.0,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 0.0),
                                      hidesUnderline: true,
                                      isOverButton: false,
                                      isSearchable: false,
                                      isMultiSelect: false,
                                    );
                                  },
                                ),
                              ].divide(SizedBox(height: 8.0)),
                            );
                          } else {
                            return Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 10.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'שחקנים',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              fontSize:
                                                  MediaQuery.sizeOf(context)
                                                              .width <
                                                          kBreakpointSmall
                                                      ? 16.0
                                                      : 26.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                      StreamBuilder<List<UsersRecord>>(
                                        stream: queryUsersRecord(
                                          queryBuilder: (usersRecord) =>
                                              usersRecord.where(
                                            'role',
                                            isEqualTo: Role.player.serialize(),
                                          ),
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
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<UsersRecord>
                                              playerSelectionUsersRecordList =
                                              snapshot.data!;

                                          return FlutterFlowDropDown<String>(
                                            multiSelectController: _model
                                                    .playerSelectionValueController ??=
                                                FormListFieldController<
                                                    String>(_model
                                                        .playerSelectionValue ??=
                                                    List<String>.from(
                                              widget!.seesoionDoc?.players ??
                                                  [],
                                            )),
                                            options:
                                                playerSelectionUsersRecordList
                                                    .map((e) => e.displayName)
                                                    .toList(),
                                            width: MediaQuery.sizeOf(context)
                                                        .width <
                                                    kBreakpointSmall
                                                ? 120.0
                                                : 160.0,
                                            height: MediaQuery.sizeOf(context)
                                                        .width <
                                                    kBreakpointSmall
                                                ? 40.0
                                                : 60.0,
                                            searchHintTextStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                                      fontSize: MediaQuery.sizeOf(
                                                                      context)
                                                                  .width <
                                                              kBreakpointSmall
                                                          ? 14.0
                                                          : 24.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .fontStyle,
                                                    ),
                                            searchTextStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  fontSize:
                                                      MediaQuery.sizeOf(context)
                                                                  .width <
                                                              kBreakpointSmall
                                                          ? 14.0
                                                          : 24.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                            hintText: 'בחר..',
                                            searchHintText: 'חפש..',
                                            icon: Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            elevation: 2.0,
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .tertiary,
                                            borderWidth: 1.0,
                                            borderRadius: 8.0,
                                            margin:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            hidesUnderline: true,
                                            isOverButton: false,
                                            isSearchable: true,
                                            isMultiSelect: true,
                                            onMultiSelectChanged: (val) =>
                                                safeSetState(() => _model
                                                        .playerSelectionValue =
                                                    val),
                                          );
                                        },
                                      ),
                                    ].divide(SizedBox(height: 8.0)),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'מאמן',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              fontSize:
                                                  MediaQuery.sizeOf(context)
                                                              .width <
                                                          kBreakpointSmall
                                                      ? 16.0
                                                      : 26.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                      StreamBuilder<List<UsersRecord>>(
                                        stream: queryUsersRecord(),
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
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<UsersRecord>
                                              coachSelectionUsersRecordList =
                                              snapshot.data!;

                                          return FlutterFlowDropDown<String>(
                                            controller: _model
                                                    .coachSelectionValueController ??=
                                                FormFieldController<String>(
                                              _model.coachSelectionValue ??=
                                                  widget!.seesoionDoc?.coach,
                                            ),
                                            options:
                                                coachSelectionUsersRecordList
                                                    .where((e) =>
                                                        e.role == Role.coach)
                                                    .toList()
                                                    .map((e) => e.displayName)
                                                    .toList(),
                                            onChanged: (val) => safeSetState(
                                                () => _model
                                                    .coachSelectionValue = val),
                                            width: MediaQuery.sizeOf(context)
                                                        .width <
                                                    kBreakpointSmall
                                                ? 120.0
                                                : 160.0,
                                            height: MediaQuery.sizeOf(context)
                                                        .width <
                                                    kBreakpointSmall
                                                ? 40.0
                                                : 60.0,
                                            searchHintTextStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                                      fontSize: MediaQuery.sizeOf(
                                                                      context)
                                                                  .width <
                                                              kBreakpointSmall
                                                          ? 14.0
                                                          : 24.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .fontStyle,
                                                    ),
                                            searchTextStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  fontSize:
                                                      MediaQuery.sizeOf(context)
                                                                  .width <
                                                              kBreakpointSmall
                                                          ? 14.0
                                                          : 24.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                            hintText: 'בחר..',
                                            searchHintText: 'חפש..',
                                            icon: Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            elevation: 2.0,
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .tertiary,
                                            borderWidth: 1.0,
                                            borderRadius: 8.0,
                                            margin:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            hidesUnderline: true,
                                            isOverButton: false,
                                            isSearchable: true,
                                            isMultiSelect: false,
                                          );
                                        },
                                      ),
                                    ].divide(SizedBox(height: 8.0)),
                                  ),
                                ),
                              ],
                            );
                          }
                        },
                      ),
                    ],
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: StreamBuilder<List<AcademyGroupRecord>>(
                      stream: queryAcademyGroupRecord(),
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
                        List<AcademyGroupRecord>
                            containerAcademyGroupRecordList = snapshot.data!;

                        return Container(
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: StreamBuilder<List<UsersRecord>>(
                              stream: queryUsersRecord(),
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
                                    if ((_model
                                                    .sessionTypeValue ==
                                                'אימון אקדמיה') ||
                                            (_model
                                                    .sessionTypeValue ==
                                                'אימון מנטלי קבוצתי')
                                        ? ((_model.locationTextController
                                                        .text !=
                                                    null &&
                                                _model.locationTextController
                                                        .text !=
                                                    '') &&
                                            (_model.datePicked != null) &&
                                            (_model
                                                        .agroupSelectionValue !=
                                                    null &&
                                                _model
                                                        .agroupSelectionValue !=
                                                    ''))
                                        : ((_model.locationTextController
                                                        .text !=
                                                    null &&
                                                _model.locationTextController
                                                        .text !=
                                                    '') &&
                                            (_model.datePicked != null) &&
                                            (_model.coachSelectionValue !=
                                                    null &&
                                                _model.coachSelectionValue !=
                                                    '') &&
                                            (_model.playerSelectionValue !=
                                                    null &&
                                                (_model.playerSelectionValue)!
                                                    .isNotEmpty))) {
                                      if (widget!.seesoionDoc != null) {
                                        await widget!.seesoionDoc!.reference
                                            .update({
                                          ...createSessionsRecordData(
                                            coach: (_model.sessionTypeValue ==
                                                        'אימון אקדמיה') ||
                                                    (_model.sessionTypeValue ==
                                                        'אימון מנטלי קבוצתי')
                                                ? currentUserUid
                                                : buttonUsersRecordList
                                                    .where((e) =>
                                                        e.displayName ==
                                                        _model
                                                            .coachSelectionValue)
                                                    .toList()
                                                    .firstOrNull
                                                    ?.uid,
                                            location: _model
                                                .locationTextController.text,
                                            time: _model.datePicked,
                                            isAcademy:
                                                (_model.sessionTypeValue ==
                                                        'אימון אקדמיה') ||
                                                    (_model.sessionTypeValue ==
                                                        'אימון מנטלי קבוצתי'),
                                            type: () {
                                              if (_model.sessionTypeValue ==
                                                  'אימון אקדמיה') {
                                                return SessionType.accademy;
                                              } else if (_model
                                                      .sessionTypeValue ==
                                                  'אימון אישי') {
                                                return SessionType.personal;
                                              } else if (_model
                                                      .sessionTypeValue ==
                                                  'אימון מנטלי קבוצתי') {
                                                return SessionType.mentalGroup;
                                              } else {
                                                return SessionType.mental;
                                              }
                                            }(),
                                            name: _model.sessionTypeValue,
                                            endTime:
                                                functions.addMinutesToDate(() {
                                              if (_model.sessionTypeValue ==
                                                  'אימון אקדמיה') {
                                                return FFAppConstants
                                                    .accademySessionLength;
                                              } else if (_model
                                                      .sessionTypeValue ==
                                                  'אימון אישי') {
                                                return FFAppConstants
                                                    .personalSessionLength
                                                    .firstOrNull!;
                                              } else {
                                                return FFAppConstants
                                                    .mentalSessionLength;
                                              }
                                            }(), _model.datePicked!),
                                            academyGroup:
                                                _model.agroupSelectionValue,
                                          ),
                                          ...mapToFirestore(
                                            {
                                              'players': (_model
                                                              .sessionTypeValue ==
                                                          'אימון אקדמיה') ||
                                                      (_model.sessionTypeValue ==
                                                          'אימון מנטלי קבוצתי')
                                                  ? containerAcademyGroupRecordList
                                                      .where((e) =>
                                                          e.groupNumber ==
                                                          _model
                                                              .agroupSelectionValue)
                                                      .toList()
                                                      .firstOrNull
                                                      ?.members
                                                  : buttonUsersRecordList
                                                      .where((e) => _model
                                                          .playerSelectionValue!
                                                          .contains(
                                                              e.displayName))
                                                      .toList()
                                                      .map((e) => e.uid)
                                                      .toList(),
                                              'arriving': FieldValue.delete(),
                                            },
                                          ),
                                        });
                                      } else {
                                        var sessionsRecordReference =
                                            SessionsRecord.collection.doc();
                                        await sessionsRecordReference.set({
                                          ...createSessionsRecordData(
                                            coach: (_model.sessionTypeValue ==
                                                        'אימון אקדמיה') ||
                                                    (_model.sessionTypeValue ==
                                                        'אימון מנטלי קבוצתי')
                                                ? currentUserUid
                                                : buttonUsersRecordList
                                                    .where((e) =>
                                                        e.displayName ==
                                                        _model
                                                            .coachSelectionValue)
                                                    .toList()
                                                    .firstOrNull
                                                    ?.uid,
                                            location: _model
                                                .locationTextController.text,
                                            time: _model.datePicked,
                                            status: SessionStatus.upcoming,
                                            isAcademy:
                                                (_model.sessionTypeValue ==
                                                        'אימון אקדמיה') ||
                                                    (_model.sessionTypeValue ==
                                                        'אימון מנטלי קבוצתי'),
                                            flag: false,
                                            sessionID: random_data
                                                .randomInteger(10000, 99999),
                                            type: () {
                                              if (_model.sessionTypeValue ==
                                                  'אימון אקדמיה') {
                                                return SessionType.accademy;
                                              } else if (_model
                                                      .sessionTypeValue ==
                                                  'אימון אישי') {
                                                return SessionType.personal;
                                              } else if (_model
                                                      .sessionTypeValue ==
                                                  'אימון מנטלי קבוצתי') {
                                                return SessionType.mentalGroup;
                                              } else {
                                                return SessionType.mental;
                                              }
                                            }(),
                                            name: _model.sessionTypeValue,
                                            endTime:
                                                functions.addMinutesToDate(() {
                                              if (_model.sessionTypeValue ==
                                                  'אימון אקדמיה') {
                                                return FFAppConstants
                                                    .accademySessionLength;
                                              } else if (_model
                                                      .sessionTypeValue ==
                                                  'אימון אישי') {
                                                return FFAppConstants
                                                    .personalSessionLength
                                                    .firstOrNull!;
                                              } else {
                                                return FFAppConstants
                                                    .mentalSessionLength;
                                              }
                                            }(), _model.datePicked!),
                                            academyGroup:
                                                _model.agroupSelectionValue,
                                          ),
                                          ...mapToFirestore(
                                            {
                                              'players': (_model
                                                              .sessionTypeValue ==
                                                          'אימון אקדמיה') ||
                                                      (_model.sessionTypeValue ==
                                                          'אימון מנטלי קבוצתי')
                                                  ? containerAcademyGroupRecordList
                                                      .where((e) =>
                                                          e.groupNumber ==
                                                          _model
                                                              .agroupSelectionValue)
                                                      .toList()
                                                      .firstOrNull
                                                      ?.members
                                                  : buttonUsersRecordList
                                                      .where((e) => _model
                                                          .playerSelectionValue!
                                                          .contains(
                                                              e.displayName))
                                                      .toList()
                                                      .map((e) => e.uid)
                                                      .toList(),
                                            },
                                          ),
                                        });
                                        _model.newSession =
                                            SessionsRecord.getDocumentFromData({
                                          ...createSessionsRecordData(
                                            coach: (_model.sessionTypeValue ==
                                                        'אימון אקדמיה') ||
                                                    (_model.sessionTypeValue ==
                                                        'אימון מנטלי קבוצתי')
                                                ? currentUserUid
                                                : buttonUsersRecordList
                                                    .where((e) =>
                                                        e.displayName ==
                                                        _model
                                                            .coachSelectionValue)
                                                    .toList()
                                                    .firstOrNull
                                                    ?.uid,
                                            location: _model
                                                .locationTextController.text,
                                            time: _model.datePicked,
                                            status: SessionStatus.upcoming,
                                            isAcademy:
                                                (_model.sessionTypeValue ==
                                                        'אימון אקדמיה') ||
                                                    (_model.sessionTypeValue ==
                                                        'אימון מנטלי קבוצתי'),
                                            flag: false,
                                            sessionID: random_data
                                                .randomInteger(10000, 99999),
                                            type: () {
                                              if (_model.sessionTypeValue ==
                                                  'אימון אקדמיה') {
                                                return SessionType.accademy;
                                              } else if (_model
                                                      .sessionTypeValue ==
                                                  'אימון אישי') {
                                                return SessionType.personal;
                                              } else if (_model
                                                      .sessionTypeValue ==
                                                  'אימון מנטלי קבוצתי') {
                                                return SessionType.mentalGroup;
                                              } else {
                                                return SessionType.mental;
                                              }
                                            }(),
                                            name: _model.sessionTypeValue,
                                            endTime:
                                                functions.addMinutesToDate(() {
                                              if (_model.sessionTypeValue ==
                                                  'אימון אקדמיה') {
                                                return FFAppConstants
                                                    .accademySessionLength;
                                              } else if (_model
                                                      .sessionTypeValue ==
                                                  'אימון אישי') {
                                                return FFAppConstants
                                                    .personalSessionLength
                                                    .firstOrNull!;
                                              } else {
                                                return FFAppConstants
                                                    .mentalSessionLength;
                                              }
                                            }(), _model.datePicked!),
                                            academyGroup:
                                                _model.agroupSelectionValue,
                                          ),
                                          ...mapToFirestore(
                                            {
                                              'players': (_model
                                                              .sessionTypeValue ==
                                                          'אימון אקדמיה') ||
                                                      (_model.sessionTypeValue ==
                                                          'אימון מנטלי קבוצתי')
                                                  ? containerAcademyGroupRecordList
                                                      .where((e) =>
                                                          e.groupNumber ==
                                                          _model
                                                              .agroupSelectionValue)
                                                      .toList()
                                                      .firstOrNull
                                                      ?.members
                                                  : buttonUsersRecordList
                                                      .where((e) => _model
                                                          .playerSelectionValue!
                                                          .contains(
                                                              e.displayName))
                                                      .toList()
                                                      .map((e) => e.uid)
                                                      .toList(),
                                            },
                                          ),
                                        }, sessionsRecordReference);
                                        for (int loop1Index = 0;
                                            loop1Index <
                                                buttonUsersRecordList
                                                    .where((e) => _model
                                                        .newSession!.players
                                                        .contains(e.uid))
                                                    .toList()
                                                    .length;
                                            loop1Index++) {
                                          final currentLoop1Item =
                                              buttonUsersRecordList
                                                  .where((e) => _model
                                                      .newSession!.players
                                                      .contains(e.uid))
                                                  .toList()[loop1Index];
                                          // adds to players

                                          await currentLoop1Item.reference
                                              .update({
                                            ...mapToFirestore(
                                              {
                                                'notifications':
                                                    FieldValue.arrayUnion([
                                                  getNotificationFirestoreData(
                                                    updateNotificationStruct(
                                                      NotificationStruct(
                                                        type: NotificationType
                                                            .newSession,
                                                        sessionRef: _model
                                                            .newSession
                                                            ?.reference,
                                                        time:
                                                            getCurrentTimestamp,
                                                      ),
                                                      clearUnsetFields: false,
                                                    ),
                                                    true,
                                                  )
                                                ]),
                                              },
                                            ),
                                          });
                                          // adds to parents

                                          await currentLoop1Item.parent!
                                              .update({
                                            ...mapToFirestore(
                                              {
                                                'notifications':
                                                    FieldValue.arrayUnion([
                                                  getNotificationFirestoreData(
                                                    updateNotificationStruct(
                                                      NotificationStruct(
                                                        type: NotificationType
                                                            .newSession,
                                                        sessionRef: _model
                                                            .newSession
                                                            ?.reference,
                                                        time:
                                                            getCurrentTimestamp,
                                                      ),
                                                      clearUnsetFields: false,
                                                    ),
                                                    true,
                                                  )
                                                ]),
                                              },
                                            ),
                                          });
                                        }
                                        await PushNotificationCall.call(
                                          title: 'נקבע אימון חדש!',
                                          body:
                                              '${_model.newSession?.name} חדש נקבע על ידי ${_model.newSession!.isAcademy ? 'צוות האקדמיה' : buttonUsersRecordList.where((e) => e.uid == _model.newSession?.coach).toList().firstOrNull?.displayName}',
                                          userIdsList: buttonUsersRecordList
                                              .where((e) => _model
                                                  .newSession!.players
                                                  .contains(
                                                      e.role == Role.player
                                                          ? e.uid
                                                          : e.childUID))
                                              .toList()
                                              .map((e) => e.reference.id)
                                              .toList(),
                                        );
                                      }

                                      Navigator.pop(context);
                                    } else {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('שגיאה!'),
                                            content: Text(
                                                'אחד מהשדות הדרושים אינו מלא'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('אישור'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }

                                    safeSetState(() {});
                                  },
                                  text: 'שמור שינויים',
                                  options: FFButtonOptions(
                                    height: MediaQuery.sizeOf(context).width <
                                            kBreakpointSmall
                                        ? 35.0
                                        : 45.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          font: GoogleFonts.interTight(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                          color: Colors.white,
                                          fontSize:
                                              MediaQuery.sizeOf(context).width <
                                                      kBreakpointSmall
                                                  ? 18.0
                                                  : 28.0,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
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
                        );
                      },
                    ),
                  ),
                ].divide(SizedBox(height: 12.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

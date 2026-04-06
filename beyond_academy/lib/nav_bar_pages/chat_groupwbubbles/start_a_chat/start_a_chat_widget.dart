import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/nav_bar_pages/chat_groupwbubbles/empty_state_simple/empty_state_simple_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'start_a_chat_model.dart';
export 'start_a_chat_model.dart';

class StartAChatWidget extends StatefulWidget {
  const StartAChatWidget({super.key});

  static String routeName = 'startAChat';
  static String routePath = '/startAChat';

  @override
  State<StartAChatWidget> createState() => _StartAChatWidgetState();
}

class _StartAChatWidgetState extends State<StartAChatWidget>
    with TickerProviderStateMixin {
  late StartAChatModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StartAChatModel());

    _model.searchUsersTextController ??= TextEditingController();
    _model.searchUsersFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'צור צ\'אט חדש',
                textAlign: TextAlign.end,
                style: FlutterFlowTheme.of(context).headlineSmall.override(
                      font: GoogleFonts.outfit(
                        fontWeight: FontWeight.w600,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineSmall
                            .fontStyle,
                      ),
                      color: Color(0xFF14181B),
                      fontSize:
                          MediaQuery.sizeOf(context).width < kBreakpointSmall
                              ? 30.0
                              : 40.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                    ),
              ),
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.cancel_outlined,
                  color: Color(0xFF14181B),
                  size: MediaQuery.sizeOf(context).width < kBreakpointSmall
                      ? 30.0
                      : 40.0,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
            ],
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (currentUserDocument?.role == Role.coach)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 30.0, 0.0),
                    child: AuthUserStreamWidget(
                      builder: (context) => InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed(
                            Chat2InviteUsersWidget.routeName,
                            extra: <String, dynamic>{
                              '__transition_info__': TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.bottomToTop,
                                duration: Duration(milliseconds: 200),
                              ),
                            },
                          );
                        },
                        child: Material(
                          color: Colors.transparent,
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width <
                                    kBreakpointSmall
                                ? 160.0
                                : 250.0,
                            height: MediaQuery.sizeOf(context).width <
                                    kBreakpointSmall
                                ? 50.0
                                : 60.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primary,
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
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 0.0, 5.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 5.0, 0.0),
                                    child: Text(
                                      'צור צ\'אט קבוצתי ',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            fontSize: MediaQuery.sizeOf(context)
                                                        .width <
                                                    kBreakpointSmall
                                                ? 16.0
                                                : 24.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.add,
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    size: MediaQuery.sizeOf(context).width <
                                            kBreakpointSmall
                                        ? 24.0
                                        : 32.0,
                                  ),
                                ].divide(SizedBox(width: 5.0)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(30.0, 20.0, 0.0, 0.0),
                      child: Container(
                        width:
                            MediaQuery.sizeOf(context).width < kBreakpointSmall
                                ? 200.0
                                : 400.0,
                        child: TextFormField(
                          controller: _model.searchUsersTextController,
                          focusNode: _model.searchUsersFocusNode,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.searchUsersTextController',
                            Duration(milliseconds: 0),
                            () => safeSetState(() {}),
                          ),
                          autofocus: false,
                          enabled: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                ),
                            hintText: 'חפש..',
                            hintStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
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
                                      : 22.0,
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
                                color: Color(0x00000000),
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
                            fillColor: Color(0xFFF1F4F8),
                            suffixIcon: _model
                                    .searchUsersTextController!.text.isNotEmpty
                                ? InkWell(
                                    onTap: () async {
                                      _model.searchUsersTextController?.clear();
                                      safeSetState(() {});
                                    },
                                    child: Icon(
                                      Icons.clear,
                                      size: 22,
                                    ),
                                  )
                                : null,
                          ),
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
                                        ? 14.0
                                        : 22.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                          cursorColor: FlutterFlowTheme.of(context).primaryText,
                          enableInteractiveSelection: true,
                          validator: _model.searchUsersTextControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                  ].divide(SizedBox(width: 5.0)),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
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
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        List<UsersRecord> listViewUsersRecordList =
                            snapshot.data!;
                        if (listViewUsersRecordList.isEmpty) {
                          return Container(
                            width: 90.0,
                            child: EmptyStateSimpleWidget(
                              icon: Icon(
                                Icons.people_alt_outlined,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 90.0,
                              ),
                              title: 'אין אישורי הגעה',
                              body:
                                  'אף שחקן עדיין לא אישר הגעה לאימון. מומלץ לפנות לשחנקים בצ\'אט',
                            ),
                          );
                        }

                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewUsersRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewUsersRecord =
                                listViewUsersRecordList[listViewIndex];
                            return Visibility(
                              visible: (((currentUserDocument?.role ==
                                              Role.coach) &&
                                          (listViewUsersRecord.role !=
                                              Role.coach)) ||
                                      ((currentUserDocument?.role !=
                                              Role.coach) &&
                                          (listViewUsersRecord.role ==
                                              Role.coach))) &&
                                  (listViewUsersRecord.displayName.contains(
                                      _model.searchUsersTextController.text)),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 1.0),
                                child: AuthUserStreamWidget(
                                  builder: (context) => Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 2.0,
                                          color: Color(0xFFE0E3E7),
                                          offset: Offset(
                                            0.0,
                                            1.0,
                                          ),
                                        )
                                      ],
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            width: MediaQuery.sizeOf(context)
                                                        .width <
                                                    kBreakpointSmall
                                                ? 50.0
                                                : 80.0,
                                            height: MediaQuery.sizeOf(context)
                                                        .width <
                                                    kBreakpointSmall
                                                ? 50.0
                                                : 80.0,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent1,
                                              ),
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(40.0),
                                              child: Image.network(
                                                listViewUsersRecord.photoUrl,
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                                .width <
                                                            kBreakpointSmall
                                                        ? 60.0
                                                        : 80.0,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                                .width <
                                                            kBreakpointSmall
                                                        ? 60.0
                                                        : 80.0,
                                                fit: BoxFit.cover,
                                                errorBuilder: (context, error,
                                                        stackTrace) =>
                                                    Image.asset(
                                                  'assets/images/error_image.png',
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                                  .width <
                                                              kBreakpointSmall
                                                          ? 60.0
                                                          : 80.0,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                                  .width <
                                                              kBreakpointSmall
                                                          ? 60.0
                                                          : 80.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 5.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      listViewUsersRecord
                                                          .displayName,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLarge
                                                              .override(
                                                                font: GoogleFonts
                                                                    .plusJakartaSans(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .fontStyle,
                                                                ),
                                                                color: Color(
                                                                    0xFF14181B),
                                                                fontSize: MediaQuery.sizeOf(context)
                                                                            .width <
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
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      () {
                                                        if (listViewUsersRecord
                                                                .role ==
                                                            Role.player) {
                                                          return 'שחקן';
                                                        } else if (listViewUsersRecord
                                                                .role ==
                                                            Role.coach) {
                                                          return 'מאמן';
                                                        } else {
                                                          return 'הורה';
                                                        }
                                                      }(),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .plusJakartaSans(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: Color(
                                                                    0xFF4B39EF),
                                                                fontSize: MediaQuery.sizeOf(context)
                                                                            .width <
                                                                        kBreakpointSmall
                                                                    ? 16.0
                                                                    : 26.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          StreamBuilder<List<ChatsRecord>>(
                                            stream: queryChatsRecord(),
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
                                              List<ChatsRecord>
                                                  cardChatsRecordList =
                                                  snapshot.data!;

                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  if (cardChatsRecordList
                                                      .where((e) =>
                                                          e.users.contains(
                                                              listViewUsersRecord
                                                                  .reference) &&
                                                          e.users.contains(
                                                              currentUserReference) &&
                                                          (e.users.length == 2))
                                                      .toList()
                                                      .isNotEmpty) {
                                                    context.pushNamed(
                                                      Chat2DetailsWidget
                                                          .routeName,
                                                      queryParameters: {
                                                        'chatRef':
                                                            serializeParam(
                                                          cardChatsRecordList
                                                              .where((e) =>
                                                                  e.users.contains(
                                                                      listViewUsersRecord
                                                                          .reference) &&
                                                                  e.users.contains(
                                                                      currentUserReference) &&
                                                                  (e.users.length ==
                                                                      2))
                                                              .toList()
                                                              .firstOrNull,
                                                          ParamType.Document,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        'chatRef': cardChatsRecordList
                                                            .where((e) =>
                                                                e.users.contains(
                                                                    listViewUsersRecord
                                                                        .reference) &&
                                                                e.users.contains(
                                                                    currentUserReference) &&
                                                                (e.users.length ==
                                                                    2))
                                                            .toList()
                                                            .firstOrNull,
                                                      },
                                                    );
                                                  } else {
                                                    _model.addToUsersList(
                                                        listViewUsersRecord
                                                            .reference);
                                                    safeSetState(() {});
                                                    _model.addToUsersList(
                                                        currentUserReference!);
                                                    safeSetState(() {});

                                                    var chatsRecordReference =
                                                        ChatsRecord.collection
                                                            .doc();
                                                    await chatsRecordReference
                                                        .set({
                                                      ...createChatsRecordData(
                                                        userA:
                                                            currentUserReference,
                                                        userB:
                                                            listViewUsersRecord
                                                                .reference,
                                                        lastMessageTime:
                                                            getCurrentTimestamp,
                                                        lastMessageSentBy:
                                                            currentUserReference,
                                                        groupChatId: random_data
                                                            .randomInteger(
                                                                1000000,
                                                                9999999),
                                                      ),
                                                      ...mapToFirestore(
                                                        {
                                                          'users':
                                                              _model.usersList,
                                                        },
                                                      ),
                                                    });
                                                    _model.newPersonalChat =
                                                        ChatsRecord
                                                            .getDocumentFromData({
                                                      ...createChatsRecordData(
                                                        userA:
                                                            currentUserReference,
                                                        userB:
                                                            listViewUsersRecord
                                                                .reference,
                                                        lastMessageTime:
                                                            getCurrentTimestamp,
                                                        lastMessageSentBy:
                                                            currentUserReference,
                                                        groupChatId: random_data
                                                            .randomInteger(
                                                                1000000,
                                                                9999999),
                                                      ),
                                                      ...mapToFirestore(
                                                        {
                                                          'users':
                                                              _model.usersList,
                                                        },
                                                      ),
                                                    }, chatsRecordReference);

                                                    context.pushNamed(
                                                      Chat2DetailsWidget
                                                          .routeName,
                                                      queryParameters: {
                                                        'chatRef':
                                                            serializeParam(
                                                          _model
                                                              .newPersonalChat,
                                                          ParamType.Document,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        'chatRef': _model
                                                            .newPersonalChat,
                                                        '__transition_info__':
                                                            TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .rightToLeft,
                                                          duration: Duration(
                                                              milliseconds:
                                                                  350),
                                                        ),
                                                      },
                                                    );
                                                  }

                                                  safeSetState(() {});
                                                },
                                                child: Card(
                                                  clipBehavior: Clip
                                                      .antiAliasWithSaveLayer,
                                                  color: Color(0xFFF1F4F8),
                                                  elevation: 1.0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(4.0),
                                                    child: Icon(
                                                      Icons
                                                          .keyboard_arrow_left_outlined,
                                                      color: Color(0xFF57636C),
                                                      size: MediaQuery.sizeOf(
                                                                      context)
                                                                  .width <
                                                              kBreakpointSmall
                                                          ? 24.0
                                                          : 32.0,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

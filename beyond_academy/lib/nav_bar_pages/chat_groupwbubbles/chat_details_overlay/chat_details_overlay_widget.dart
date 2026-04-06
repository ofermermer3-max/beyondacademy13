import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/nav_bar_pages/chat_groupwbubbles/delete_dialog/delete_dialog_widget.dart';
import '/nav_bar_pages/chat_groupwbubbles/user_list_small/user_list_small_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chat_details_overlay_model.dart';
export 'chat_details_overlay_model.dart';

class ChatDetailsOverlayWidget extends StatefulWidget {
  const ChatDetailsOverlayWidget({
    super.key,
    required this.chatRef,
  });

  final ChatsRecord? chatRef;

  @override
  State<ChatDetailsOverlayWidget> createState() =>
      _ChatDetailsOverlayWidgetState();
}

class _ChatDetailsOverlayWidgetState extends State<ChatDetailsOverlayWidget> {
  late ChatDetailsOverlayModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatDetailsOverlayModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(0.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 4.0,
          sigmaY: 4.0,
        ),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            constraints: BoxConstraints(
              maxWidth: 700.0,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0.0),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 70.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'פרטי הצ\'אט',
                          style: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                font: GoogleFonts.interTight(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontStyle,
                                ),
                                fontSize: MediaQuery.sizeOf(context).width <
                                        kBreakpointSmall
                                    ? 24.0
                                    : 34.0,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .fontStyle,
                              ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                        child: FlutterFlowIconButton(
                          borderRadius: 12.0,
                          borderWidth: 1.0,
                          buttonSize: MediaQuery.sizeOf(context).width <
                                  kBreakpointSmall
                              ? 40.0
                              : 50.0,
                          icon: Icon(
                            Icons.cancel_outlined,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: MediaQuery.sizeOf(context).width <
                                    kBreakpointSmall
                                ? 24.0
                                : 32.0,
                          ),
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 0.0, 0.0),
                    child: Text(
                      'משתתפים בצ\'אט',
                      style: FlutterFlowTheme.of(context).labelMedium.override(
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
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                      child: Builder(
                        builder: (context) {
                          final chatUsers =
                              widget!.chatRef?.users?.toList() ?? [];

                          return ListView.separated(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            itemCount: chatUsers.length,
                            separatorBuilder: (_, __) => SizedBox(height: 8.0),
                            itemBuilder: (context, chatUsersIndex) {
                              final chatUsersItem = chatUsers[chatUsersIndex];
                              return FutureBuilder<UsersRecord>(
                                future:
                                    UsersRecord.getDocumentOnce(chatUsersItem),
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

                                  final userListSmallUsersRecord =
                                      snapshot.data!;

                                  return wrapWithModel(
                                    model: _model.userListSmallModels.getModel(
                                      chatUsersItem.id,
                                      chatUsersIndex,
                                    ),
                                    updateCallback: () => safeSetState(() {}),
                                    updateOnChange: true,
                                    child: UserListSmallWidget(
                                      key: Key(
                                        'Keynzt_${chatUsersItem.id}',
                                      ),
                                      userRef: userListSmallUsersRecord,
                                      action: () async {},
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                          ),
                          child: Visibility(
                            visible: currentUserDocument?.role == Role.coach,
                            child: AuthUserStreamWidget(
                              builder: (context) => wrapWithModel(
                                model: _model.deleteDialogModel,
                                updateCallback: () => safeSetState(() {}),
                                updateOnChange: true,
                                child: DeleteDialogWidget(
                                  chatList: widget!.chatRef,
                                  action: () async {
                                    Navigator.pop(context);

                                    context.pushNamed(
                                      Chat2InviteUsersWidget.routeName,
                                      queryParameters: {
                                        'chatRef': serializeParam(
                                          widget!.chatRef,
                                          ParamType.Document,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        'chatRef': widget!.chatRef,
                                        '__transition_info__': TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.bottomToTop,
                                          duration: Duration(milliseconds: 250),
                                        ),
                                      },
                                    );
                                  },
                                  deleteAction: () async {
                                    await widget!.chatRef!.reference.delete();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'You have successfully deleted a chat!',
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.interTight(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
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
                                        ),
                                        duration: Duration(milliseconds: 3000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context).error,
                                      ),
                                    );

                                    context.pushNamed(
                                      Chat2MainWidget.routeName,
                                      extra: <String, dynamic>{
                                        '__transition_info__': TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.leftToRight,
                                          duration: Duration(milliseconds: 220),
                                        ),
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 44.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                      text: 'סגירה',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 52.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            44.0, 0.0, 44.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        textStyle:
                            FlutterFlowTheme.of(context).titleLarge.override(
                                  font: GoogleFonts.interTight(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontStyle,
                                  ),
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .fontStyle,
                                ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                        hoverColor: FlutterFlowTheme.of(context).alternate,
                        hoverBorderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 2.0,
                        ),
                        hoverTextColor:
                            FlutterFlowTheme.of(context).primaryText,
                        hoverElevation: 3.0,
                      ),
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

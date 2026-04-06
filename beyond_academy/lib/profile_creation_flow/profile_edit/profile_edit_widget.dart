import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/profile_creation_flow/edit_profile_component/edit_profile_component_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'profile_edit_model.dart';
export 'profile_edit_model.dart';

class ProfileEditWidget extends StatefulWidget {
  const ProfileEditWidget({super.key});

  static String routeName = 'profile_Edit';
  static String routePath = '/profileEdit';

  @override
  State<ProfileEditWidget> createState() => _ProfileEditWidgetState();
}

class _ProfileEditWidgetState extends State<ProfileEditWidget> {
  late ProfileEditModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileEditModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          borderWidth: 1.0,
          buttonSize: 60.0,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.of(context).primaryText,
            size: MediaQuery.sizeOf(context).width < kBreakpointSmall
                ? 30.0
                : 40.0,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        actions: [],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: SafeArea(
        top: true,
        child: Align(
          alignment: AlignmentDirectional(0.0, -1.0),
          child: Container(
            width: double.infinity,
            constraints: BoxConstraints(
              maxWidth: MediaQuery.sizeOf(context).width < kBreakpointSmall
                  ? 570.0
                  : 1200.0,
            ),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: AuthUserStreamWidget(
              builder: (context) => StreamBuilder<List<UsersRecord>>(
                stream: queryUsersRecord(
                  queryBuilder: (usersRecord) => usersRecord.where(
                    'uid',
                    isEqualTo: currentUserUid,
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
                  List<UsersRecord> editProfileComponentUsersRecordList =
                      snapshot.data!;
                  // Return an empty Container when the item does not exist.
                  if (snapshot.data!.isEmpty) {
                    return Container();
                  }
                  final editProfileComponentUsersRecord =
                      editProfileComponentUsersRecordList.isNotEmpty
                          ? editProfileComponentUsersRecordList.first
                          : null;

                  return wrapWithModel(
                    model: _model.editProfileComponentModel,
                    updateCallback: () => safeSetState(() {}),
                    child: EditProfileComponentWidget(
                      title: 'עריכת פרופיל',
                      confirmButtonText: 'שמור שינויים',
                      role: currentUserDocument!.role!,
                      navigateAction: () async {
                        if (currentUserDocument?.role == Role.player) {
                          context.pushNamed(
                            PlayerProfileWidget.routeName,
                            queryParameters: {
                              'thisUser': serializeParam(
                                editProfileComponentUsersRecord,
                                ParamType.Document,
                              ),
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              'thisUser': editProfileComponentUsersRecord,
                            },
                          );
                        } else if (currentUserDocument?.role == Role.coach) {
                          context.pushNamed(
                            CoachProfileWidget.routeName,
                            queryParameters: {
                              'thisUser': serializeParam(
                                editProfileComponentUsersRecord,
                                ParamType.Document,
                              ),
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              'thisUser': editProfileComponentUsersRecord,
                            },
                          );
                        } else {
                          context.pushNamed(
                            ParentProfileWidget.routeName,
                            queryParameters: {
                              'thisUser': serializeParam(
                                editProfileComponentUsersRecord,
                                ParamType.Document,
                              ),
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              'thisUser': editProfileComponentUsersRecord,
                            },
                          );
                        }
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

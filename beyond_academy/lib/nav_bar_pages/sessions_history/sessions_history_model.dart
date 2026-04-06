import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/custom_app_bar_widget.dart';
import '/components/custom_drawer_widget.dart';
import '/delete_confirmations/finish_sum_confirmation/finish_sum_confirmation_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'sessions_history_widget.dart' show SessionsHistoryWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SessionsHistoryModel extends FlutterFlowModel<SessionsHistoryWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for customAppBar component.
  late CustomAppBarModel customAppBarModel;
  // Model for customDrawer component.
  late CustomDrawerModel customDrawerModel;

  @override
  void initState(BuildContext context) {
    customAppBarModel = createModel(context, () => CustomAppBarModel());
    customDrawerModel = createModel(context, () => CustomDrawerModel());
  }

  @override
  void dispose() {
    customAppBarModel.dispose();
    customDrawerModel.dispose();
  }
}

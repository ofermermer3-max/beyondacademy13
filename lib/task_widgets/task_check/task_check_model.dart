import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/task_widgets/show_media/show_media_widget.dart';
import 'dart:ui';
import 'task_check_widget.dart' show TaskCheckWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TaskCheckModel extends FlutterFlowModel<TaskCheckWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for checkDescription widget.
  FocusNode? checkDescriptionFocusNode;
  TextEditingController? checkDescriptionTextController;
  String? Function(BuildContext, String?)?
      checkDescriptionTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    checkDescriptionFocusNode?.dispose();
    checkDescriptionTextController?.dispose();
  }
}

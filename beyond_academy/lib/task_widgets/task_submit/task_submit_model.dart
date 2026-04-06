import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'task_submit_widget.dart' show TaskSubmitWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TaskSubmitModel extends FlutterFlowModel<TaskSubmitWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading_uploadedPhoto = false;
  FFUploadedFile uploadedLocalFile_uploadedPhoto =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadedPhoto = '';

  // State field(s) for notesRespond widget.
  FocusNode? notesRespondFocusNode;
  TextEditingController? notesRespondTextController;
  String? Function(BuildContext, String?)? notesRespondTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    notesRespondFocusNode?.dispose();
    notesRespondTextController?.dispose();
  }
}

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
import 'add_session_componet_widget.dart' show AddSessionComponetWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddSessionComponetModel
    extends FlutterFlowModel<AddSessionComponetWidget> {
  ///  Local state fields for this component.

  DateTime? endTimeHolder;

  ///  State fields for stateful widgets in this component.

  // State field(s) for sessionType widget.
  String? sessionTypeValue;
  FormFieldController<String>? sessionTypeValueController;
  // State field(s) for location widget.
  FocusNode? locationFocusNode;
  TextEditingController? locationTextController;
  String? Function(BuildContext, String?)? locationTextControllerValidator;
  DateTime? datePicked;
  // State field(s) for AgroupSelection widget.
  String? agroupSelectionValue;
  FormFieldController<String>? agroupSelectionValueController;
  // State field(s) for playerSelection widget.
  List<String>? playerSelectionValue;
  FormFieldController<List<String>>? playerSelectionValueController;
  // State field(s) for coachSelection widget.
  String? coachSelectionValue;
  FormFieldController<String>? coachSelectionValueController;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  SessionsRecord? newSession;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    locationFocusNode?.dispose();
    locationTextController?.dispose();
  }
}

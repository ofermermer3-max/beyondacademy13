import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'add_mashov_widget.dart' show AddMashovWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddMashovModel extends FlutterFlowModel<AddMashovWidget> {
  ///  Local state fields for this component.

  List<String> listCreator = [];
  void addToListCreator(String item) => listCreator.add(item);
  void removeFromListCreator(String item) => listCreator.remove(item);
  void removeAtIndexFromListCreator(int index) => listCreator.removeAt(index);
  void insertAtIndexInListCreator(int index, String item) =>
      listCreator.insert(index, item);
  void updateListCreatorAtIndex(int index, Function(String) updateFn) =>
      listCreator[index] = updateFn(listCreator[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for mashov widget.
  FocusNode? mashovFocusNode;
  TextEditingController? mashovTextController;
  String? Function(BuildContext, String?)? mashovTextControllerValidator;
  // State field(s) for everyoneCheckBox widget.
  bool? everyoneCheckBoxValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    mashovFocusNode?.dispose();
    mashovTextController?.dispose();
  }
}

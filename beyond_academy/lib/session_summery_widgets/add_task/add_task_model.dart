import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'add_task_widget.dart' show AddTaskWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddTaskModel extends FlutterFlowModel<AddTaskWidget> {
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

  // State field(s) for taskTitle widget.
  FocusNode? taskTitleFocusNode;
  TextEditingController? taskTitleTextController;
  String? Function(BuildContext, String?)? taskTitleTextControllerValidator;
  // State field(s) for taskDescription widget.
  FocusNode? taskDescriptionFocusNode;
  TextEditingController? taskDescriptionTextController;
  String? Function(BuildContext, String?)?
      taskDescriptionTextControllerValidator;
  DateTime? datePicked;
  // State field(s) for everyoneCheckBox widget.
  bool? everyoneCheckBoxValue;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  TasksRecord? newLoopTask;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  TasksRecord? newTask;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    taskTitleFocusNode?.dispose();
    taskTitleTextController?.dispose();

    taskDescriptionFocusNode?.dispose();
    taskDescriptionTextController?.dispose();
  }
}

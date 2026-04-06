import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'add_new_point_widget.dart' show AddNewPointWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddNewPointModel extends FlutterFlowModel<AddNewPointWidget> {
  ///  Local state fields for this component.

  List<PointStruct> listHolder = [];
  void addToListHolder(PointStruct item) => listHolder.add(item);
  void removeFromListHolder(PointStruct item) => listHolder.remove(item);
  void removeAtIndexFromListHolder(int index) => listHolder.removeAt(index);
  void insertAtIndexInListHolder(int index, PointStruct item) =>
      listHolder.insert(index, item);
  void updateListHolderAtIndex(int index, Function(PointStruct) updateFn) =>
      listHolder[index] = updateFn(listHolder[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for myPointTitle widget.
  FocusNode? myPointTitleFocusNode;
  TextEditingController? myPointTitleTextController;
  String? Function(BuildContext, String?)? myPointTitleTextControllerValidator;
  // State field(s) for myPointDescription widget.
  FocusNode? myPointDescriptionFocusNode;
  TextEditingController? myPointDescriptionTextController;
  String? Function(BuildContext, String?)?
      myPointDescriptionTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    myPointTitleFocusNode?.dispose();
    myPointTitleTextController?.dispose();

    myPointDescriptionFocusNode?.dispose();
    myPointDescriptionTextController?.dispose();
  }
}

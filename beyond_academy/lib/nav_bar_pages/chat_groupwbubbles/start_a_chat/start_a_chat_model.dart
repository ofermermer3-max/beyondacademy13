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
import 'start_a_chat_widget.dart' show StartAChatWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StartAChatModel extends FlutterFlowModel<StartAChatWidget> {
  ///  Local state fields for this page.

  List<DocumentReference> usersList = [];
  void addToUsersList(DocumentReference item) => usersList.add(item);
  void removeFromUsersList(DocumentReference item) => usersList.remove(item);
  void removeAtIndexFromUsersList(int index) => usersList.removeAt(index);
  void insertAtIndexInUsersList(int index, DocumentReference item) =>
      usersList.insert(index, item);
  void updateUsersListAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      usersList[index] = updateFn(usersList[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for searchUsers widget.
  FocusNode? searchUsersFocusNode;
  TextEditingController? searchUsersTextController;
  String? Function(BuildContext, String?)? searchUsersTextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Card widget.
  ChatsRecord? newPersonalChat;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchUsersFocusNode?.dispose();
    searchUsersTextController?.dispose();
  }
}

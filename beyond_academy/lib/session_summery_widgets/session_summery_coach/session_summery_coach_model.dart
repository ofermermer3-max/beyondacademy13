import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_swipeable_stack.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/nav_bar_pages/chat_groupwbubbles/empty_state_simple/empty_state_simple_widget.dart';
import '/session_summery_widgets/add_mashov/add_mashov_widget.dart';
import '/session_summery_widgets/add_task/add_task_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'session_summery_coach_widget.dart' show SessionSummeryCoachWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class SessionSummeryCoachModel
    extends FlutterFlowModel<SessionSummeryCoachWidget> {
  ///  Local state fields for this page.

  double progressBar = 0.0;

  List<bool> toggleListPlayers = [];
  void addToToggleListPlayers(bool item) => toggleListPlayers.add(item);
  void removeFromToggleListPlayers(bool item) => toggleListPlayers.remove(item);
  void removeAtIndexFromToggleListPlayers(int index) =>
      toggleListPlayers.removeAt(index);
  void insertAtIndexInToggleListPlayers(int index, bool item) =>
      toggleListPlayers.insert(index, item);
  void updateToggleListPlayersAtIndex(int index, Function(bool) updateFn) =>
      toggleListPlayers[index] = updateFn(toggleListPlayers[index]);

  List<bool> mashovAssignedList = [];
  void addToMashovAssignedList(bool item) => mashovAssignedList.add(item);
  void removeFromMashovAssignedList(bool item) =>
      mashovAssignedList.remove(item);
  void removeAtIndexFromMashovAssignedList(int index) =>
      mashovAssignedList.removeAt(index);
  void insertAtIndexInMashovAssignedList(int index, bool item) =>
      mashovAssignedList.insert(index, item);
  void updateMashovAssignedListAtIndex(int index, Function(bool) updateFn) =>
      mashovAssignedList[index] = updateFn(mashovAssignedList[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for SeesionRecapPageView widget.
  PageController? seesionRecapPageViewController;

  int get seesionRecapPageViewCurrentIndex =>
      seesionRecapPageViewController != null &&
              seesionRecapPageViewController!.hasClients &&
              seesionRecapPageViewController!.page != null
          ? seesionRecapPageViewController!.page!.round()
          : 0;
  // State field(s) for Subjectstitle widget.
  FocusNode? subjectstitleFocusNode;
  TextEditingController? subjectstitleTextController;
  String? Function(BuildContext, String?)? subjectstitleTextControllerValidator;
  // State field(s) for SubjectDescription widget.
  FocusNode? subjectDescriptionFocusNode;
  TextEditingController? subjectDescriptionTextController;
  String? Function(BuildContext, String?)?
      subjectDescriptionTextControllerValidator;
  // State field(s) for PointTitle widget.
  FocusNode? pointTitleFocusNode;
  TextEditingController? pointTitleTextController;
  String? Function(BuildContext, String?)? pointTitleTextControllerValidator;
  // State field(s) for PointDescription widget.
  FocusNode? pointDescriptionFocusNode;
  TextEditingController? pointDescriptionTextController;
  String? Function(BuildContext, String?)?
      pointDescriptionTextControllerValidator;
  // State field(s) for SwipeableStackMashovim widget.
  late CardSwiperController swipeableStackMashovimController1;
  // State field(s) for SwipeableStackMashovim widget.
  late CardSwiperController swipeableStackMashovimController2;

  @override
  void initState(BuildContext context) {
    swipeableStackMashovimController1 = CardSwiperController();
    swipeableStackMashovimController2 = CardSwiperController();
  }

  @override
  void dispose() {
    subjectstitleFocusNode?.dispose();
    subjectstitleTextController?.dispose();

    subjectDescriptionFocusNode?.dispose();
    subjectDescriptionTextController?.dispose();

    pointTitleFocusNode?.dispose();
    pointTitleTextController?.dispose();

    pointDescriptionFocusNode?.dispose();
    pointDescriptionTextController?.dispose();
  }
}

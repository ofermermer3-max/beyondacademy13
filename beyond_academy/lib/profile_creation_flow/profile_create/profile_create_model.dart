import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/profile_creation_flow/child_confirm_form/child_confirm_form_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'profile_create_widget.dart' show ProfileCreateWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class ProfileCreateModel extends FlutterFlowModel<ProfileCreateWidget> {
  ///  Local state fields for this page.

  double progressBar = 0.0;

  bool checkboxValue = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  bool isDataUploading_uploadData8ss254 = false;
  FFUploadedFile uploadedLocalFile_uploadData8ss254 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadData8ss254 = '';

  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode;
  TextEditingController? yourNameTextController;
  String? Function(BuildContext, String?)? yourNameTextControllerValidator;
  // State field(s) for yourPhone widget.
  FocusNode? yourPhoneFocusNode;
  TextEditingController? yourPhoneTextController;
  String? Function(BuildContext, String?)? yourPhoneTextControllerValidator;
  // State field(s) for role_dropDown widget.
  String? roleDropDownValue;
  FormFieldController<String>? roleDropDownValueController;
  // State field(s) for yourTeam widget.
  FocusNode? yourTeamFocusNode;
  TextEditingController? yourTeamTextController;
  String? Function(BuildContext, String?)? yourTeamTextControllerValidator;
  // State field(s) for yourCity widget.
  FocusNode? yourCityFocusNode;
  TextEditingController? yourCityTextController;
  String? Function(BuildContext, String?)? yourCityTextControllerValidator;
  DateTime? datePicked1;
  // State field(s) for ageLevel widget.
  String? ageLevelValue;
  FormFieldController<String>? ageLevelValueController;
  // State field(s) for academyGroup widget.
  String? academyGroupValue;
  FormFieldController<String>? academyGroupValueController;
  // State field(s) for PermissionCheckbox widget.
  bool? permissionCheckboxValue;
  // State field(s) for childName widget.
  FocusNode? childNameFocusNode;
  TextEditingController? childNameTextController;
  String? Function(BuildContext, String?)? childNameTextControllerValidator;
  // State field(s) for childPhone widget.
  FocusNode? childPhoneFocusNode;
  TextEditingController? childPhoneTextController;
  String? Function(BuildContext, String?)? childPhoneTextControllerValidator;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  bool? value;
  // State field(s) for yourCitycoach widget.
  FocusNode? yourCitycoachFocusNode;
  TextEditingController? yourCitycoachTextController;
  String? Function(BuildContext, String?)? yourCitycoachTextControllerValidator;
  // State field(s) for shortdesc widget.
  FocusNode? shortdescFocusNode;
  TextEditingController? shortdescTextController;
  String? Function(BuildContext, String?)? shortdescTextControllerValidator;
  DateTime? datePicked2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    yourNameFocusNode?.dispose();
    yourNameTextController?.dispose();

    yourPhoneFocusNode?.dispose();
    yourPhoneTextController?.dispose();

    yourTeamFocusNode?.dispose();
    yourTeamTextController?.dispose();

    yourCityFocusNode?.dispose();
    yourCityTextController?.dispose();

    childNameFocusNode?.dispose();
    childNameTextController?.dispose();

    childPhoneFocusNode?.dispose();
    childPhoneTextController?.dispose();

    yourCitycoachFocusNode?.dispose();
    yourCitycoachTextController?.dispose();

    shortdescFocusNode?.dispose();
    shortdescTextController?.dispose();
  }
}

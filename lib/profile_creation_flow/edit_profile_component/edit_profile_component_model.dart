import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import 'edit_profile_component_widget.dart' show EditProfileComponentWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditProfileComponentModel
    extends FlutterFlowModel<EditProfileComponentWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading_uploadDatacomponet = false;
  FFUploadedFile uploadedLocalFile_uploadDatacomponet =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDatacomponet = '';

  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode;
  TextEditingController? yourNameTextController;
  String? Function(BuildContext, String?)? yourNameTextControllerValidator;
  // State field(s) for yourTeam widget.
  FocusNode? yourTeamFocusNode;
  TextEditingController? yourTeamTextController;
  String? Function(BuildContext, String?)? yourTeamTextControllerValidator;
  // State field(s) for yourCity widget.
  FocusNode? yourCityFocusNode;
  TextEditingController? yourCityTextController;
  String? Function(BuildContext, String?)? yourCityTextControllerValidator;
  // State field(s) for ageLevel widget.
  String? ageLevelValue;
  FormFieldController<String>? ageLevelValueController;
  // State field(s) for myBio widget.
  FocusNode? myBioFocusNode;
  TextEditingController? myBioTextController;
  String? Function(BuildContext, String?)? myBioTextControllerValidator;
  // State field(s) for PermissionCheckbox widget.
  bool? permissionCheckboxValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    yourNameFocusNode?.dispose();
    yourNameTextController?.dispose();

    yourTeamFocusNode?.dispose();
    yourTeamTextController?.dispose();

    yourCityFocusNode?.dispose();
    yourCityTextController?.dispose();

    myBioFocusNode?.dispose();
    myBioTextController?.dispose();
  }
}

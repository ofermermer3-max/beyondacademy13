import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/custom_app_bar_widget.dart';
import '/components/custom_drawer_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/task_widgets/task_check/task_check_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'my_tasks_widget.dart' show MyTasksWidget;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MyTasksModel extends FlutterFlowModel<MyTasksWidget> {
  ///  Local state fields for this page.

  bool taskDoneToggle = false;

  bool taskNotDoneToggle = false;

  bool taskForCheckToggle = false;

  ///  State fields for stateful widgets in this page.

  // Model for customAppBar component.
  late CustomAppBarModel customAppBarModel;
  // Model for customDrawer component.
  late CustomDrawerModel customDrawerModel;

  @override
  void initState(BuildContext context) {
    customAppBarModel = createModel(context, () => CustomAppBarModel());
    customDrawerModel = createModel(context, () => CustomDrawerModel());
  }

  @override
  void dispose() {
    customAppBarModel.dispose();
    customDrawerModel.dispose();
  }
}

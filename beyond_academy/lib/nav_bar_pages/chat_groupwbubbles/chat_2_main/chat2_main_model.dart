import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/custom_drawer_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/nav_bar_pages/chat_groupwbubbles/empty_state_simple/empty_state_simple_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'chat2_main_widget.dart' show Chat2MainWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class Chat2MainModel extends FlutterFlowModel<Chat2MainWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for searchChats widget.
  FocusNode? searchChatsFocusNode;
  TextEditingController? searchChatsTextController;
  String? Function(BuildContext, String?)? searchChatsTextControllerValidator;
  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, ChatsRecord>? listViewPagingController;
  Query? listViewPagingQuery;
  List<StreamSubscription?> listViewStreamSubscriptions = [];

  // Model for customDrawer component.
  late CustomDrawerModel customDrawerModel;

  @override
  void initState(BuildContext context) {
    customDrawerModel = createModel(context, () => CustomDrawerModel());
  }

  @override
  void dispose() {
    searchChatsFocusNode?.dispose();
    searchChatsTextController?.dispose();

    listViewStreamSubscriptions.forEach((s) => s?.cancel());
    listViewPagingController?.dispose();

    customDrawerModel.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, ChatsRecord> setListViewController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController ??= _createListViewController(query, parent);
    if (listViewPagingQuery != query) {
      listViewPagingQuery = query;
      listViewPagingController?.refresh();
    }
    return listViewPagingController!;
  }

  PagingController<DocumentSnapshot?, ChatsRecord> _createListViewController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, ChatsRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryChatsRecordPage(
          queryBuilder: (_) => listViewPagingQuery ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }
}

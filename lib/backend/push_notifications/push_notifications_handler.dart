import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    safeSetState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        if (mounted) {
          context.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        } else {
          appNavigatorKey.currentContext?.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        }
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: FlutterFlowTheme.of(context).primary,
          child: Image.asset(
            'assets/images/icon_beyond_app.png',
            fit: BoxFit.contain,
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'HomePage': ParameterData.none(),
  'nextSessions': ParameterData.none(),
  'sessionsHistory': ParameterData.none(),
  'sessionRecap': (data) async => ParameterData(
        allParams: {
          'thisSession': await getDocumentParameter<SessionsRecord>(
              data, 'thisSession', SessionsRecord.fromSnapshot),
          'initialOption': getParameter<String>(data, 'initialOption'),
        },
      ),
  'coachPage': ParameterData.none(),
  'playersPage': (data) async => ParameterData(
        allParams: {
          'titleText': getParameter<String>(data, 'titleText'),
          'navigtionAction': getParameter<int>(data, 'navigtionAction'),
        },
      ),
  'playerProfile': (data) async => ParameterData(
        allParams: {
          'thisUser': await getDocumentParameter<UsersRecord>(
              data, 'thisUser', UsersRecord.fromSnapshot),
        },
      ),
  'taskSubmit': (data) async => ParameterData(
        allParams: {
          'thisTask': await getDocumentParameter<TasksRecord>(
              data, 'thisTask', TasksRecord.fromSnapshot),
        },
      ),
  'myTasks': ParameterData.none(),
  'myPoints': ParameterData.none(),
  'profile_ChangePassword': ParameterData.none(),
  'authentication_1': ParameterData.none(),
  'profile_Edit': ParameterData.none(),
  'profile_Create': (data) async => ParameterData(
        allParams: {
          'startIndex': getParameter<int>(data, 'startIndex'),
        },
      ),
  'sessionSummeryCoach': (data) async => ParameterData(
        allParams: {
          'thisSession': await getDocumentParameter<SessionsRecord>(
              data, 'thisSession', SessionsRecord.fromSnapshot),
        },
      ),
  'coachProfile': (data) async => ParameterData(
        allParams: {
          'thisUser': await getDocumentParameter<UsersRecord>(
              data, 'thisUser', UsersRecord.fromSnapshot),
        },
      ),
  'chat_2_Details': (data) async => ParameterData(
        allParams: {
          'chatRef': await getDocumentParameter<ChatsRecord>(
              data, 'chatRef', ChatsRecord.fromSnapshot),
        },
      ),
  'chat_2_main': ParameterData.none(),
  'chat_2_InviteUsers': (data) async => ParameterData(
        allParams: {
          'chatRef': await getDocumentParameter<ChatsRecord>(
              data, 'chatRef', ChatsRecord.fromSnapshot),
        },
      ),
  'image_Details': (data) async => ParameterData(
        allParams: {
          'chatMessage': await getDocumentParameter<ChatMessagesRecord>(
              data, 'chatMessage', ChatMessagesRecord.fromSnapshot),
        },
      ),
  'docs_main': ParameterData.none(),
  'privacyPolicy': ParameterData.none(),
  'termsOfUse': ParameterData.none(),
  'negishotFormat': ParameterData.none(),
  'childConfirmation': ParameterData.none(),
  'startAChat': ParameterData.none(),
  'ParentProfile': (data) async => ParameterData(
        allParams: {
          'thisUser': await getDocumentParameter<UsersRecord>(
              data, 'thisUser', UsersRecord.fromSnapshot),
        },
      ),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}

// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationStruct extends FFFirebaseStruct {
  NotificationStruct({
    NotificationType? type,
    DocumentReference? taskRef,
    MashovStruct? mashovRef,
    DocumentReference? sessionRef,
    DateTime? time,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _type = type,
        _taskRef = taskRef,
        _mashovRef = mashovRef,
        _sessionRef = sessionRef,
        _time = time,
        super(firestoreUtilData);

  // "type" field.
  NotificationType? _type;
  NotificationType? get type => _type;
  set type(NotificationType? val) => _type = val;

  bool hasType() => _type != null;

  // "taskRef" field.
  DocumentReference? _taskRef;
  DocumentReference? get taskRef => _taskRef;
  set taskRef(DocumentReference? val) => _taskRef = val;

  bool hasTaskRef() => _taskRef != null;

  // "mashovRef" field.
  MashovStruct? _mashovRef;
  MashovStruct get mashovRef => _mashovRef ?? MashovStruct();
  set mashovRef(MashovStruct? val) => _mashovRef = val;

  void updateMashovRef(Function(MashovStruct) updateFn) {
    updateFn(_mashovRef ??= MashovStruct());
  }

  bool hasMashovRef() => _mashovRef != null;

  // "sessionRef" field.
  DocumentReference? _sessionRef;
  DocumentReference? get sessionRef => _sessionRef;
  set sessionRef(DocumentReference? val) => _sessionRef = val;

  bool hasSessionRef() => _sessionRef != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  set time(DateTime? val) => _time = val;

  bool hasTime() => _time != null;

  static NotificationStruct fromMap(Map<String, dynamic> data) =>
      NotificationStruct(
        type: data['type'] is NotificationType
            ? data['type']
            : deserializeEnum<NotificationType>(data['type']),
        taskRef: data['taskRef'] as DocumentReference?,
        mashovRef: data['mashovRef'] is MashovStruct
            ? data['mashovRef']
            : MashovStruct.maybeFromMap(data['mashovRef']),
        sessionRef: data['sessionRef'] as DocumentReference?,
        time: data['time'] as DateTime?,
      );

  static NotificationStruct? maybeFromMap(dynamic data) => data is Map
      ? NotificationStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'type': _type?.serialize(),
        'taskRef': _taskRef,
        'mashovRef': _mashovRef?.toMap(),
        'sessionRef': _sessionRef,
        'time': _time,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'type': serializeParam(
          _type,
          ParamType.Enum,
        ),
        'taskRef': serializeParam(
          _taskRef,
          ParamType.DocumentReference,
        ),
        'mashovRef': serializeParam(
          _mashovRef,
          ParamType.DataStruct,
        ),
        'sessionRef': serializeParam(
          _sessionRef,
          ParamType.DocumentReference,
        ),
        'time': serializeParam(
          _time,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static NotificationStruct fromSerializableMap(Map<String, dynamic> data) =>
      NotificationStruct(
        type: deserializeParam<NotificationType>(
          data['type'],
          ParamType.Enum,
          false,
        ),
        taskRef: deserializeParam(
          data['taskRef'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['tasks'],
        ),
        mashovRef: deserializeStructParam(
          data['mashovRef'],
          ParamType.DataStruct,
          false,
          structBuilder: MashovStruct.fromSerializableMap,
        ),
        sessionRef: deserializeParam(
          data['sessionRef'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['sessions'],
        ),
        time: deserializeParam(
          data['time'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'NotificationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NotificationStruct &&
        type == other.type &&
        taskRef == other.taskRef &&
        mashovRef == other.mashovRef &&
        sessionRef == other.sessionRef &&
        time == other.time;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([type, taskRef, mashovRef, sessionRef, time]);
}

NotificationStruct createNotificationStruct({
  NotificationType? type,
  DocumentReference? taskRef,
  MashovStruct? mashovRef,
  DocumentReference? sessionRef,
  DateTime? time,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    NotificationStruct(
      type: type,
      taskRef: taskRef,
      mashovRef: mashovRef ?? (clearUnsetFields ? MashovStruct() : null),
      sessionRef: sessionRef,
      time: time,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

NotificationStruct? updateNotificationStruct(
  NotificationStruct? notification, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    notification
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addNotificationStructData(
  Map<String, dynamic> firestoreData,
  NotificationStruct? notification,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (notification == null) {
    return;
  }
  if (notification.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && notification.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final notificationData =
      getNotificationFirestoreData(notification, forFieldValue);
  final nestedData =
      notificationData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = notification.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getNotificationFirestoreData(
  NotificationStruct? notification, [
  bool forFieldValue = false,
]) {
  if (notification == null) {
    return {};
  }
  final firestoreData = mapToFirestore(notification.toMap());

  // Handle nested data for "mashovRef" field.
  addMashovStructData(
    firestoreData,
    notification.hasMashovRef() ? notification.mashovRef : null,
    'mashovRef',
    forFieldValue,
  );

  // Add any Firestore field values
  notification.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getNotificationListFirestoreData(
  List<NotificationStruct>? notifications,
) =>
    notifications?.map((e) => getNotificationFirestoreData(e, true)).toList() ??
    [];

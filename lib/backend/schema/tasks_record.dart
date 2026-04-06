import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TasksRecord extends FirestoreRecord {
  TasksRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "coach" field.
  String? _coach;
  String get coach => _coach ?? '';
  bool hasCoach() => _coach != null;

  // "player" field.
  String? _player;
  String get player => _player ?? '';
  bool hasPlayer() => _player != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "deadLine" field.
  DateTime? _deadLine;
  DateTime? get deadLine => _deadLine;
  bool hasDeadLine() => _deadLine != null;

  // "noteRespond" field.
  String? _noteRespond;
  String get noteRespond => _noteRespond ?? '';
  bool hasNoteRespond() => _noteRespond != null;

  // "status" field.
  TaskStatus? _status;
  TaskStatus? get status => _status;
  bool hasStatus() => _status != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "assignedTime" field.
  DateTime? _assignedTime;
  DateTime? get assignedTime => _assignedTime;
  bool hasAssignedTime() => _assignedTime != null;

  // "assignedSessionID" field.
  int? _assignedSessionID;
  int get assignedSessionID => _assignedSessionID ?? 0;
  bool hasAssignedSessionID() => _assignedSessionID != null;

  // "checkFeedback" field.
  String? _checkFeedback;
  String get checkFeedback => _checkFeedback ?? '';
  bool hasCheckFeedback() => _checkFeedback != null;

  // "photoURL" field.
  String? _photoURL;
  String get photoURL => _photoURL ?? '';
  bool hasPhotoURL() => _photoURL != null;

  // "videoURL" field.
  String? _videoURL;
  String get videoURL => _videoURL ?? '';
  bool hasVideoURL() => _videoURL != null;

  void _initializeFields() {
    _coach = snapshotData['coach'] as String?;
    _player = snapshotData['player'] as String?;
    _description = snapshotData['description'] as String?;
    _deadLine = snapshotData['deadLine'] as DateTime?;
    _noteRespond = snapshotData['noteRespond'] as String?;
    _status = snapshotData['status'] is TaskStatus
        ? snapshotData['status']
        : deserializeEnum<TaskStatus>(snapshotData['status']);
    _title = snapshotData['title'] as String?;
    _assignedTime = snapshotData['assignedTime'] as DateTime?;
    _assignedSessionID = castToType<int>(snapshotData['assignedSessionID']);
    _checkFeedback = snapshotData['checkFeedback'] as String?;
    _photoURL = snapshotData['photoURL'] as String?;
    _videoURL = snapshotData['videoURL'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tasks');

  static Stream<TasksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TasksRecord.fromSnapshot(s));

  static Future<TasksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TasksRecord.fromSnapshot(s));

  static TasksRecord fromSnapshot(DocumentSnapshot snapshot) => TasksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TasksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TasksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TasksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TasksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTasksRecordData({
  String? coach,
  String? player,
  String? description,
  DateTime? deadLine,
  String? noteRespond,
  TaskStatus? status,
  String? title,
  DateTime? assignedTime,
  int? assignedSessionID,
  String? checkFeedback,
  String? photoURL,
  String? videoURL,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'coach': coach,
      'player': player,
      'description': description,
      'deadLine': deadLine,
      'noteRespond': noteRespond,
      'status': status,
      'title': title,
      'assignedTime': assignedTime,
      'assignedSessionID': assignedSessionID,
      'checkFeedback': checkFeedback,
      'photoURL': photoURL,
      'videoURL': videoURL,
    }.withoutNulls,
  );

  return firestoreData;
}

class TasksRecordDocumentEquality implements Equality<TasksRecord> {
  const TasksRecordDocumentEquality();

  @override
  bool equals(TasksRecord? e1, TasksRecord? e2) {
    return e1?.coach == e2?.coach &&
        e1?.player == e2?.player &&
        e1?.description == e2?.description &&
        e1?.deadLine == e2?.deadLine &&
        e1?.noteRespond == e2?.noteRespond &&
        e1?.status == e2?.status &&
        e1?.title == e2?.title &&
        e1?.assignedTime == e2?.assignedTime &&
        e1?.assignedSessionID == e2?.assignedSessionID &&
        e1?.checkFeedback == e2?.checkFeedback &&
        e1?.photoURL == e2?.photoURL &&
        e1?.videoURL == e2?.videoURL;
  }

  @override
  int hash(TasksRecord? e) => const ListEquality().hash([
        e?.coach,
        e?.player,
        e?.description,
        e?.deadLine,
        e?.noteRespond,
        e?.status,
        e?.title,
        e?.assignedTime,
        e?.assignedSessionID,
        e?.checkFeedback,
        e?.photoURL,
        e?.videoURL
      ]);

  @override
  bool isValidKey(Object? o) => o is TasksRecord;
}

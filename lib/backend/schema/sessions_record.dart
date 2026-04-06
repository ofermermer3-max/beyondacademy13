import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SessionsRecord extends FirestoreRecord {
  SessionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "coach" field.
  String? _coach;
  String get coach => _coach ?? '';
  bool hasCoach() => _coach != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "status" field.
  SessionStatus? _status;
  SessionStatus? get status => _status;
  bool hasStatus() => _status != null;

  // "arriving" field.
  List<String>? _arriving;
  List<String> get arriving => _arriving ?? const [];
  bool hasArriving() => _arriving != null;

  // "points" field.
  List<PointStruct>? _points;
  List<PointStruct> get points => _points ?? const [];
  bool hasPoints() => _points != null;

  // "mainSubjects" field.
  List<MainSubjectStruct>? _mainSubjects;
  List<MainSubjectStruct> get mainSubjects => _mainSubjects ?? const [];
  bool hasMainSubjects() => _mainSubjects != null;

  // "isAcademy" field.
  bool? _isAcademy;
  bool get isAcademy => _isAcademy ?? false;
  bool hasIsAcademy() => _isAcademy != null;

  // "players" field.
  List<String>? _players;
  List<String> get players => _players ?? const [];
  bool hasPlayers() => _players != null;

  // "mahsovim" field.
  List<MashovStruct>? _mahsovim;
  List<MashovStruct> get mahsovim => _mahsovim ?? const [];
  bool hasMahsovim() => _mahsovim != null;

  // "flag" field.
  bool? _flag;
  bool get flag => _flag ?? false;
  bool hasFlag() => _flag != null;

  // "sessionID" field.
  int? _sessionID;
  int get sessionID => _sessionID ?? 0;
  bool hasSessionID() => _sessionID != null;

  // "type" field.
  SessionType? _type;
  SessionType? get type => _type;
  bool hasType() => _type != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "endTime" field.
  DateTime? _endTime;
  DateTime? get endTime => _endTime;
  bool hasEndTime() => _endTime != null;

  // "indeedArrivedPlayers" field.
  List<String>? _indeedArrivedPlayers;
  List<String> get indeedArrivedPlayers => _indeedArrivedPlayers ?? const [];
  bool hasIndeedArrivedPlayers() => _indeedArrivedPlayers != null;

  // "academyGroup" field.
  String? _academyGroup;
  String get academyGroup => _academyGroup ?? '';
  bool hasAcademyGroup() => _academyGroup != null;

  void _initializeFields() {
    _coach = snapshotData['coach'] as String?;
    _location = snapshotData['location'] as String?;
    _time = snapshotData['time'] as DateTime?;
    _status = snapshotData['status'] is SessionStatus
        ? snapshotData['status']
        : deserializeEnum<SessionStatus>(snapshotData['status']);
    _arriving = getDataList(snapshotData['arriving']);
    _points = getStructList(
      snapshotData['points'],
      PointStruct.fromMap,
    );
    _mainSubjects = getStructList(
      snapshotData['mainSubjects'],
      MainSubjectStruct.fromMap,
    );
    _isAcademy = snapshotData['isAcademy'] as bool?;
    _players = getDataList(snapshotData['players']);
    _mahsovim = getStructList(
      snapshotData['mahsovim'],
      MashovStruct.fromMap,
    );
    _flag = snapshotData['flag'] as bool?;
    _sessionID = castToType<int>(snapshotData['sessionID']);
    _type = snapshotData['type'] is SessionType
        ? snapshotData['type']
        : deserializeEnum<SessionType>(snapshotData['type']);
    _name = snapshotData['name'] as String?;
    _endTime = snapshotData['endTime'] as DateTime?;
    _indeedArrivedPlayers = getDataList(snapshotData['indeedArrivedPlayers']);
    _academyGroup = snapshotData['academyGroup'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('sessions');

  static Stream<SessionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SessionsRecord.fromSnapshot(s));

  static Future<SessionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SessionsRecord.fromSnapshot(s));

  static SessionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SessionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SessionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SessionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SessionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SessionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSessionsRecordData({
  String? coach,
  String? location,
  DateTime? time,
  SessionStatus? status,
  bool? isAcademy,
  bool? flag,
  int? sessionID,
  SessionType? type,
  String? name,
  DateTime? endTime,
  String? academyGroup,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'coach': coach,
      'location': location,
      'time': time,
      'status': status,
      'isAcademy': isAcademy,
      'flag': flag,
      'sessionID': sessionID,
      'type': type,
      'name': name,
      'endTime': endTime,
      'academyGroup': academyGroup,
    }.withoutNulls,
  );

  return firestoreData;
}

class SessionsRecordDocumentEquality implements Equality<SessionsRecord> {
  const SessionsRecordDocumentEquality();

  @override
  bool equals(SessionsRecord? e1, SessionsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.coach == e2?.coach &&
        e1?.location == e2?.location &&
        e1?.time == e2?.time &&
        e1?.status == e2?.status &&
        listEquality.equals(e1?.arriving, e2?.arriving) &&
        listEquality.equals(e1?.points, e2?.points) &&
        listEquality.equals(e1?.mainSubjects, e2?.mainSubjects) &&
        e1?.isAcademy == e2?.isAcademy &&
        listEquality.equals(e1?.players, e2?.players) &&
        listEquality.equals(e1?.mahsovim, e2?.mahsovim) &&
        e1?.flag == e2?.flag &&
        e1?.sessionID == e2?.sessionID &&
        e1?.type == e2?.type &&
        e1?.name == e2?.name &&
        e1?.endTime == e2?.endTime &&
        listEquality.equals(
            e1?.indeedArrivedPlayers, e2?.indeedArrivedPlayers) &&
        e1?.academyGroup == e2?.academyGroup;
  }

  @override
  int hash(SessionsRecord? e) => const ListEquality().hash([
        e?.coach,
        e?.location,
        e?.time,
        e?.status,
        e?.arriving,
        e?.points,
        e?.mainSubjects,
        e?.isAcademy,
        e?.players,
        e?.mahsovim,
        e?.flag,
        e?.sessionID,
        e?.type,
        e?.name,
        e?.endTime,
        e?.indeedArrivedPlayers,
        e?.academyGroup
      ]);

  @override
  bool isValidKey(Object? o) => o is SessionsRecord;
}

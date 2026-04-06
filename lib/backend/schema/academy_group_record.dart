import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AcademyGroupRecord extends FirestoreRecord {
  AcademyGroupRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "members" field.
  List<String>? _members;
  List<String> get members => _members ?? const [];
  bool hasMembers() => _members != null;

  // "group_number" field.
  String? _groupNumber;
  String get groupNumber => _groupNumber ?? '';
  bool hasGroupNumber() => _groupNumber != null;

  void _initializeFields() {
    _members = getDataList(snapshotData['members']);
    _groupNumber = snapshotData['group_number'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('AcademyGroup');

  static Stream<AcademyGroupRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AcademyGroupRecord.fromSnapshot(s));

  static Future<AcademyGroupRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AcademyGroupRecord.fromSnapshot(s));

  static AcademyGroupRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AcademyGroupRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AcademyGroupRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AcademyGroupRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AcademyGroupRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AcademyGroupRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAcademyGroupRecordData({
  String? groupNumber,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'group_number': groupNumber,
    }.withoutNulls,
  );

  return firestoreData;
}

class AcademyGroupRecordDocumentEquality
    implements Equality<AcademyGroupRecord> {
  const AcademyGroupRecordDocumentEquality();

  @override
  bool equals(AcademyGroupRecord? e1, AcademyGroupRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.members, e2?.members) &&
        e1?.groupNumber == e2?.groupNumber;
  }

  @override
  int hash(AcademyGroupRecord? e) =>
      const ListEquality().hash([e?.members, e?.groupNumber]);

  @override
  bool isValidKey(Object? o) => o is AcademyGroupRecord;
}

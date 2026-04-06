import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChildConfirmationRecord extends FirestoreRecord {
  ChildConfirmationRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "parent" field.
  DocumentReference? _parent;
  DocumentReference? get parent => _parent;
  bool hasParent() => _parent != null;

  // "confirmationTime" field.
  DateTime? _confirmationTime;
  DateTime? get confirmationTime => _confirmationTime;
  bool hasConfirmationTime() => _confirmationTime != null;

  // "childName" field.
  String? _childName;
  String get childName => _childName ?? '';
  bool hasChildName() => _childName != null;

  // "child" field.
  DocumentReference? _child;
  DocumentReference? get child => _child;
  bool hasChild() => _child != null;

  // "childPhone" field.
  String? _childPhone;
  String get childPhone => _childPhone ?? '';
  bool hasChildPhone() => _childPhone != null;

  void _initializeFields() {
    _parent = snapshotData['parent'] as DocumentReference?;
    _confirmationTime = snapshotData['confirmationTime'] as DateTime?;
    _childName = snapshotData['childName'] as String?;
    _child = snapshotData['child'] as DocumentReference?;
    _childPhone = snapshotData['childPhone'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('childConfirmation');

  static Stream<ChildConfirmationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChildConfirmationRecord.fromSnapshot(s));

  static Future<ChildConfirmationRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ChildConfirmationRecord.fromSnapshot(s));

  static ChildConfirmationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChildConfirmationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChildConfirmationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChildConfirmationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChildConfirmationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChildConfirmationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChildConfirmationRecordData({
  DocumentReference? parent,
  DateTime? confirmationTime,
  String? childName,
  DocumentReference? child,
  String? childPhone,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'parent': parent,
      'confirmationTime': confirmationTime,
      'childName': childName,
      'child': child,
      'childPhone': childPhone,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChildConfirmationRecordDocumentEquality
    implements Equality<ChildConfirmationRecord> {
  const ChildConfirmationRecordDocumentEquality();

  @override
  bool equals(ChildConfirmationRecord? e1, ChildConfirmationRecord? e2) {
    return e1?.parent == e2?.parent &&
        e1?.confirmationTime == e2?.confirmationTime &&
        e1?.childName == e2?.childName &&
        e1?.child == e2?.child &&
        e1?.childPhone == e2?.childPhone;
  }

  @override
  int hash(ChildConfirmationRecord? e) => const ListEquality().hash(
      [e?.parent, e?.confirmationTime, e?.childName, e?.child, e?.childPhone]);

  @override
  bool isValidKey(Object? o) => o is ChildConfirmationRecord;
}

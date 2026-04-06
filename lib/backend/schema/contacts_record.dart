import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ContactsRecord extends FirestoreRecord {
  ContactsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "team" field.
  String? _team;
  String get team => _team ?? '';
  bool hasTeam() => _team != null;

  // "phoneNumber" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "playingLevel" field.
  String? _playingLevel;
  String get playingLevel => _playingLevel ?? '';
  bool hasPlayingLevel() => _playingLevel != null;

  // "mail" field.
  String? _mail;
  String get mail => _mail ?? '';
  bool hasMail() => _mail != null;

  // "info" field.
  String? _info;
  String get info => _info ?? '';
  bool hasInfo() => _info != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _team = snapshotData['team'] as String?;
    _phoneNumber = snapshotData['phoneNumber'] as String?;
    _playingLevel = snapshotData['playingLevel'] as String?;
    _mail = snapshotData['mail'] as String?;
    _info = snapshotData['info'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('contacts');

  static Stream<ContactsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ContactsRecord.fromSnapshot(s));

  static Future<ContactsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ContactsRecord.fromSnapshot(s));

  static ContactsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ContactsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ContactsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ContactsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ContactsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ContactsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createContactsRecordData({
  String? name,
  String? team,
  String? phoneNumber,
  String? playingLevel,
  String? mail,
  String? info,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'team': team,
      'phoneNumber': phoneNumber,
      'playingLevel': playingLevel,
      'mail': mail,
      'info': info,
    }.withoutNulls,
  );

  return firestoreData;
}

class ContactsRecordDocumentEquality implements Equality<ContactsRecord> {
  const ContactsRecordDocumentEquality();

  @override
  bool equals(ContactsRecord? e1, ContactsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.team == e2?.team &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.playingLevel == e2?.playingLevel &&
        e1?.mail == e2?.mail &&
        e1?.info == e2?.info;
  }

  @override
  int hash(ContactsRecord? e) => const ListEquality().hash(
      [e?.name, e?.team, e?.phoneNumber, e?.playingLevel, e?.mail, e?.info]);

  @override
  bool isValidKey(Object? o) => o is ContactsRecord;
}

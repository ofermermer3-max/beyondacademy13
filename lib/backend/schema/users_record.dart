import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "shortDescription" field.
  String? _shortDescription;
  String get shortDescription => _shortDescription ?? '';
  bool hasShortDescription() => _shortDescription != null;

  // "last_active_time" field.
  DateTime? _lastActiveTime;
  DateTime? get lastActiveTime => _lastActiveTime;
  bool hasLastActiveTime() => _lastActiveTime != null;

  // "team" field.
  String? _team;
  String get team => _team ?? '';
  bool hasTeam() => _team != null;

  // "academyGroup" field.
  String? _academyGroup;
  String get academyGroup => _academyGroup ?? '';
  bool hasAcademyGroup() => _academyGroup != null;

  // "role" field.
  Role? _role;
  Role? get role => _role;
  bool hasRole() => _role != null;

  // "notifications" field.
  List<NotificationStruct>? _notifications;
  List<NotificationStruct> get notifications => _notifications ?? const [];
  bool hasNotifications() => _notifications != null;

  // "birthday" field.
  DateTime? _birthday;
  DateTime? get birthday => _birthday;
  bool hasBirthday() => _birthday != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "playingLevel" field.
  String? _playingLevel;
  String get playingLevel => _playingLevel ?? '';
  bool hasPlayingLevel() => _playingLevel != null;

  // "favoritePoints" field.
  List<PointStruct>? _favoritePoints;
  List<PointStruct> get favoritePoints => _favoritePoints ?? const [];
  bool hasFavoritePoints() => _favoritePoints != null;

  // "isAdmin" field.
  bool? _isAdmin;
  bool get isAdmin => _isAdmin ?? false;
  bool hasIsAdmin() => _isAdmin != null;

  // "detailsPermission" field.
  bool? _detailsPermission;
  bool get detailsPermission => _detailsPermission ?? false;
  bool hasDetailsPermission() => _detailsPermission != null;

  // "childUID" field.
  String? _childUID;
  String get childUID => _childUID ?? '';
  bool hasChildUID() => _childUID != null;

  // "parent" field.
  DocumentReference? _parent;
  DocumentReference? get parent => _parent;
  bool hasParent() => _parent != null;

  // "isAcademy" field.
  bool? _isAcademy;
  bool get isAcademy => _isAcademy ?? false;
  bool hasIsAcademy() => _isAcademy != null;

  // "fcm_token" field.
  String? _fcmToken;
  String get fcmToken => _fcmToken ?? '';
  bool hasFcmToken() => _fcmToken != null;

  // "approve" field.
  bool? _approve;
  bool get approve => _approve ?? false;
  bool hasApprove() => _approve != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _shortDescription = snapshotData['shortDescription'] as String?;
    _lastActiveTime = snapshotData['last_active_time'] as DateTime?;
    _team = snapshotData['team'] as String?;
    _academyGroup = snapshotData['academyGroup'] as String?;
    _role = snapshotData['role'] is Role
        ? snapshotData['role']
        : deserializeEnum<Role>(snapshotData['role']);
    _notifications = getStructList(
      snapshotData['notifications'],
      NotificationStruct.fromMap,
    );
    _birthday = snapshotData['birthday'] as DateTime?;
    _city = snapshotData['city'] as String?;
    _playingLevel = snapshotData['playingLevel'] as String?;
    _favoritePoints = getStructList(
      snapshotData['favoritePoints'],
      PointStruct.fromMap,
    );
    _isAdmin = snapshotData['isAdmin'] as bool?;
    _detailsPermission = snapshotData['detailsPermission'] as bool?;
    _childUID = snapshotData['childUID'] as String?;
    _parent = snapshotData['parent'] as DocumentReference?;
    _isAcademy = snapshotData['isAcademy'] as bool?;
    _fcmToken = snapshotData['fcm_token'] as String?;
    _approve = snapshotData['approve'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? shortDescription,
  DateTime? lastActiveTime,
  String? team,
  String? academyGroup,
  Role? role,
  DateTime? birthday,
  String? city,
  String? playingLevel,
  bool? isAdmin,
  bool? detailsPermission,
  String? childUID,
  DocumentReference? parent,
  bool? isAcademy,
  String? fcmToken,
  bool? approve,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'shortDescription': shortDescription,
      'last_active_time': lastActiveTime,
      'team': team,
      'academyGroup': academyGroup,
      'role': role,
      'birthday': birthday,
      'city': city,
      'playingLevel': playingLevel,
      'isAdmin': isAdmin,
      'detailsPermission': detailsPermission,
      'childUID': childUID,
      'parent': parent,
      'isAcademy': isAcademy,
      'fcm_token': fcmToken,
      'approve': approve,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.shortDescription == e2?.shortDescription &&
        e1?.lastActiveTime == e2?.lastActiveTime &&
        e1?.team == e2?.team &&
        e1?.academyGroup == e2?.academyGroup &&
        e1?.role == e2?.role &&
        listEquality.equals(e1?.notifications, e2?.notifications) &&
        e1?.birthday == e2?.birthday &&
        e1?.city == e2?.city &&
        e1?.playingLevel == e2?.playingLevel &&
        listEquality.equals(e1?.favoritePoints, e2?.favoritePoints) &&
        e1?.isAdmin == e2?.isAdmin &&
        e1?.detailsPermission == e2?.detailsPermission &&
        e1?.childUID == e2?.childUID &&
        e1?.parent == e2?.parent &&
        e1?.isAcademy == e2?.isAcademy &&
        e1?.fcmToken == e2?.fcmToken &&
        e1?.approve == e2?.approve;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.shortDescription,
        e?.lastActiveTime,
        e?.team,
        e?.academyGroup,
        e?.role,
        e?.notifications,
        e?.birthday,
        e?.city,
        e?.playingLevel,
        e?.favoritePoints,
        e?.isAdmin,
        e?.detailsPermission,
        e?.childUID,
        e?.parent,
        e?.isAcademy,
        e?.fcmToken,
        e?.approve
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}

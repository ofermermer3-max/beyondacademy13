// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PointStruct extends FFFirebaseStruct {
  PointStruct({
    /// The ID of the coach who posted the point
    String? coach,
    String? title,
    String? description,

    /// number of  the users that added this point to their favorites
    int? favorites,
    int? createdSessionID,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _coach = coach,
        _title = title,
        _description = description,
        _favorites = favorites,
        _createdSessionID = createdSessionID,
        super(firestoreUtilData);

  // "coach" field.
  String? _coach;
  String get coach => _coach ?? '';
  set coach(String? val) => _coach = val;

  bool hasCoach() => _coach != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "Favorites" field.
  int? _favorites;
  int get favorites => _favorites ?? 0;
  set favorites(int? val) => _favorites = val;

  void incrementFavorites(int amount) => favorites = favorites + amount;

  bool hasFavorites() => _favorites != null;

  // "createdSessionID" field.
  int? _createdSessionID;
  int get createdSessionID => _createdSessionID ?? 0;
  set createdSessionID(int? val) => _createdSessionID = val;

  void incrementCreatedSessionID(int amount) =>
      createdSessionID = createdSessionID + amount;

  bool hasCreatedSessionID() => _createdSessionID != null;

  static PointStruct fromMap(Map<String, dynamic> data) => PointStruct(
        coach: data['coach'] as String?,
        title: data['title'] as String?,
        description: data['description'] as String?,
        favorites: castToType<int>(data['Favorites']),
        createdSessionID: castToType<int>(data['createdSessionID']),
      );

  static PointStruct? maybeFromMap(dynamic data) =>
      data is Map ? PointStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'coach': _coach,
        'title': _title,
        'description': _description,
        'Favorites': _favorites,
        'createdSessionID': _createdSessionID,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'coach': serializeParam(
          _coach,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'Favorites': serializeParam(
          _favorites,
          ParamType.int,
        ),
        'createdSessionID': serializeParam(
          _createdSessionID,
          ParamType.int,
        ),
      }.withoutNulls;

  static PointStruct fromSerializableMap(Map<String, dynamic> data) =>
      PointStruct(
        coach: deserializeParam(
          data['coach'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        favorites: deserializeParam(
          data['Favorites'],
          ParamType.int,
          false,
        ),
        createdSessionID: deserializeParam(
          data['createdSessionID'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'PointStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PointStruct &&
        coach == other.coach &&
        title == other.title &&
        description == other.description &&
        favorites == other.favorites &&
        createdSessionID == other.createdSessionID;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([coach, title, description, favorites, createdSessionID]);
}

PointStruct createPointStruct({
  String? coach,
  String? title,
  String? description,
  int? favorites,
  int? createdSessionID,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PointStruct(
      coach: coach,
      title: title,
      description: description,
      favorites: favorites,
      createdSessionID: createdSessionID,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PointStruct? updatePointStruct(
  PointStruct? point, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    point
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPointStructData(
  Map<String, dynamic> firestoreData,
  PointStruct? point,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (point == null) {
    return;
  }
  if (point.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && point.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final pointData = getPointFirestoreData(point, forFieldValue);
  final nestedData = pointData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = point.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPointFirestoreData(
  PointStruct? point, [
  bool forFieldValue = false,
]) {
  if (point == null) {
    return {};
  }
  final firestoreData = mapToFirestore(point.toMap());

  // Add any Firestore field values
  point.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPointListFirestoreData(
  List<PointStruct>? points,
) =>
    points?.map((e) => getPointFirestoreData(e, true)).toList() ?? [];

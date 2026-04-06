// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MashovStruct extends FFFirebaseStruct {
  MashovStruct({
    String? coach,
    String? description,
    String? player,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _coach = coach,
        _description = description,
        _player = player,
        super(firestoreUtilData);

  // "coach" field.
  String? _coach;
  String get coach => _coach ?? '';
  set coach(String? val) => _coach = val;

  bool hasCoach() => _coach != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "player" field.
  String? _player;
  String get player => _player ?? '';
  set player(String? val) => _player = val;

  bool hasPlayer() => _player != null;

  static MashovStruct fromMap(Map<String, dynamic> data) => MashovStruct(
        coach: data['coach'] as String?,
        description: data['description'] as String?,
        player: data['player'] as String?,
      );

  static MashovStruct? maybeFromMap(dynamic data) =>
      data is Map ? MashovStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'coach': _coach,
        'description': _description,
        'player': _player,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'coach': serializeParam(
          _coach,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'player': serializeParam(
          _player,
          ParamType.String,
        ),
      }.withoutNulls;

  static MashovStruct fromSerializableMap(Map<String, dynamic> data) =>
      MashovStruct(
        coach: deserializeParam(
          data['coach'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        player: deserializeParam(
          data['player'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MashovStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MashovStruct &&
        coach == other.coach &&
        description == other.description &&
        player == other.player;
  }

  @override
  int get hashCode => const ListEquality().hash([coach, description, player]);
}

MashovStruct createMashovStruct({
  String? coach,
  String? description,
  String? player,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MashovStruct(
      coach: coach,
      description: description,
      player: player,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MashovStruct? updateMashovStruct(
  MashovStruct? mashov, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    mashov
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMashovStructData(
  Map<String, dynamic> firestoreData,
  MashovStruct? mashov,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (mashov == null) {
    return;
  }
  if (mashov.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && mashov.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final mashovData = getMashovFirestoreData(mashov, forFieldValue);
  final nestedData = mashovData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = mashov.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMashovFirestoreData(
  MashovStruct? mashov, [
  bool forFieldValue = false,
]) {
  if (mashov == null) {
    return {};
  }
  final firestoreData = mapToFirestore(mashov.toMap());

  // Add any Firestore field values
  mashov.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMashovListFirestoreData(
  List<MashovStruct>? mashovs,
) =>
    mashovs?.map((e) => getMashovFirestoreData(e, true)).toList() ?? [];

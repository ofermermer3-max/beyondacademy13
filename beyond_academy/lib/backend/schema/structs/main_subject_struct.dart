// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MainSubjectStruct extends FFFirebaseStruct {
  MainSubjectStruct({
    String? coach,
    String? title,
    String? description,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _coach = coach,
        _title = title,
        _description = description,
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

  static MainSubjectStruct fromMap(Map<String, dynamic> data) =>
      MainSubjectStruct(
        coach: data['coach'] as String?,
        title: data['title'] as String?,
        description: data['description'] as String?,
      );

  static MainSubjectStruct? maybeFromMap(dynamic data) => data is Map
      ? MainSubjectStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'coach': _coach,
        'title': _title,
        'description': _description,
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
      }.withoutNulls;

  static MainSubjectStruct fromSerializableMap(Map<String, dynamic> data) =>
      MainSubjectStruct(
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
      );

  @override
  String toString() => 'MainSubjectStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MainSubjectStruct &&
        coach == other.coach &&
        title == other.title &&
        description == other.description;
  }

  @override
  int get hashCode => const ListEquality().hash([coach, title, description]);
}

MainSubjectStruct createMainSubjectStruct({
  String? coach,
  String? title,
  String? description,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MainSubjectStruct(
      coach: coach,
      title: title,
      description: description,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MainSubjectStruct? updateMainSubjectStruct(
  MainSubjectStruct? mainSubject, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    mainSubject
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMainSubjectStructData(
  Map<String, dynamic> firestoreData,
  MainSubjectStruct? mainSubject,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (mainSubject == null) {
    return;
  }
  if (mainSubject.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && mainSubject.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final mainSubjectData =
      getMainSubjectFirestoreData(mainSubject, forFieldValue);
  final nestedData =
      mainSubjectData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = mainSubject.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMainSubjectFirestoreData(
  MainSubjectStruct? mainSubject, [
  bool forFieldValue = false,
]) {
  if (mainSubject == null) {
    return {};
  }
  final firestoreData = mapToFirestore(mainSubject.toMap());

  // Add any Firestore field values
  mainSubject.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMainSubjectListFirestoreData(
  List<MainSubjectStruct>? mainSubjects,
) =>
    mainSubjects?.map((e) => getMainSubjectFirestoreData(e, true)).toList() ??
    [];

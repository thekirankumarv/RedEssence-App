import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class ExerciseRecord extends FirestoreRecord {
  ExerciseRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _image = snapshotData['image'] as String?;
    _type = snapshotData['type'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('exercise');

  static Stream<ExerciseRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ExerciseRecord.fromSnapshot(s));

  static Future<ExerciseRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ExerciseRecord.fromSnapshot(s));

  static ExerciseRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ExerciseRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ExerciseRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ExerciseRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ExerciseRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ExerciseRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createExerciseRecordData({
  String? name,
  String? description,
  String? image,
  String? type,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'image': image,
      'type': type,
    }.withoutNulls,
  );

  return firestoreData;
}

class ExerciseRecordDocumentEquality implements Equality<ExerciseRecord> {
  const ExerciseRecordDocumentEquality();

  @override
  bool equals(ExerciseRecord? e1, ExerciseRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.image == e2?.image &&
        e1?.type == e2?.type;
  }

  @override
  int hash(ExerciseRecord? e) =>
      const ListEquality().hash([e?.name, e?.description, e?.image, e?.type]);

  @override
  bool isValidKey(Object? o) => o is ExerciseRecord;
}

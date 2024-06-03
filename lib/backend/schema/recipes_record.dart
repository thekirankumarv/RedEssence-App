import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class RecipesRecord extends FirestoreRecord {
  RecipesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "user_name" field.
  String? _userName;
  String get userName => _userName ?? '';
  bool hasUserName() => _userName != null;

  // "recipe_title" field.
  String? _recipeTitle;
  String get recipeTitle => _recipeTitle ?? '';
  bool hasRecipeTitle() => _recipeTitle != null;

  // "recipe_description" field.
  String? _recipeDescription;
  String get recipeDescription => _recipeDescription ?? '';
  bool hasRecipeDescription() => _recipeDescription != null;

  // "recipe_image" field.
  String? _recipeImage;
  String get recipeImage => _recipeImage ?? '';
  bool hasRecipeImage() => _recipeImage != null;

  // "date_uploaded" field.
  DateTime? _dateUploaded;
  DateTime? get dateUploaded => _dateUploaded;
  bool hasDateUploaded() => _dateUploaded != null;

  // "profile_pic" field.
  String? _profilePic;
  String get profilePic => _profilePic ?? '';
  bool hasProfilePic() => _profilePic != null;

  void _initializeFields() {
    _userId = snapshotData['user_id'] as String?;
    _userName = snapshotData['user_name'] as String?;
    _recipeTitle = snapshotData['recipe_title'] as String?;
    _recipeDescription = snapshotData['recipe_description'] as String?;
    _recipeImage = snapshotData['recipe_image'] as String?;
    _dateUploaded = snapshotData['date_uploaded'] as DateTime?;
    _profilePic = snapshotData['profile_pic'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('recipes');

  static Stream<RecipesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RecipesRecord.fromSnapshot(s));

  static Future<RecipesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RecipesRecord.fromSnapshot(s));

  static RecipesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RecipesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RecipesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RecipesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RecipesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RecipesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRecipesRecordData({
  String? userId,
  String? userName,
  String? recipeTitle,
  String? recipeDescription,
  String? recipeImage,
  DateTime? dateUploaded,
  String? profilePic,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_id': userId,
      'user_name': userName,
      'recipe_title': recipeTitle,
      'recipe_description': recipeDescription,
      'recipe_image': recipeImage,
      'date_uploaded': dateUploaded,
      'profile_pic': profilePic,
    }.withoutNulls,
  );

  return firestoreData;
}

class RecipesRecordDocumentEquality implements Equality<RecipesRecord> {
  const RecipesRecordDocumentEquality();

  @override
  bool equals(RecipesRecord? e1, RecipesRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.userName == e2?.userName &&
        e1?.recipeTitle == e2?.recipeTitle &&
        e1?.recipeDescription == e2?.recipeDescription &&
        e1?.recipeImage == e2?.recipeImage &&
        e1?.dateUploaded == e2?.dateUploaded &&
        e1?.profilePic == e2?.profilePic;
  }

  @override
  int hash(RecipesRecord? e) => const ListEquality().hash([
        e?.userId,
        e?.userName,
        e?.recipeTitle,
        e?.recipeDescription,
        e?.recipeImage,
        e?.dateUploaded,
        e?.profilePic
      ]);

  @override
  bool isValidKey(Object? o) => o is RecipesRecord;
}

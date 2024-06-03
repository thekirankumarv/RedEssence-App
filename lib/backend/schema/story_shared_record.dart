import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class StorySharedRecord extends FirestoreRecord {
  StorySharedRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "date_uploaded" field.
  DateTime? _dateUploaded;
  DateTime? get dateUploaded => _dateUploaded;
  bool hasDateUploaded() => _dateUploaded != null;

  // "story_title" field.
  String? _storyTitle;
  String get storyTitle => _storyTitle ?? '';
  bool hasStoryTitle() => _storyTitle != null;

  // "story_description" field.
  String? _storyDescription;
  String get storyDescription => _storyDescription ?? '';
  bool hasStoryDescription() => _storyDescription != null;

  // "user_name" field.
  String? _userName;
  String get userName => _userName ?? '';
  bool hasUserName() => _userName != null;

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "profile_pic" field.
  String? _profilePic;
  String get profilePic => _profilePic ?? '';
  bool hasProfilePic() => _profilePic != null;

  void _initializeFields() {
    _dateUploaded = snapshotData['date_uploaded'] as DateTime?;
    _storyTitle = snapshotData['story_title'] as String?;
    _storyDescription = snapshotData['story_description'] as String?;
    _userName = snapshotData['user_name'] as String?;
    _userId = snapshotData['user_id'] as String?;
    _profilePic = snapshotData['profile_pic'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('story_shared');

  static Stream<StorySharedRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StorySharedRecord.fromSnapshot(s));

  static Future<StorySharedRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StorySharedRecord.fromSnapshot(s));

  static StorySharedRecord fromSnapshot(DocumentSnapshot snapshot) =>
      StorySharedRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StorySharedRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StorySharedRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StorySharedRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StorySharedRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStorySharedRecordData({
  DateTime? dateUploaded,
  String? storyTitle,
  String? storyDescription,
  String? userName,
  String? userId,
  String? profilePic,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date_uploaded': dateUploaded,
      'story_title': storyTitle,
      'story_description': storyDescription,
      'user_name': userName,
      'user_id': userId,
      'profile_pic': profilePic,
    }.withoutNulls,
  );

  return firestoreData;
}

class StorySharedRecordDocumentEquality implements Equality<StorySharedRecord> {
  const StorySharedRecordDocumentEquality();

  @override
  bool equals(StorySharedRecord? e1, StorySharedRecord? e2) {
    return e1?.dateUploaded == e2?.dateUploaded &&
        e1?.storyTitle == e2?.storyTitle &&
        e1?.storyDescription == e2?.storyDescription &&
        e1?.userName == e2?.userName &&
        e1?.userId == e2?.userId &&
        e1?.profilePic == e2?.profilePic;
  }

  @override
  int hash(StorySharedRecord? e) => const ListEquality().hash([
        e?.dateUploaded,
        e?.storyTitle,
        e?.storyDescription,
        e?.userName,
        e?.userId,
        e?.profilePic
      ]);

  @override
  bool isValidKey(Object? o) => o is StorySharedRecord;
}

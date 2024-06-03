import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class UploadedVideoRecord extends FirestoreRecord {
  UploadedVideoRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "post_title" field.
  String? _postTitle;
  String get postTitle => _postTitle ?? '';
  bool hasPostTitle() => _postTitle != null;

  // "post_description" field.
  String? _postDescription;
  String get postDescription => _postDescription ?? '';
  bool hasPostDescription() => _postDescription != null;

  // "post_user" field.
  String? _postUser;
  String get postUser => _postUser ?? '';
  bool hasPostUser() => _postUser != null;

  // "post_videos" field.
  String? _postVideos;
  String get postVideos => _postVideos ?? '';
  bool hasPostVideos() => _postVideos != null;

  void _initializeFields() {
    _postTitle = snapshotData['post_title'] as String?;
    _postDescription = snapshotData['post_description'] as String?;
    _postUser = snapshotData['post_user'] as String?;
    _postVideos = snapshotData['post_videos'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('uploaded_video');

  static Stream<UploadedVideoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UploadedVideoRecord.fromSnapshot(s));

  static Future<UploadedVideoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UploadedVideoRecord.fromSnapshot(s));

  static UploadedVideoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UploadedVideoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UploadedVideoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UploadedVideoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UploadedVideoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UploadedVideoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUploadedVideoRecordData({
  String? postTitle,
  String? postDescription,
  String? postUser,
  String? postVideos,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'post_title': postTitle,
      'post_description': postDescription,
      'post_user': postUser,
      'post_videos': postVideos,
    }.withoutNulls,
  );

  return firestoreData;
}

class UploadedVideoRecordDocumentEquality
    implements Equality<UploadedVideoRecord> {
  const UploadedVideoRecordDocumentEquality();

  @override
  bool equals(UploadedVideoRecord? e1, UploadedVideoRecord? e2) {
    return e1?.postTitle == e2?.postTitle &&
        e1?.postDescription == e2?.postDescription &&
        e1?.postUser == e2?.postUser &&
        e1?.postVideos == e2?.postVideos;
  }

  @override
  int hash(UploadedVideoRecord? e) => const ListEquality()
      .hash([e?.postTitle, e?.postDescription, e?.postUser, e?.postVideos]);

  @override
  bool isValidKey(Object? o) => o is UploadedVideoRecord;
}

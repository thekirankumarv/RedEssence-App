import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class PlayMusicRecord extends FirestoreRecord {
  PlayMusicRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "audio_title" field.
  String? _audioTitle;
  String get audioTitle => _audioTitle ?? '';
  bool hasAudioTitle() => _audioTitle != null;

  // "audio_path" field.
  String? _audioPath;
  String get audioPath => _audioPath ?? '';
  bool hasAudioPath() => _audioPath != null;

  // "audio_image" field.
  String? _audioImage;
  String get audioImage => _audioImage ?? '';
  bool hasAudioImage() => _audioImage != null;

  void _initializeFields() {
    _audioTitle = snapshotData['audio_title'] as String?;
    _audioPath = snapshotData['audio_path'] as String?;
    _audioImage = snapshotData['audio_image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('play_music');

  static Stream<PlayMusicRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PlayMusicRecord.fromSnapshot(s));

  static Future<PlayMusicRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PlayMusicRecord.fromSnapshot(s));

  static PlayMusicRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PlayMusicRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PlayMusicRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PlayMusicRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PlayMusicRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PlayMusicRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPlayMusicRecordData({
  String? audioTitle,
  String? audioPath,
  String? audioImage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'audio_title': audioTitle,
      'audio_path': audioPath,
      'audio_image': audioImage,
    }.withoutNulls,
  );

  return firestoreData;
}

class PlayMusicRecordDocumentEquality implements Equality<PlayMusicRecord> {
  const PlayMusicRecordDocumentEquality();

  @override
  bool equals(PlayMusicRecord? e1, PlayMusicRecord? e2) {
    return e1?.audioTitle == e2?.audioTitle &&
        e1?.audioPath == e2?.audioPath &&
        e1?.audioImage == e2?.audioImage;
  }

  @override
  int hash(PlayMusicRecord? e) =>
      const ListEquality().hash([e?.audioTitle, e?.audioPath, e?.audioImage]);

  @override
  bool isValidKey(Object? o) => o is PlayMusicRecord;
}

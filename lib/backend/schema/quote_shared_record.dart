import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class QuoteSharedRecord extends FirestoreRecord {
  QuoteSharedRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "date_uploaded" field.
  DateTime? _dateUploaded;
  DateTime? get dateUploaded => _dateUploaded;
  bool hasDateUploaded() => _dateUploaded != null;

  // "quote_description" field.
  String? _quoteDescription;
  String get quoteDescription => _quoteDescription ?? '';
  bool hasQuoteDescription() => _quoteDescription != null;

  // "quote_title" field.
  String? _quoteTitle;
  String get quoteTitle => _quoteTitle ?? '';
  bool hasQuoteTitle() => _quoteTitle != null;

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
    _quoteDescription = snapshotData['quote_description'] as String?;
    _quoteTitle = snapshotData['quote_title'] as String?;
    _userName = snapshotData['user_name'] as String?;
    _userId = snapshotData['user_id'] as String?;
    _profilePic = snapshotData['profile_pic'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('quote_shared');

  static Stream<QuoteSharedRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuoteSharedRecord.fromSnapshot(s));

  static Future<QuoteSharedRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuoteSharedRecord.fromSnapshot(s));

  static QuoteSharedRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QuoteSharedRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuoteSharedRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuoteSharedRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuoteSharedRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuoteSharedRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuoteSharedRecordData({
  DateTime? dateUploaded,
  String? quoteDescription,
  String? quoteTitle,
  String? userName,
  String? userId,
  String? profilePic,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date_uploaded': dateUploaded,
      'quote_description': quoteDescription,
      'quote_title': quoteTitle,
      'user_name': userName,
      'user_id': userId,
      'profile_pic': profilePic,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuoteSharedRecordDocumentEquality implements Equality<QuoteSharedRecord> {
  const QuoteSharedRecordDocumentEquality();

  @override
  bool equals(QuoteSharedRecord? e1, QuoteSharedRecord? e2) {
    return e1?.dateUploaded == e2?.dateUploaded &&
        e1?.quoteDescription == e2?.quoteDescription &&
        e1?.quoteTitle == e2?.quoteTitle &&
        e1?.userName == e2?.userName &&
        e1?.userId == e2?.userId &&
        e1?.profilePic == e2?.profilePic;
  }

  @override
  int hash(QuoteSharedRecord? e) => const ListEquality().hash([
        e?.dateUploaded,
        e?.quoteDescription,
        e?.quoteTitle,
        e?.userName,
        e?.userId,
        e?.profilePic
      ]);

  @override
  bool isValidKey(Object? o) => o is QuoteSharedRecord;
}

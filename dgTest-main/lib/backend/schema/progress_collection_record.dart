import 'dart:async';
import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';
part 'progress_collection_record.g.dart';

abstract class ProgressCollectionRecord
    implements
        Built<ProgressCollectionRecord, ProgressCollectionRecordBuilder> {
  static Serializer<ProgressCollectionRecord> get serializer =>
      _$progressCollectionRecordSerializer;

  @nullable
  int get nivel;

  @nullable
  int get progreso;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ProgressCollectionRecordBuilder builder) =>
      builder
        ..nivel = 0
        ..progreso = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('progress_collection');

  static Stream<ProgressCollectionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ProgressCollectionRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  ProgressCollectionRecord._();
  factory ProgressCollectionRecord(
          [void Function(ProgressCollectionRecordBuilder) updates]) =
      _$ProgressCollectionRecord;

  static ProgressCollectionRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createProgressCollectionRecordData({
  int nivel,
  int progreso,
}) =>
    serializers.toFirestore(
        ProgressCollectionRecord.serializer,
        ProgressCollectionRecord((p) => p
          ..nivel = nivel
          ..progreso = progreso));

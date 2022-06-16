import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'preguntas_senales_record.g.dart';

abstract class PreguntasSenalesRecord
    implements Built<PreguntasSenalesRecord, PreguntasSenalesRecordBuilder> {
  static Serializer<PreguntasSenalesRecord> get serializer =>
      _$preguntasSenalesRecordSerializer;

  @nullable
  String get explicacion;

  @nullable
  String get pregunta;

  @nullable
  String get recurso;

  @nullable
  String get respuesta1;

  @nullable
  String get respuesta2;

  @nullable
  @BuiltValueField(wireName: 'respuesta_correcta')
  String get respuestaCorrecta;

  @nullable
  int get idu;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(PreguntasSenalesRecordBuilder builder) =>
      builder
        ..explicacion = ''
        ..pregunta = ''
        ..recurso = ''
        ..respuesta1 = ''
        ..respuesta2 = ''
        ..respuestaCorrecta = ''
        ..idu = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('preguntas_senales');

  static Stream<PreguntasSenalesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<PreguntasSenalesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  PreguntasSenalesRecord._();
  factory PreguntasSenalesRecord(
          [void Function(PreguntasSenalesRecordBuilder) updates]) =
      _$PreguntasSenalesRecord;

  static PreguntasSenalesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createPreguntasSenalesRecordData({
  String explicacion,
  String pregunta,
  String recurso,
  String respuesta1,
  String respuesta2,
  String respuestaCorrecta,
  int idu,
}) =>
    serializers.toFirestore(
        PreguntasSenalesRecord.serializer,
        PreguntasSenalesRecord((p) => p
          ..explicacion = explicacion
          ..pregunta = pregunta
          ..recurso = recurso
          ..respuesta1 = respuesta1
          ..respuesta2 = respuesta2
          ..respuestaCorrecta = respuestaCorrecta
          ..idu = idu));

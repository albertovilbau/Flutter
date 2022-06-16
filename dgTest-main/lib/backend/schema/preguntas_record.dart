import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'preguntas_record.g.dart';

abstract class PreguntasRecord
    implements Built<PreguntasRecord, PreguntasRecordBuilder> {
  static Serializer<PreguntasRecord> get serializer =>
      _$preguntasRecordSerializer;

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
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(PreguntasRecordBuilder builder) => builder
    ..explicacion = ''
    ..pregunta = ''
    ..recurso = ''
    ..respuesta1 = ''
    ..respuesta2 = ''
    ..respuestaCorrecta = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('preguntas');

  static Stream<PreguntasRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<PreguntasRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  PreguntasRecord._();
  factory PreguntasRecord([void Function(PreguntasRecordBuilder) updates]) =
      _$PreguntasRecord;

  static PreguntasRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createPreguntasRecordData({
  String explicacion,
  String pregunta,
  String recurso,
  String respuesta1,
  String respuesta2,
  String respuestaCorrecta,
}) =>
    serializers.toFirestore(
        PreguntasRecord.serializer,
        PreguntasRecord((p) => p
          ..explicacion = explicacion
          ..pregunta = pregunta
          ..recurso = recurso
          ..respuesta1 = respuesta1
          ..respuesta2 = respuesta2
          ..respuestaCorrecta = respuestaCorrecta));

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preguntas_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PreguntasRecord> _$preguntasRecordSerializer =
    new _$PreguntasRecordSerializer();

class _$PreguntasRecordSerializer
    implements StructuredSerializer<PreguntasRecord> {
  @override
  final Iterable<Type> types = const [PreguntasRecord, _$PreguntasRecord];
  @override
  final String wireName = 'PreguntasRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, PreguntasRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.explicacion;
    if (value != null) {
      result
        ..add('explicacion')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.pregunta;
    if (value != null) {
      result
        ..add('pregunta')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.recurso;
    if (value != null) {
      result
        ..add('recurso')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.respuesta1;
    if (value != null) {
      result
        ..add('respuesta1')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.respuesta2;
    if (value != null) {
      result
        ..add('respuesta2')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.respuestaCorrecta;
    if (value != null) {
      result
        ..add('respuesta_correcta')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    return result;
  }

  @override
  PreguntasRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PreguntasRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'explicacion':
          result.explicacion = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'pregunta':
          result.pregunta = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'recurso':
          result.recurso = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'respuesta1':
          result.respuesta1 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'respuesta2':
          result.respuesta2 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'respuesta_correcta':
          result.respuestaCorrecta = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
      }
    }

    return result.build();
  }
}

class _$PreguntasRecord extends PreguntasRecord {
  @override
  final String explicacion;
  @override
  final String pregunta;
  @override
  final String recurso;
  @override
  final String respuesta1;
  @override
  final String respuesta2;
  @override
  final String respuestaCorrecta;
  @override
  final DocumentReference<Object> reference;

  factory _$PreguntasRecord([void Function(PreguntasRecordBuilder) updates]) =>
      (new PreguntasRecordBuilder()..update(updates)).build();

  _$PreguntasRecord._(
      {this.explicacion,
      this.pregunta,
      this.recurso,
      this.respuesta1,
      this.respuesta2,
      this.respuestaCorrecta,
      this.reference})
      : super._();

  @override
  PreguntasRecord rebuild(void Function(PreguntasRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PreguntasRecordBuilder toBuilder() =>
      new PreguntasRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PreguntasRecord &&
        explicacion == other.explicacion &&
        pregunta == other.pregunta &&
        recurso == other.recurso &&
        respuesta1 == other.respuesta1 &&
        respuesta2 == other.respuesta2 &&
        respuestaCorrecta == other.respuestaCorrecta &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, explicacion.hashCode), pregunta.hashCode),
                        recurso.hashCode),
                    respuesta1.hashCode),
                respuesta2.hashCode),
            respuestaCorrecta.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PreguntasRecord')
          ..add('explicacion', explicacion)
          ..add('pregunta', pregunta)
          ..add('recurso', recurso)
          ..add('respuesta1', respuesta1)
          ..add('respuesta2', respuesta2)
          ..add('respuestaCorrecta', respuestaCorrecta)
          ..add('reference', reference))
        .toString();
  }
}

class PreguntasRecordBuilder
    implements Builder<PreguntasRecord, PreguntasRecordBuilder> {
  _$PreguntasRecord _$v;

  String _explicacion;
  String get explicacion => _$this._explicacion;
  set explicacion(String explicacion) => _$this._explicacion = explicacion;

  String _pregunta;
  String get pregunta => _$this._pregunta;
  set pregunta(String pregunta) => _$this._pregunta = pregunta;

  String _recurso;
  String get recurso => _$this._recurso;
  set recurso(String recurso) => _$this._recurso = recurso;

  String _respuesta1;
  String get respuesta1 => _$this._respuesta1;
  set respuesta1(String respuesta1) => _$this._respuesta1 = respuesta1;

  String _respuesta2;
  String get respuesta2 => _$this._respuesta2;
  set respuesta2(String respuesta2) => _$this._respuesta2 = respuesta2;

  String _respuestaCorrecta;
  String get respuestaCorrecta => _$this._respuestaCorrecta;
  set respuestaCorrecta(String respuestaCorrecta) =>
      _$this._respuestaCorrecta = respuestaCorrecta;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  PreguntasRecordBuilder() {
    PreguntasRecord._initializeBuilder(this);
  }

  PreguntasRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _explicacion = $v.explicacion;
      _pregunta = $v.pregunta;
      _recurso = $v.recurso;
      _respuesta1 = $v.respuesta1;
      _respuesta2 = $v.respuesta2;
      _respuestaCorrecta = $v.respuestaCorrecta;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PreguntasRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PreguntasRecord;
  }

  @override
  void update(void Function(PreguntasRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PreguntasRecord build() {
    final _$result = _$v ??
        new _$PreguntasRecord._(
            explicacion: explicacion,
            pregunta: pregunta,
            recurso: recurso,
            respuesta1: respuesta1,
            respuesta2: respuesta2,
            respuestaCorrecta: respuestaCorrecta,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

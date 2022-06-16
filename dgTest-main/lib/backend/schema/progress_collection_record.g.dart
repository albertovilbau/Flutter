// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress_collection_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ProgressCollectionRecord> _$progressCollectionRecordSerializer =
    new _$ProgressCollectionRecordSerializer();

class _$ProgressCollectionRecordSerializer
    implements StructuredSerializer<ProgressCollectionRecord> {
  @override
  final Iterable<Type> types = const [
    ProgressCollectionRecord,
    _$ProgressCollectionRecord
  ];
  @override
  final String wireName = 'ProgressCollectionRecord';

  @override
  Iterable<Object> serialize(
      Serializers serializers, ProgressCollectionRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.nivel;
    if (value != null) {
      result
        ..add('nivel')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.progreso;
    if (value != null) {
      result
        ..add('progreso')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
  ProgressCollectionRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProgressCollectionRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'nivel':
          result.nivel = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'progreso':
          result.progreso = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
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

class _$ProgressCollectionRecord extends ProgressCollectionRecord {
  @override
  final int nivel;
  @override
  final int progreso;
  @override
  final DocumentReference<Object> reference;

  factory _$ProgressCollectionRecord(
          [void Function(ProgressCollectionRecordBuilder) updates]) =>
      (new ProgressCollectionRecordBuilder()..update(updates)).build();

  _$ProgressCollectionRecord._({this.nivel, this.progreso, this.reference})
      : super._();

  @override
  ProgressCollectionRecord rebuild(
          void Function(ProgressCollectionRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProgressCollectionRecordBuilder toBuilder() =>
      new ProgressCollectionRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProgressCollectionRecord &&
        nivel == other.nivel &&
        progreso == other.progreso &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, nivel.hashCode), progreso.hashCode), reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ProgressCollectionRecord')
          ..add('nivel', nivel)
          ..add('progreso', progreso)
          ..add('reference', reference))
        .toString();
  }
}

class ProgressCollectionRecordBuilder
    implements
        Builder<ProgressCollectionRecord, ProgressCollectionRecordBuilder> {
  _$ProgressCollectionRecord _$v;

  int _nivel;
  int get nivel => _$this._nivel;
  set nivel(int nivel) => _$this._nivel = nivel;

  int _progreso;
  int get progreso => _$this._progreso;
  set progreso(int progreso) => _$this._progreso = progreso;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  ProgressCollectionRecordBuilder() {
    ProgressCollectionRecord._initializeBuilder(this);
  }

  ProgressCollectionRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _nivel = $v.nivel;
      _progreso = $v.progreso;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProgressCollectionRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProgressCollectionRecord;
  }

  @override
  void update(void Function(ProgressCollectionRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ProgressCollectionRecord build() {
    final _$result = _$v ??
        new _$ProgressCollectionRecord._(
            nivel: nivel, progreso: progreso, reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

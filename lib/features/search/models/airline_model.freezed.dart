// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'airline_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Airline _$AirlineFromJson(Map<String, dynamic> json) {
  return _Airline.fromJson(json);
}

/// @nodoc
mixin _$Airline {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'logo_url')
  String? get logoUrl => throw _privateConstructorUsedError;

  /// Serializes this Airline to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Airline
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AirlineCopyWith<Airline> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AirlineCopyWith<$Res> {
  factory $AirlineCopyWith(Airline value, $Res Function(Airline) then) =
      _$AirlineCopyWithImpl<$Res, Airline>;
  @useResult
  $Res call({int id, String name, @JsonKey(name: 'logo_url') String? logoUrl});
}

/// @nodoc
class _$AirlineCopyWithImpl<$Res, $Val extends Airline>
    implements $AirlineCopyWith<$Res> {
  _$AirlineCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Airline
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? logoUrl = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            logoUrl: freezed == logoUrl
                ? _value.logoUrl
                : logoUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AirlineImplCopyWith<$Res> implements $AirlineCopyWith<$Res> {
  factory _$$AirlineImplCopyWith(
    _$AirlineImpl value,
    $Res Function(_$AirlineImpl) then,
  ) = __$$AirlineImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, @JsonKey(name: 'logo_url') String? logoUrl});
}

/// @nodoc
class __$$AirlineImplCopyWithImpl<$Res>
    extends _$AirlineCopyWithImpl<$Res, _$AirlineImpl>
    implements _$$AirlineImplCopyWith<$Res> {
  __$$AirlineImplCopyWithImpl(
    _$AirlineImpl _value,
    $Res Function(_$AirlineImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Airline
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? logoUrl = freezed,
  }) {
    return _then(
      _$AirlineImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        logoUrl: freezed == logoUrl
            ? _value.logoUrl
            : logoUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AirlineImpl implements _Airline {
  const _$AirlineImpl({
    required this.id,
    required this.name,
    @JsonKey(name: 'logo_url') this.logoUrl,
  });

  factory _$AirlineImpl.fromJson(Map<String, dynamic> json) =>
      _$$AirlineImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  @JsonKey(name: 'logo_url')
  final String? logoUrl;

  @override
  String toString() {
    return 'Airline(id: $id, name: $name, logoUrl: $logoUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AirlineImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, logoUrl);

  /// Create a copy of Airline
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AirlineImplCopyWith<_$AirlineImpl> get copyWith =>
      __$$AirlineImplCopyWithImpl<_$AirlineImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AirlineImplToJson(this);
  }
}

abstract class _Airline implements Airline {
  const factory _Airline({
    required final int id,
    required final String name,
    @JsonKey(name: 'logo_url') final String? logoUrl,
  }) = _$AirlineImpl;

  factory _Airline.fromJson(Map<String, dynamic> json) = _$AirlineImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'logo_url')
  String? get logoUrl;

  /// Create a copy of Airline
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AirlineImplCopyWith<_$AirlineImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

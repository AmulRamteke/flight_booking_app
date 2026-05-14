// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'airport_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Airport _$AirportFromJson(Map<String, dynamic> json) {
  return _Airport.fromJson(json);
}

/// @nodoc
mixin _$Airport {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'airport_code')
  String get code => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;

  /// Serializes this Airport to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Airport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AirportCopyWith<Airport> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AirportCopyWith<$Res> {
  factory $AirportCopyWith(Airport value, $Res Function(Airport) then) =
      _$AirportCopyWithImpl<$Res, Airport>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'airport_code') String code,
    String name,
    String city,
    String country,
  });
}

/// @nodoc
class _$AirportCopyWithImpl<$Res, $Val extends Airport>
    implements $AirportCopyWith<$Res> {
  _$AirportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Airport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? name = null,
    Object? city = null,
    Object? country = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            code: null == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            city: null == city
                ? _value.city
                : city // ignore: cast_nullable_to_non_nullable
                      as String,
            country: null == country
                ? _value.country
                : country // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AirportImplCopyWith<$Res> implements $AirportCopyWith<$Res> {
  factory _$$AirportImplCopyWith(
    _$AirportImpl value,
    $Res Function(_$AirportImpl) then,
  ) = __$$AirportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'airport_code') String code,
    String name,
    String city,
    String country,
  });
}

/// @nodoc
class __$$AirportImplCopyWithImpl<$Res>
    extends _$AirportCopyWithImpl<$Res, _$AirportImpl>
    implements _$$AirportImplCopyWith<$Res> {
  __$$AirportImplCopyWithImpl(
    _$AirportImpl _value,
    $Res Function(_$AirportImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Airport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? name = null,
    Object? city = null,
    Object? country = null,
  }) {
    return _then(
      _$AirportImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        code: null == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        city: null == city
            ? _value.city
            : city // ignore: cast_nullable_to_non_nullable
                  as String,
        country: null == country
            ? _value.country
            : country // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AirportImpl implements _Airport {
  const _$AirportImpl({
    this.id = '',
    @JsonKey(name: 'airport_code') required this.code,
    this.name = '',
    required this.city,
    this.country = '',
  });

  factory _$AirportImpl.fromJson(Map<String, dynamic> json) =>
      _$$AirportImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey(name: 'airport_code')
  final String code;
  @override
  @JsonKey()
  final String name;
  @override
  final String city;
  @override
  @JsonKey()
  final String country;

  @override
  String toString() {
    return 'Airport(id: $id, code: $code, name: $name, city: $city, country: $country)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AirportImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.country, country) || other.country == country));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, code, name, city, country);

  /// Create a copy of Airport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AirportImplCopyWith<_$AirportImpl> get copyWith =>
      __$$AirportImplCopyWithImpl<_$AirportImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AirportImplToJson(this);
  }
}

abstract class _Airport implements Airport {
  const factory _Airport({
    final String id,
    @JsonKey(name: 'airport_code') required final String code,
    final String name,
    required final String city,
    final String country,
  }) = _$AirportImpl;

  factory _Airport.fromJson(Map<String, dynamic> json) = _$AirportImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'airport_code')
  String get code;
  @override
  String get name;
  @override
  String get city;
  @override
  String get country;

  /// Create a copy of Airport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AirportImplCopyWith<_$AirportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

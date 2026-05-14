// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flight_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Flight _$FlightFromJson(Map<String, dynamic> json) {
  return _Flight.fromJson(json);
}

/// @nodoc
mixin _$Flight {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'flight_number')
  String get flightNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'airline_name')
  String get airlineName => throw _privateConstructorUsedError;
  @JsonKey(name: 'airline_logo')
  String get airlineLogo => throw _privateConstructorUsedError;
  FlightLocation get departure => throw _privateConstructorUsedError;
  FlightLocation get arrival => throw _privateConstructorUsedError;
  String get duration => throw _privateConstructorUsedError;
  FlightPrice get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'aircraft_type')
  String? get aircraftType => throw _privateConstructorUsedError;
  int get stops => throw _privateConstructorUsedError;
  String? get terminal => throw _privateConstructorUsedError;
  String? get gate => throw _privateConstructorUsedError;
  @JsonKey(name: 'class')
  String? get flightClass => throw _privateConstructorUsedError;
  List<Passenger>? get passengers => throw _privateConstructorUsedError;

  /// Serializes this Flight to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Flight
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FlightCopyWith<Flight> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlightCopyWith<$Res> {
  factory $FlightCopyWith(Flight value, $Res Function(Flight) then) =
      _$FlightCopyWithImpl<$Res, Flight>;
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'flight_number') String flightNumber,
    @JsonKey(name: 'airline_name') String airlineName,
    @JsonKey(name: 'airline_logo') String airlineLogo,
    FlightLocation departure,
    FlightLocation arrival,
    String duration,
    FlightPrice price,
    @JsonKey(name: 'aircraft_type') String? aircraftType,
    int stops,
    String? terminal,
    String? gate,
    @JsonKey(name: 'class') String? flightClass,
    List<Passenger>? passengers,
  });

  $FlightLocationCopyWith<$Res> get departure;
  $FlightLocationCopyWith<$Res> get arrival;
  $FlightPriceCopyWith<$Res> get price;
}

/// @nodoc
class _$FlightCopyWithImpl<$Res, $Val extends Flight>
    implements $FlightCopyWith<$Res> {
  _$FlightCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Flight
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? flightNumber = null,
    Object? airlineName = null,
    Object? airlineLogo = null,
    Object? departure = null,
    Object? arrival = null,
    Object? duration = null,
    Object? price = null,
    Object? aircraftType = freezed,
    Object? stops = null,
    Object? terminal = freezed,
    Object? gate = freezed,
    Object? flightClass = freezed,
    Object? passengers = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            flightNumber: null == flightNumber
                ? _value.flightNumber
                : flightNumber // ignore: cast_nullable_to_non_nullable
                      as String,
            airlineName: null == airlineName
                ? _value.airlineName
                : airlineName // ignore: cast_nullable_to_non_nullable
                      as String,
            airlineLogo: null == airlineLogo
                ? _value.airlineLogo
                : airlineLogo // ignore: cast_nullable_to_non_nullable
                      as String,
            departure: null == departure
                ? _value.departure
                : departure // ignore: cast_nullable_to_non_nullable
                      as FlightLocation,
            arrival: null == arrival
                ? _value.arrival
                : arrival // ignore: cast_nullable_to_non_nullable
                      as FlightLocation,
            duration: null == duration
                ? _value.duration
                : duration // ignore: cast_nullable_to_non_nullable
                      as String,
            price: null == price
                ? _value.price
                : price // ignore: cast_nullable_to_non_nullable
                      as FlightPrice,
            aircraftType: freezed == aircraftType
                ? _value.aircraftType
                : aircraftType // ignore: cast_nullable_to_non_nullable
                      as String?,
            stops: null == stops
                ? _value.stops
                : stops // ignore: cast_nullable_to_non_nullable
                      as int,
            terminal: freezed == terminal
                ? _value.terminal
                : terminal // ignore: cast_nullable_to_non_nullable
                      as String?,
            gate: freezed == gate
                ? _value.gate
                : gate // ignore: cast_nullable_to_non_nullable
                      as String?,
            flightClass: freezed == flightClass
                ? _value.flightClass
                : flightClass // ignore: cast_nullable_to_non_nullable
                      as String?,
            passengers: freezed == passengers
                ? _value.passengers
                : passengers // ignore: cast_nullable_to_non_nullable
                      as List<Passenger>?,
          )
          as $Val,
    );
  }

  /// Create a copy of Flight
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FlightLocationCopyWith<$Res> get departure {
    return $FlightLocationCopyWith<$Res>(_value.departure, (value) {
      return _then(_value.copyWith(departure: value) as $Val);
    });
  }

  /// Create a copy of Flight
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FlightLocationCopyWith<$Res> get arrival {
    return $FlightLocationCopyWith<$Res>(_value.arrival, (value) {
      return _then(_value.copyWith(arrival: value) as $Val);
    });
  }

  /// Create a copy of Flight
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FlightPriceCopyWith<$Res> get price {
    return $FlightPriceCopyWith<$Res>(_value.price, (value) {
      return _then(_value.copyWith(price: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FlightImplCopyWith<$Res> implements $FlightCopyWith<$Res> {
  factory _$$FlightImplCopyWith(
    _$FlightImpl value,
    $Res Function(_$FlightImpl) then,
  ) = __$$FlightImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'flight_number') String flightNumber,
    @JsonKey(name: 'airline_name') String airlineName,
    @JsonKey(name: 'airline_logo') String airlineLogo,
    FlightLocation departure,
    FlightLocation arrival,
    String duration,
    FlightPrice price,
    @JsonKey(name: 'aircraft_type') String? aircraftType,
    int stops,
    String? terminal,
    String? gate,
    @JsonKey(name: 'class') String? flightClass,
    List<Passenger>? passengers,
  });

  @override
  $FlightLocationCopyWith<$Res> get departure;
  @override
  $FlightLocationCopyWith<$Res> get arrival;
  @override
  $FlightPriceCopyWith<$Res> get price;
}

/// @nodoc
class __$$FlightImplCopyWithImpl<$Res>
    extends _$FlightCopyWithImpl<$Res, _$FlightImpl>
    implements _$$FlightImplCopyWith<$Res> {
  __$$FlightImplCopyWithImpl(
    _$FlightImpl _value,
    $Res Function(_$FlightImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Flight
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? flightNumber = null,
    Object? airlineName = null,
    Object? airlineLogo = null,
    Object? departure = null,
    Object? arrival = null,
    Object? duration = null,
    Object? price = null,
    Object? aircraftType = freezed,
    Object? stops = null,
    Object? terminal = freezed,
    Object? gate = freezed,
    Object? flightClass = freezed,
    Object? passengers = freezed,
  }) {
    return _then(
      _$FlightImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        flightNumber: null == flightNumber
            ? _value.flightNumber
            : flightNumber // ignore: cast_nullable_to_non_nullable
                  as String,
        airlineName: null == airlineName
            ? _value.airlineName
            : airlineName // ignore: cast_nullable_to_non_nullable
                  as String,
        airlineLogo: null == airlineLogo
            ? _value.airlineLogo
            : airlineLogo // ignore: cast_nullable_to_non_nullable
                  as String,
        departure: null == departure
            ? _value.departure
            : departure // ignore: cast_nullable_to_non_nullable
                  as FlightLocation,
        arrival: null == arrival
            ? _value.arrival
            : arrival // ignore: cast_nullable_to_non_nullable
                  as FlightLocation,
        duration: null == duration
            ? _value.duration
            : duration // ignore: cast_nullable_to_non_nullable
                  as String,
        price: null == price
            ? _value.price
            : price // ignore: cast_nullable_to_non_nullable
                  as FlightPrice,
        aircraftType: freezed == aircraftType
            ? _value.aircraftType
            : aircraftType // ignore: cast_nullable_to_non_nullable
                  as String?,
        stops: null == stops
            ? _value.stops
            : stops // ignore: cast_nullable_to_non_nullable
                  as int,
        terminal: freezed == terminal
            ? _value.terminal
            : terminal // ignore: cast_nullable_to_non_nullable
                  as String?,
        gate: freezed == gate
            ? _value.gate
            : gate // ignore: cast_nullable_to_non_nullable
                  as String?,
        flightClass: freezed == flightClass
            ? _value.flightClass
            : flightClass // ignore: cast_nullable_to_non_nullable
                  as String?,
        passengers: freezed == passengers
            ? _value._passengers
            : passengers // ignore: cast_nullable_to_non_nullable
                  as List<Passenger>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FlightImpl implements _Flight {
  const _$FlightImpl({
    required this.id,
    @JsonKey(name: 'flight_number') required this.flightNumber,
    @JsonKey(name: 'airline_name') required this.airlineName,
    @JsonKey(name: 'airline_logo') required this.airlineLogo,
    required this.departure,
    required this.arrival,
    required this.duration,
    required this.price,
    @JsonKey(name: 'aircraft_type') this.aircraftType,
    this.stops = 0,
    this.terminal,
    this.gate,
    @JsonKey(name: 'class') this.flightClass,
    final List<Passenger>? passengers,
  }) : _passengers = passengers;

  factory _$FlightImpl.fromJson(Map<String, dynamic> json) =>
      _$$FlightImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'flight_number')
  final String flightNumber;
  @override
  @JsonKey(name: 'airline_name')
  final String airlineName;
  @override
  @JsonKey(name: 'airline_logo')
  final String airlineLogo;
  @override
  final FlightLocation departure;
  @override
  final FlightLocation arrival;
  @override
  final String duration;
  @override
  final FlightPrice price;
  @override
  @JsonKey(name: 'aircraft_type')
  final String? aircraftType;
  @override
  @JsonKey()
  final int stops;
  @override
  final String? terminal;
  @override
  final String? gate;
  @override
  @JsonKey(name: 'class')
  final String? flightClass;
  final List<Passenger>? _passengers;
  @override
  List<Passenger>? get passengers {
    final value = _passengers;
    if (value == null) return null;
    if (_passengers is EqualUnmodifiableListView) return _passengers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Flight(id: $id, flightNumber: $flightNumber, airlineName: $airlineName, airlineLogo: $airlineLogo, departure: $departure, arrival: $arrival, duration: $duration, price: $price, aircraftType: $aircraftType, stops: $stops, terminal: $terminal, gate: $gate, flightClass: $flightClass, passengers: $passengers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlightImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.flightNumber, flightNumber) ||
                other.flightNumber == flightNumber) &&
            (identical(other.airlineName, airlineName) ||
                other.airlineName == airlineName) &&
            (identical(other.airlineLogo, airlineLogo) ||
                other.airlineLogo == airlineLogo) &&
            (identical(other.departure, departure) ||
                other.departure == departure) &&
            (identical(other.arrival, arrival) || other.arrival == arrival) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.aircraftType, aircraftType) ||
                other.aircraftType == aircraftType) &&
            (identical(other.stops, stops) || other.stops == stops) &&
            (identical(other.terminal, terminal) ||
                other.terminal == terminal) &&
            (identical(other.gate, gate) || other.gate == gate) &&
            (identical(other.flightClass, flightClass) ||
                other.flightClass == flightClass) &&
            const DeepCollectionEquality().equals(
              other._passengers,
              _passengers,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    flightNumber,
    airlineName,
    airlineLogo,
    departure,
    arrival,
    duration,
    price,
    aircraftType,
    stops,
    terminal,
    gate,
    flightClass,
    const DeepCollectionEquality().hash(_passengers),
  );

  /// Create a copy of Flight
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FlightImplCopyWith<_$FlightImpl> get copyWith =>
      __$$FlightImplCopyWithImpl<_$FlightImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FlightImplToJson(this);
  }
}

abstract class _Flight implements Flight {
  const factory _Flight({
    required final int id,
    @JsonKey(name: 'flight_number') required final String flightNumber,
    @JsonKey(name: 'airline_name') required final String airlineName,
    @JsonKey(name: 'airline_logo') required final String airlineLogo,
    required final FlightLocation departure,
    required final FlightLocation arrival,
    required final String duration,
    required final FlightPrice price,
    @JsonKey(name: 'aircraft_type') final String? aircraftType,
    final int stops,
    final String? terminal,
    final String? gate,
    @JsonKey(name: 'class') final String? flightClass,
    final List<Passenger>? passengers,
  }) = _$FlightImpl;

  factory _Flight.fromJson(Map<String, dynamic> json) = _$FlightImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'flight_number')
  String get flightNumber;
  @override
  @JsonKey(name: 'airline_name')
  String get airlineName;
  @override
  @JsonKey(name: 'airline_logo')
  String get airlineLogo;
  @override
  FlightLocation get departure;
  @override
  FlightLocation get arrival;
  @override
  String get duration;
  @override
  FlightPrice get price;
  @override
  @JsonKey(name: 'aircraft_type')
  String? get aircraftType;
  @override
  int get stops;
  @override
  String? get terminal;
  @override
  String? get gate;
  @override
  @JsonKey(name: 'class')
  String? get flightClass;
  @override
  List<Passenger>? get passengers;

  /// Create a copy of Flight
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FlightImplCopyWith<_$FlightImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FlightLocation _$FlightLocationFromJson(Map<String, dynamic> json) {
  return _FlightLocation.fromJson(json);
}

/// @nodoc
mixin _$FlightLocation {
  String get time => throw _privateConstructorUsedError;
  @JsonKey(name: 'airport_code')
  String get airportCode => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;

  /// Serializes this FlightLocation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FlightLocation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FlightLocationCopyWith<FlightLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlightLocationCopyWith<$Res> {
  factory $FlightLocationCopyWith(
    FlightLocation value,
    $Res Function(FlightLocation) then,
  ) = _$FlightLocationCopyWithImpl<$Res, FlightLocation>;
  @useResult
  $Res call({
    String time,
    @JsonKey(name: 'airport_code') String airportCode,
    String city,
  });
}

/// @nodoc
class _$FlightLocationCopyWithImpl<$Res, $Val extends FlightLocation>
    implements $FlightLocationCopyWith<$Res> {
  _$FlightLocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FlightLocation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? airportCode = null,
    Object? city = null,
  }) {
    return _then(
      _value.copyWith(
            time: null == time
                ? _value.time
                : time // ignore: cast_nullable_to_non_nullable
                      as String,
            airportCode: null == airportCode
                ? _value.airportCode
                : airportCode // ignore: cast_nullable_to_non_nullable
                      as String,
            city: null == city
                ? _value.city
                : city // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FlightLocationImplCopyWith<$Res>
    implements $FlightLocationCopyWith<$Res> {
  factory _$$FlightLocationImplCopyWith(
    _$FlightLocationImpl value,
    $Res Function(_$FlightLocationImpl) then,
  ) = __$$FlightLocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String time,
    @JsonKey(name: 'airport_code') String airportCode,
    String city,
  });
}

/// @nodoc
class __$$FlightLocationImplCopyWithImpl<$Res>
    extends _$FlightLocationCopyWithImpl<$Res, _$FlightLocationImpl>
    implements _$$FlightLocationImplCopyWith<$Res> {
  __$$FlightLocationImplCopyWithImpl(
    _$FlightLocationImpl _value,
    $Res Function(_$FlightLocationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FlightLocation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? airportCode = null,
    Object? city = null,
  }) {
    return _then(
      _$FlightLocationImpl(
        time: null == time
            ? _value.time
            : time // ignore: cast_nullable_to_non_nullable
                  as String,
        airportCode: null == airportCode
            ? _value.airportCode
            : airportCode // ignore: cast_nullable_to_non_nullable
                  as String,
        city: null == city
            ? _value.city
            : city // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FlightLocationImpl implements _FlightLocation {
  const _$FlightLocationImpl({
    required this.time,
    @JsonKey(name: 'airport_code') required this.airportCode,
    required this.city,
  });

  factory _$FlightLocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$FlightLocationImplFromJson(json);

  @override
  final String time;
  @override
  @JsonKey(name: 'airport_code')
  final String airportCode;
  @override
  final String city;

  @override
  String toString() {
    return 'FlightLocation(time: $time, airportCode: $airportCode, city: $city)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlightLocationImpl &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.airportCode, airportCode) ||
                other.airportCode == airportCode) &&
            (identical(other.city, city) || other.city == city));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, time, airportCode, city);

  /// Create a copy of FlightLocation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FlightLocationImplCopyWith<_$FlightLocationImpl> get copyWith =>
      __$$FlightLocationImplCopyWithImpl<_$FlightLocationImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$FlightLocationImplToJson(this);
  }
}

abstract class _FlightLocation implements FlightLocation {
  const factory _FlightLocation({
    required final String time,
    @JsonKey(name: 'airport_code') required final String airportCode,
    required final String city,
  }) = _$FlightLocationImpl;

  factory _FlightLocation.fromJson(Map<String, dynamic> json) =
      _$FlightLocationImpl.fromJson;

  @override
  String get time;
  @override
  @JsonKey(name: 'airport_code')
  String get airportCode;
  @override
  String get city;

  /// Create a copy of FlightLocation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FlightLocationImplCopyWith<_$FlightLocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FlightPrice _$FlightPriceFromJson(Map<String, dynamic> json) {
  return _FlightPrice.fromJson(json);
}

/// @nodoc
mixin _$FlightPrice {
  double get amount => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;

  /// Serializes this FlightPrice to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FlightPrice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FlightPriceCopyWith<FlightPrice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlightPriceCopyWith<$Res> {
  factory $FlightPriceCopyWith(
    FlightPrice value,
    $Res Function(FlightPrice) then,
  ) = _$FlightPriceCopyWithImpl<$Res, FlightPrice>;
  @useResult
  $Res call({double amount, String currency});
}

/// @nodoc
class _$FlightPriceCopyWithImpl<$Res, $Val extends FlightPrice>
    implements $FlightPriceCopyWith<$Res> {
  _$FlightPriceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FlightPrice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? amount = null, Object? currency = null}) {
    return _then(
      _value.copyWith(
            amount: null == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                      as double,
            currency: null == currency
                ? _value.currency
                : currency // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FlightPriceImplCopyWith<$Res>
    implements $FlightPriceCopyWith<$Res> {
  factory _$$FlightPriceImplCopyWith(
    _$FlightPriceImpl value,
    $Res Function(_$FlightPriceImpl) then,
  ) = __$$FlightPriceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double amount, String currency});
}

/// @nodoc
class __$$FlightPriceImplCopyWithImpl<$Res>
    extends _$FlightPriceCopyWithImpl<$Res, _$FlightPriceImpl>
    implements _$$FlightPriceImplCopyWith<$Res> {
  __$$FlightPriceImplCopyWithImpl(
    _$FlightPriceImpl _value,
    $Res Function(_$FlightPriceImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FlightPrice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? amount = null, Object? currency = null}) {
    return _then(
      _$FlightPriceImpl(
        amount: null == amount
            ? _value.amount
            : amount // ignore: cast_nullable_to_non_nullable
                  as double,
        currency: null == currency
            ? _value.currency
            : currency // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FlightPriceImpl implements _FlightPrice {
  const _$FlightPriceImpl({required this.amount, required this.currency});

  factory _$FlightPriceImpl.fromJson(Map<String, dynamic> json) =>
      _$$FlightPriceImplFromJson(json);

  @override
  final double amount;
  @override
  final String currency;

  @override
  String toString() {
    return 'FlightPrice(amount: $amount, currency: $currency)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlightPriceImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, amount, currency);

  /// Create a copy of FlightPrice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FlightPriceImplCopyWith<_$FlightPriceImpl> get copyWith =>
      __$$FlightPriceImplCopyWithImpl<_$FlightPriceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FlightPriceImplToJson(this);
  }
}

abstract class _FlightPrice implements FlightPrice {
  const factory _FlightPrice({
    required final double amount,
    required final String currency,
  }) = _$FlightPriceImpl;

  factory _FlightPrice.fromJson(Map<String, dynamic> json) =
      _$FlightPriceImpl.fromJson;

  @override
  double get amount;
  @override
  String get currency;

  /// Create a copy of FlightPrice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FlightPriceImplCopyWith<_$FlightPriceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Passenger _$PassengerFromJson(Map<String, dynamic> json) {
  return _Passenger.fromJson(json);
}

/// @nodoc
mixin _$Passenger {
  @JsonKey(name: 'passenger_number')
  int get passengerNumber => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get seat => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_picture')
  String? get profilePicture => throw _privateConstructorUsedError;

  /// Serializes this Passenger to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Passenger
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PassengerCopyWith<Passenger> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PassengerCopyWith<$Res> {
  factory $PassengerCopyWith(Passenger value, $Res Function(Passenger) then) =
      _$PassengerCopyWithImpl<$Res, Passenger>;
  @useResult
  $Res call({
    @JsonKey(name: 'passenger_number') int passengerNumber,
    String title,
    String name,
    String seat,
    @JsonKey(name: 'profile_picture') String? profilePicture,
  });
}

/// @nodoc
class _$PassengerCopyWithImpl<$Res, $Val extends Passenger>
    implements $PassengerCopyWith<$Res> {
  _$PassengerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Passenger
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? passengerNumber = null,
    Object? title = null,
    Object? name = null,
    Object? seat = null,
    Object? profilePicture = freezed,
  }) {
    return _then(
      _value.copyWith(
            passengerNumber: null == passengerNumber
                ? _value.passengerNumber
                : passengerNumber // ignore: cast_nullable_to_non_nullable
                      as int,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            seat: null == seat
                ? _value.seat
                : seat // ignore: cast_nullable_to_non_nullable
                      as String,
            profilePicture: freezed == profilePicture
                ? _value.profilePicture
                : profilePicture // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PassengerImplCopyWith<$Res>
    implements $PassengerCopyWith<$Res> {
  factory _$$PassengerImplCopyWith(
    _$PassengerImpl value,
    $Res Function(_$PassengerImpl) then,
  ) = __$$PassengerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'passenger_number') int passengerNumber,
    String title,
    String name,
    String seat,
    @JsonKey(name: 'profile_picture') String? profilePicture,
  });
}

/// @nodoc
class __$$PassengerImplCopyWithImpl<$Res>
    extends _$PassengerCopyWithImpl<$Res, _$PassengerImpl>
    implements _$$PassengerImplCopyWith<$Res> {
  __$$PassengerImplCopyWithImpl(
    _$PassengerImpl _value,
    $Res Function(_$PassengerImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Passenger
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? passengerNumber = null,
    Object? title = null,
    Object? name = null,
    Object? seat = null,
    Object? profilePicture = freezed,
  }) {
    return _then(
      _$PassengerImpl(
        passengerNumber: null == passengerNumber
            ? _value.passengerNumber
            : passengerNumber // ignore: cast_nullable_to_non_nullable
                  as int,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        seat: null == seat
            ? _value.seat
            : seat // ignore: cast_nullable_to_non_nullable
                  as String,
        profilePicture: freezed == profilePicture
            ? _value.profilePicture
            : profilePicture // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PassengerImpl implements _Passenger {
  const _$PassengerImpl({
    @JsonKey(name: 'passenger_number') required this.passengerNumber,
    required this.title,
    required this.name,
    required this.seat,
    @JsonKey(name: 'profile_picture') this.profilePicture,
  });

  factory _$PassengerImpl.fromJson(Map<String, dynamic> json) =>
      _$$PassengerImplFromJson(json);

  @override
  @JsonKey(name: 'passenger_number')
  final int passengerNumber;
  @override
  final String title;
  @override
  final String name;
  @override
  final String seat;
  @override
  @JsonKey(name: 'profile_picture')
  final String? profilePicture;

  @override
  String toString() {
    return 'Passenger(passengerNumber: $passengerNumber, title: $title, name: $name, seat: $seat, profilePicture: $profilePicture)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PassengerImpl &&
            (identical(other.passengerNumber, passengerNumber) ||
                other.passengerNumber == passengerNumber) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.seat, seat) || other.seat == seat) &&
            (identical(other.profilePicture, profilePicture) ||
                other.profilePicture == profilePicture));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    passengerNumber,
    title,
    name,
    seat,
    profilePicture,
  );

  /// Create a copy of Passenger
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PassengerImplCopyWith<_$PassengerImpl> get copyWith =>
      __$$PassengerImplCopyWithImpl<_$PassengerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PassengerImplToJson(this);
  }
}

abstract class _Passenger implements Passenger {
  const factory _Passenger({
    @JsonKey(name: 'passenger_number') required final int passengerNumber,
    required final String title,
    required final String name,
    required final String seat,
    @JsonKey(name: 'profile_picture') final String? profilePicture,
  }) = _$PassengerImpl;

  factory _Passenger.fromJson(Map<String, dynamic> json) =
      _$PassengerImpl.fromJson;

  @override
  @JsonKey(name: 'passenger_number')
  int get passengerNumber;
  @override
  String get title;
  @override
  String get name;
  @override
  String get seat;
  @override
  @JsonKey(name: 'profile_picture')
  String? get profilePicture;

  /// Create a copy of Passenger
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PassengerImplCopyWith<_$PassengerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

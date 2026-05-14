// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FlightImpl _$$FlightImplFromJson(Map<String, dynamic> json) => _$FlightImpl(
  id: (json['id'] as num).toInt(),
  flightNumber: json['flight_number'] as String,
  airlineName: json['airline_name'] as String,
  airlineLogo: json['airline_logo'] as String,
  departure: FlightLocation.fromJson(json['departure'] as Map<String, dynamic>),
  arrival: FlightLocation.fromJson(json['arrival'] as Map<String, dynamic>),
  duration: json['duration'] as String,
  price: FlightPrice.fromJson(json['price'] as Map<String, dynamic>),
  aircraftType: json['aircraft_type'] as String?,
  stops: (json['stops'] as num?)?.toInt() ?? 0,
  terminal: json['terminal'] as String?,
  gate: json['gate'] as String?,
  flightClass: json['class'] as String?,
  passengers: (json['passengers'] as List<dynamic>?)
      ?.map((e) => Passenger.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$FlightImplToJson(_$FlightImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'flight_number': instance.flightNumber,
      'airline_name': instance.airlineName,
      'airline_logo': instance.airlineLogo,
      'departure': instance.departure,
      'arrival': instance.arrival,
      'duration': instance.duration,
      'price': instance.price,
      'aircraft_type': instance.aircraftType,
      'stops': instance.stops,
      'terminal': instance.terminal,
      'gate': instance.gate,
      'class': instance.flightClass,
      'passengers': instance.passengers,
    };

_$FlightLocationImpl _$$FlightLocationImplFromJson(Map<String, dynamic> json) =>
    _$FlightLocationImpl(
      time: json['time'] as String,
      airportCode: json['airport_code'] as String,
      city: json['city'] as String,
    );

Map<String, dynamic> _$$FlightLocationImplToJson(
  _$FlightLocationImpl instance,
) => <String, dynamic>{
  'time': instance.time,
  'airport_code': instance.airportCode,
  'city': instance.city,
};

_$FlightPriceImpl _$$FlightPriceImplFromJson(Map<String, dynamic> json) =>
    _$FlightPriceImpl(
      amount: (json['amount'] as num).toDouble(),
      currency: json['currency'] as String,
    );

Map<String, dynamic> _$$FlightPriceImplToJson(_$FlightPriceImpl instance) =>
    <String, dynamic>{'amount': instance.amount, 'currency': instance.currency};

_$PassengerImpl _$$PassengerImplFromJson(Map<String, dynamic> json) =>
    _$PassengerImpl(
      passengerNumber: (json['passenger_number'] as num).toInt(),
      title: json['title'] as String,
      name: json['name'] as String,
      seat: json['seat'] as String,
      profilePicture: json['profile_picture'] as String?,
    );

Map<String, dynamic> _$$PassengerImplToJson(_$PassengerImpl instance) =>
    <String, dynamic>{
      'passenger_number': instance.passengerNumber,
      'title': instance.title,
      'name': instance.name,
      'seat': instance.seat,
      'profile_picture': instance.profilePicture,
    };

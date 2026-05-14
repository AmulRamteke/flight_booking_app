// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'flight_model.freezed.dart';
part 'flight_model.g.dart';

@freezed
class Flight with _$Flight {
  const factory Flight({
    required int id,
    @JsonKey(name: 'flight_number') required String flightNumber,
    @JsonKey(name: 'airline_name') required String airlineName,
    @JsonKey(name: 'airline_logo') required String airlineLogo,
    required FlightLocation departure,
    required FlightLocation arrival,
    required String duration,
    required FlightPrice price,
    @JsonKey(name: 'aircraft_type') String? aircraftType,
    @Default(0) int stops,
    String? terminal,
    String? gate,
    @JsonKey(name: 'class') String? flightClass,
    List<Passenger>? passengers,
  }) = _Flight;

  factory Flight.fromJson(Map<String, dynamic> json) => _$FlightFromJson(json);
}

@freezed
class FlightLocation with _$FlightLocation {
  const factory FlightLocation({
    required String time,
    @JsonKey(name: 'airport_code') required String airportCode,
    required String city,
  }) = _FlightLocation;

  factory FlightLocation.fromJson(Map<String, dynamic> json) => _$FlightLocationFromJson(json);
}

@freezed
class FlightPrice with _$FlightPrice {
  const factory FlightPrice({
    required double amount,
    required String currency,
  }) = _FlightPrice;

  factory FlightPrice.fromJson(Map<String, dynamic> json) => _$FlightPriceFromJson(json);
}

@freezed
class Passenger with _$Passenger {
  const factory Passenger({
    @JsonKey(name: 'passenger_number') required int passengerNumber,
    required String title,
    required String name,
    required String seat,
    @JsonKey(name: 'profile_picture') String? profilePicture,
  }) = _Passenger;

  factory Passenger.fromJson(Map<String, dynamic> json) => _$PassengerFromJson(json);
}

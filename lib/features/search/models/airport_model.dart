import 'package:freezed_annotation/freezed_annotation.dart';

part 'airport_model.freezed.dart';
part 'airport_model.g.dart';

@freezed
class Airport with _$Airport {
  const factory Airport({
    @Default('') String id,
    @JsonKey(name: 'airport_code') required String code,
    @Default('') String name,
    required String city,
    @Default('') String country,
  }) = _Airport;

  factory Airport.fromJson(Map<String, dynamic> json) => _$AirportFromJson(json);
}

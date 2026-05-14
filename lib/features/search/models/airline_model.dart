import 'package:freezed_annotation/freezed_annotation.dart';

part 'airline_model.freezed.dart';
part 'airline_model.g.dart';

@freezed
class Airline with _$Airline {
  const factory Airline({
    required int id,
    required String name,
    @JsonKey(name: 'logo_url') String? logoUrl,
  }) = _Airline;

  factory Airline.fromJson(Map<String, dynamic> json) => _$AirlineFromJson(json);
}

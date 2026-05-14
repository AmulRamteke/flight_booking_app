import 'package:freezed_annotation/freezed_annotation.dart';

part 'aircraft_type_model.freezed.dart';
part 'aircraft_type_model.g.dart';

@freezed
class AircraftType with _$AircraftType {
  const factory AircraftType({
    required int id,
    required String name,
    required String code,
    String? manufacturer,
  }) = _AircraftType;

  factory AircraftType.fromJson(Map<String, dynamic> json) => _$AircraftTypeFromJson(json);
}

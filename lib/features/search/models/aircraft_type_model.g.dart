// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aircraft_type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AircraftTypeImpl _$$AircraftTypeImplFromJson(Map<String, dynamic> json) =>
    _$AircraftTypeImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      code: json['code'] as String,
      manufacturer: json['manufacturer'] as String?,
    );

Map<String, dynamic> _$$AircraftTypeImplToJson(_$AircraftTypeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'manufacturer': instance.manufacturer,
    };

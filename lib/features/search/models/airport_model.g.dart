// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'airport_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AirportImpl _$$AirportImplFromJson(Map<String, dynamic> json) =>
    _$AirportImpl(
      id: json['id'] as String? ?? '',
      code: json['airport_code'] as String,
      name: json['name'] as String? ?? '',
      city: json['city'] as String,
      country: json['country'] as String? ?? '',
    );

Map<String, dynamic> _$$AirportImplToJson(_$AirportImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'airport_code': instance.code,
      'name': instance.name,
      'city': instance.city,
      'country': instance.country,
    };

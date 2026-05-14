// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'airline_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AirlineImpl _$$AirlineImplFromJson(Map<String, dynamic> json) =>
    _$AirlineImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      logoUrl: json['logo_url'] as String?,
    );

Map<String, dynamic> _$$AirlineImplToJson(_$AirlineImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo_url': instance.logoUrl,
    };

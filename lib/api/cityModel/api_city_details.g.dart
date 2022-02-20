// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_city_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityDetails _$CityDetailsFromJson(Map<String, dynamic> json) => CityDetails(
      id: json['id'] as int?,
      stateId: json['state_id'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$CityDetailsToJson(CityDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'state_id': instance.stateId,
      'name': instance.name,
    };

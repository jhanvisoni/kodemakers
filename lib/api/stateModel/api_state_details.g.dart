// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_state_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StateDetails _$StateDetailsFromJson(Map<String, dynamic> json) => StateDetails()
  ..id = json['id'] as int?
  ..countryId = json['country_id'] as int?
  ..name = json['name'] as String?;

Map<String, dynamic> _$StateDetailsToJson(StateDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'country_id': instance.countryId,
      'name': instance.name,
    };

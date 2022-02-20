// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_user_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

USerDetails _$USerDetailsFromJson(Map<String, dynamic> json) => USerDetails(
      name: json['name'] as String?,
      stateId: json['state_id'] as int?,
      id: json['id'] as int?,
      state: json['state'] as String?,
      city: json['city'] as String?,
      cityId: json['city_id'] as int?,
    )..imgUrl = json['img_url'] as String?;

Map<String, dynamic> _$USerDetailsToJson(USerDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'img_url': instance.imgUrl,
      'state_id': instance.stateId,
      'state': instance.state,
      'city_id': instance.cityId,
      'city': instance.city,
    };

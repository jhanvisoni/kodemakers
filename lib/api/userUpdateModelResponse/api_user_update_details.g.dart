// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_user_update_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserUpadteDetails _$UserUpadteDetailsFromJson(Map<String, dynamic> json) =>
    UserUpadteDetails(
      name: json['name'] as String?,
      stateId: json['state_id'] as String?,
      id: json['id'] as int?,
      state: json['state'] as String?,
      city: json['city'] as String?,
      cityId: json['city_id'] as String?,
    )..imgUrl = json['img_url'] as String?;

Map<String, dynamic> _$UserUpadteDetailsToJson(UserUpadteDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'img_url': instance.imgUrl,
      'state_id': instance.stateId,
      'state': instance.state,
      'city_id': instance.cityId,
      'city': instance.city,
    };

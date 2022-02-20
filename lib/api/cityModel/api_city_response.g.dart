// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_city_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityResponse _$CityResponseFromJson(Map<String, dynamic> json) => CityResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CityDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$CityResponseToJson(CityResponse instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'message': instance.message,
      'status': instance.status,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_state_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StateResponse _$StateResponseFromJson(Map<String, dynamic> json) =>
    StateResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => StateDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$StateResponseToJson(StateResponse instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'message': instance.message,
      'status': instance.status,
    };

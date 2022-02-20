// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_user_update_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserUpadateResponse _$UserUpadateResponseFromJson(Map<String, dynamic> json) =>
    UserUpadateResponse()
      ..data = json['data'] == null
          ? null
          : UserUpadteDetails.fromJson(json['data'] as Map<String, dynamic>)
      ..message = json['message'] as String?
      ..status = json['status'] as String?;

Map<String, dynamic> _$UserUpadateResponseToJson(
        UserUpadateResponse instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
      'message': instance.message,
      'status': instance.status,
    };

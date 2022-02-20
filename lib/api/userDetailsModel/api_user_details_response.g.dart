// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_user_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetailsResponse _$UserDetailsResponseFromJson(Map<String, dynamic> json) =>
    UserDetailsResponse()
      ..data = json['data'] == null
          ? null
          : USerDetails.fromJson(json['data'] as Map<String, dynamic>)
      ..message = json['message'] as String?
      ..status = json['status'] as String?;

Map<String, dynamic> _$UserDetailsResponseToJson(
        UserDetailsResponse instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
      'message': instance.message,
      'status': instance.status,
    };

import 'package:json_annotation/json_annotation.dart';
import 'package:kodemakers/api/userDetailsModel/api_user_details.dart';

part 'api_user_details_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class UserDetailsResponse {
  @JsonKey(name: 'data')
  USerDetails? data;

  @JsonKey(name: 'message')
  String? message;

  @JsonKey(name: 'status')
  String? status;

  UserDetailsResponse();

  factory UserDetailsResponse.fromJson(Map<String, dynamic> json) {
    return _$UserDetailsResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserDetailsResponseToJson(this);
}

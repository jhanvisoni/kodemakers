import 'package:json_annotation/json_annotation.dart';
import 'package:kodemakers/api/userUpdateModelResponse/api_user_update_details.dart';

part 'api_user_update_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class UserUpadateResponse {
  @JsonKey(name: 'data')
  UserUpadteDetails? data;

  @JsonKey(name: 'message')
  String? message;

  @JsonKey(name: 'status')
  String? status;
  UserUpadateResponse();

  factory UserUpadateResponse.fromJson(Map<String, dynamic> json) {
    return _$UserUpadateResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserUpadateResponseToJson(this);
}

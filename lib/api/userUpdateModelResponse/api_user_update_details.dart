import 'package:json_annotation/json_annotation.dart';

part 'api_user_update_details.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class UserUpadteDetails {
  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'img_url')
  String? imgUrl;

  @JsonKey(name: 'state_id')
  String? stateId;

  @JsonKey(name: 'state')
  String? state;

  @JsonKey(name: 'city_id')
  String? cityId;

  @JsonKey(name: 'city')
  String? city;

  UserUpadteDetails(
      {this.name, this.stateId, this.id, this.state, this.city, this.cityId});

  factory UserUpadteDetails.fromJson(Map<String, dynamic> json) {
    return _$UserUpadteDetailsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserUpadteDetailsToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

part 'api_user_details.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class USerDetails {
  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'img_url')
  String? imgUrl;

  @JsonKey(name: 'state_id')
  int? stateId;

  @JsonKey(name: 'state')
  String? state;

  @JsonKey(name: 'city_id')
  int? cityId;

  @JsonKey(name: 'city')
  String? city;

  USerDetails(
      {this.name, this.stateId, this.id, this.state, this.city, this.cityId});

  factory USerDetails.fromJson(Map<String, dynamic> json) {
    return _$USerDetailsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$USerDetailsToJson(this);
}

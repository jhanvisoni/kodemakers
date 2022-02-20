import 'package:json_annotation/json_annotation.dart';

part 'api_city_details.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class CityDetails {
  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'state_id')
  int? stateId;

  @JsonKey(name: 'name')
  String? name;

  CityDetails({this.id, this.stateId, this.name});

  factory CityDetails.fromJson(Map<String, dynamic> json) {
    return _$CityDetailsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CityDetailsToJson(this);
}

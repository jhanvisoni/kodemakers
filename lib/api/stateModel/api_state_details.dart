import 'package:json_annotation/json_annotation.dart';

part 'api_state_details.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class StateDetails {
  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'country_id')
  int? countryId;

  @JsonKey(name: 'name')
  String? name;

  StateDetails();

  factory StateDetails.fromJson(Map<String, dynamic> json) {
    return _$StateDetailsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$StateDetailsToJson(this);
}

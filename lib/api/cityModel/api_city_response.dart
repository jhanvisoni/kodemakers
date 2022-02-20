import 'package:json_annotation/json_annotation.dart';
import 'package:kodemakers/api/cityModel/api_city_details.dart';

part 'api_city_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class CityResponse {
  @JsonKey(name: 'data')
  List<CityDetails>? data;

  @JsonKey(name: 'message')
  String? message;

  @JsonKey(name: 'status')
  String? status;

  CityResponse({this.data, this.status, this.message});

  factory CityResponse.fromJson(Map<String, dynamic> json) {
    return _$CityResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CityResponseToJson(this);
}

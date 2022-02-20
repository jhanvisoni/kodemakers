import 'package:json_annotation/json_annotation.dart';
import 'package:kodemakers/api/stateModel/api_state_details.dart';

part 'api_state_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class StateResponse {
  @JsonKey(name: 'data')
  List<StateDetails>? data;

  @JsonKey(name: 'message')
  String? message;

  @JsonKey(name: 'status')
  String? status;
  StateResponse({this.data, this.status, this.message});

  factory StateResponse.fromJson(Map<String, dynamic> json) {
    return _$StateResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$StateResponseToJson(this);
}

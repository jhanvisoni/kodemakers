import 'dart:io';

import 'package:dio/dio.dart';
import 'package:kodemakers/api/stateModel/api_state_response.dart';
import 'package:kodemakers/api/userDetailsModel/api_user_details_response.dart';
import 'package:kodemakers/api/userUpdateModelResponse/api_user_update_response.dart';
import 'package:kodemakers/constants/endpoint.dart';
import 'package:retrofit/http.dart';

import '../constants/app_constants.dart';

part 'retrofit_service.g.dart';

@RestApi(baseUrl: baseUrl) // dev
abstract class RetrofitService {
  factory RetrofitService(Dio dio, {String baseUrl}) = _RetrofitService;

  /// returns state
  @FormUrlEncoded()
  @GET(epState)
  Future<StateResponse> stateList();

  /// returns user details
  @FormUrlEncoded()
  @GET(epGetUserDetails)
  Future<UserDetailsResponse> userDetails();

  /// update user data
  @FormUrlEncoded()
  @POST(epUpdateUserDetails)
  Future<UserUpadateResponse> updateDataWithoutImage(@Body() dynamic body);

  /// update user data with profile picture using multipart
  @POST(epUpdateUserDetails)
  @MultiPart()
  Future<UserUpadateResponse> updateProfile(
    @Part(name: 'name') String? name,
    @Part(name: 'city_name') String? cityName,
    @Part(name: 'city_id') int? cityId,
    @Part(name: 'state_name') String? stateName,
    @Part(name: 'state_id') int? stateId,
    @Part(name: 'profile_image') File profileImage,
  );
}

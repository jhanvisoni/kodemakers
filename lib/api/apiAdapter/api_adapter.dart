import 'dart:io';

import 'package:dio/dio.dart';
import 'package:kodemakers/api/stateModel/api_state_response.dart';
import 'package:kodemakers/api/userDetailsModel/api_user_details_response.dart';
import 'package:kodemakers/api/userUpdateModelResponse/api_user_update_response.dart';
import 'package:kodemakers/services/retrofit_service.dart';

class ApiAdapter {
  late RetrofitService _retrofitService;
  final dio = Dio();

  ApiAdapter() {
    dio.options.connectTimeout = 20000;
    dio.options.receiveTimeout = 20000;
    _retrofitService = RetrofitService(dio);
  }

  Future<StateResponse> getStateResponse() {
    return _retrofitService.stateList();
  }

  Future<UserDetailsResponse> getUserDetailsResponse() {
    return _retrofitService.userDetails();
  }

  Future<UserUpadateResponse> updateProfileData({required dynamic body}) {
    return _retrofitService.updateDataWithoutImage(body);
  }

  Future<UserUpadateResponse> updateUserDetails({
    required String name,
    required String cityName,
    required int cityId,
    required String stateName,
    required int stateId,
    required File profileImage,
  }) {
    return _retrofitService.updateProfile(
        name, cityName, cityId, stateName, stateId, profileImage);
  }
}

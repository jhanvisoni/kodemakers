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
    // todo: comment this out in production

    // dio.interceptors.add(
    //   PrettyDioLogger(
    //     requestHeader: true,
    //     requestBody: true,
    //     responseHeader: true,
    //   ),
    // );

    // dio.interceptors.add(
    //   RetryInterceptor(
    //     requestRetry: DioConnectivityRequestRetry(
    //       dio: dio,
    //       connectivity: Connectivity(),
    //     ),
    //   ),
    // );

    // dio.interceptors.add(
    //   InterceptorsWrapper(
    //     onRequest: (RequestOptions options) async {
    //       // set the token
    //       SharedPreferences prefs = await SharedPreferences.getInstance();
    //       String token = prefs.getString(KEY_USER_TOKEN) ?? '';
    //
    //       if (token.isNotEmpty) {
    //         // print("TOKEN NetworkCommon :$token");
    //         //options.headers["Authorizations"] = "Bearer " + token;
    //       }
    //       return options;
    //     },
    //   ),
    // );
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

  /// update user details
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

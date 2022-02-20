// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'retrofit_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RetrofitService implements RetrofitService {
  _RetrofitService(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://kodemakers.com/kodemakers.com/interview/api/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<StateResponse> stateList() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<StateResponse>(Options(
                method: 'GET',
                headers: _headers,
                extra: _extra,
                contentType: 'application/x-www-form-urlencoded')
            .compose(_dio.options, 'states',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = StateResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<UserDetailsResponse> userDetails() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UserDetailsResponse>(Options(
                method: 'GET',
                headers: _headers,
                extra: _extra,
                contentType: 'application/x-www-form-urlencoded')
            .compose(_dio.options, 'users/detail',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UserDetailsResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<UserUpadateResponse> updateDataWithoutImage(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = body;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UserUpadateResponse>(Options(
                method: 'POST',
                headers: _headers,
                extra: _extra,
                contentType: 'application/x-www-form-urlencoded')
            .compose(_dio.options, 'users/update',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UserUpadateResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<UserUpadateResponse> updateProfile(
      name, cityName, cityId, stateName, stateId, profileImage) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    if (name != null) {
      _data.fields.add(MapEntry('name', name));
    }
    if (cityName != null) {
      _data.fields.add(MapEntry('city_name', cityName));
    }
    if (cityId != null) {
      _data.fields.add(MapEntry('city_id', cityId.toString()));
    }
    if (stateName != null) {
      _data.fields.add(MapEntry('state_name', stateName));
    }
    if (stateId != null) {
      _data.fields.add(MapEntry('state_id', stateId.toString()));
    }
    _data.files.add(MapEntry(
        'profile_image',
        MultipartFile.fromFileSync(profileImage.path,
            filename: profileImage.path.split(Platform.pathSeparator).last)));
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UserUpadateResponse>(Options(
                method: 'POST',
                headers: _headers,
                extra: _extra,
                contentType: 'multipart/form-data')
            .compose(_dio.options, 'users/update',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UserUpadateResponse.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}

import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kodemakers/api/apiAdapter/api_adapter.dart';
import 'package:kodemakers/api/cityModel/api_city_details.dart';
import 'package:kodemakers/api/stateModel/api_state_details.dart';
import 'package:kodemakers/api/stateModel/api_state_response.dart';
import 'package:kodemakers/api/userDetailsModel/api_user_details.dart';
import 'package:kodemakers/api/userDetailsModel/api_user_details_response.dart';
import 'package:kodemakers/api/userUpdateModelResponse/api_user_update_response.dart';

import '../api/cityModel/api_city_response.dart';
import '../components/app_dialog.dart';
import '../constants/app_constants.dart';
import '../constants/endpoint.dart';

class ProfileController extends GetxController {
  final nameController = TextEditingController();
  final stateController = TextEditingController();
  final cityController = TextEditingController();

  var selectedState = ''.obs;
  var selectedCity = ''.obs;
  var ProfilePic = ''.obs;

  var isLoading = true.obs;
  var isSubmitting = false.obs;

  var stateList = <StateDetails>[].obs;
  var cityList = <CityDetails>[].obs;

  late USerDetails userData;
  final apiAdapter = ApiAdapter();

  final imagePicker = ImagePicker();
  var selectedImagePath = ''.obs;

  final client = Dio();
  late File image;
  @override
  Future<void> onInit() async {
    await getUserData();
    await fetchSate();
    super.onInit();
  }

  Future<void> fetchSate() async {
    StateResponse response = await apiAdapter.getStateResponse();
    stateList.assignAll(response.data!);
  }

  ///returns City data
  Future<void> getCityList({required int stateCode}) async {
    var baseURL = baseUrl + epCity + '/?state_id=$stateCode';
    var response = await client.get(baseURL);
    CityResponse cityResponse = CityResponse.fromJson(response.data);
    cityList.assignAll(cityResponse.data!);
  }

  void updateState(
      {required String currentState, required int stateCode}) async {
    selectedState.value = currentState;
    stateController.text = currentState;
    cityController.text = '';
    getCityList(stateCode: stateCode);
  }

  void updateCity({required String currentState}) async {
    selectedCity.value = currentState;
    cityController.text = currentState;
  }

  ///returns User data
  Future<void> getUserData() async {
    isLoading.value = true;
    UserDetailsResponse response = await apiAdapter.getUserDetailsResponse();
    isLoading.value = false;

    userData = response.data!;
    nameController.text = userData.name!;
    stateController.text = userData.state!;
    cityController.text = userData.city!;
    ProfilePic.value = userData.imgUrl!;

    updateState(stateCode: userData.stateId!, currentState: userData.state!);
    updateCity(currentState: userData.city!);
  }

  Future<void> getImagePicker({required ImageSource source}) async {
    var pickedFile =
        await imagePicker.pickImage(source: source, imageQuality: 50);

    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
    }
  }

  Future<void> onSubmitButtonClicked() async {
    var name = nameController.text;
    var city = cityController.text;
    var cityId = userData.cityId;
    var state = stateController.text;
    var stateId = userData.stateId;
    var selectedImage = selectedImagePath.value;
    var file = File(selectedImage);

    if (nameController.text.isEmpty) {
      return AppDialog.showErrorDialog(title: 'Please enter name');
    }
    if (stateController.text.isEmpty) {
      return AppDialog.showErrorDialog(title: 'Please select state');
    }
    if (cityController.text.isEmpty) {
      return AppDialog.showErrorDialog(title: 'Please select city');
    }

    isSubmitting.value = true;
    late UserUpadateResponse response; // this is the correct way of doing this.
    if (selectedImagePath.value.isEmpty) {
      response = await _updateWithoutImage(
          name: name,
          cityName: city,
          cityId: cityId!,
          stateName: state,
          stateId: stateId!);
      isSubmitting.value = false;
      AppDialog.showErrorDialog(
        description: response.message!,
        onPressed: () {
          Get.back();
          Get.back();
        },
        buttonText: 'Okay',
      );
      print("RRRRR${response.message}");
    } else {
      response = await _updateProfile(
          name: name,
          cityName: city,
          cityId: cityId!,
          stateName: state,
          stateId: stateId!,
          profileImage: file);
      isSubmitting.value = false;
      AppDialog.showErrorDialog(
        description: response.message!,
        onPressed: () {
          //Go.to(const ProfilePage());
          Get.back();
          Get.back();
        },
        buttonText: 'Okay',
      );
    }
  }

  Future<UserUpadateResponse> _updateProfile({
    required String name,
    required String cityName,
    required int cityId,
    required String stateName,
    required int stateId,
    required File profileImage,
  }) async {
    late UserUpadateResponse response;
    try {
      response = await apiAdapter.updateUserDetails(
          name: name,
          cityId: cityId,
          cityName: cityName,
          stateId: stateId,
          stateName: stateName,
          profileImage: profileImage);
    } on DioError catch (e) {
      log(e.message);
    }
    return response;
  }

  Future<UserUpadateResponse> _updateWithoutImage({
    required String name,
    required String cityName,
    required int cityId,
    required String stateName,
    required int stateId,
  }) async {
    late UserUpadateResponse response;
    try {
      response = await apiAdapter.updateProfileData(body: {
        "name": name,
        "city_name": cityName,
        "city_id": cityId,
        "state_name": stateName,
        "state_id": stateId
      });
    } on DioError catch (e) {
      log(e.message);
    }
    return response;
  }
}

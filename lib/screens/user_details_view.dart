import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kodemakers/components/app_bottom_sheet_body.dart';
import 'package:kodemakers/components/app_bottom_sheet_item.dart';
import 'package:kodemakers/components/profile_picture.dart';
import 'package:kodemakers/controller/profile_controller.dart';

import '../components/app_textfield.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());

    return WillPopScope(
      onWillPop: () {
        if (!controller.isSubmitting.value) {
          Get.back(result: true);
          return Future.value(true);
        }
        return Future.value(false);
      },
      child: SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: const Text(
                "USER DETAILS",
                style: TextStyle(color: Colors.white),
              ),
              centerTitle: true,
            ),
            body: Obx(() {
              return controller.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: Colors.black,
                    ))
                  : SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 50.h,
                          ),
                          Center(
                            child: InkWell(
                              onTap: () {
                                showImagePickerSheet(
                                    controller: controller, context: context);
                              },
                              child: Container(
                                  height: 150.h,
                                  width: 150.h,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: const Color(0xffAEAEAE),
                                      ),
                                      shape: BoxShape.circle),
                                  child: ProfilePicture(
                                    height: 150.h,
                                    width: 150.h,
                                    borderRadius: 8 * 20.r,
                                    onTap: () {
                                      showImagePickerSheet(
                                          context: context,
                                          controller: controller);
                                    },
                                  )),
                            ),
                          ),
                          //Spacer(),

                          AppEditText(
                            titleText: 'Full Name',
                            hintText: 'Enter your name',
                            controller: controller.nameController,
                            keyboardType: TextInputType.name,
                          ),
                          AppEditTextWithIcon(
                            titleText: 'State',
                            hintText: 'Select your state',
                            controller: controller.stateController,
                            keyboardType: TextInputType.name,
                            iconPath: "",
                            readOnly: true,
                            onIconPress: () {
                              showStateBottomSheet(
                                  controller: controller, context: context);
                            },
                          ),
                          AppEditTextWithIcon(
                            titleText: 'City',
                            hintText: 'Select your city',
                            controller: controller.cityController,
                            keyboardType: TextInputType.name,
                            iconPath: "",
                            readOnly: true,
                            onIconPress: () {
                              showCityBottomSheet(
                                  controller: controller, context: context);
                            },
                          ),
                          SizedBox(
                            height: 55.h,
                          ),
                          Obx(() {
                            return controller.isSubmitting.value
                                ? const CircularProgressIndicator(
                                    color: Colors.black,
                                  )
                                : RaisedButton(
                                    onPressed: () {
                                      controller.onSubmitButtonClicked();
                                    },
                                    color: Colors.black,
                                    child: const Text(
                                      "UPDATE",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  );
                          })
                        ],
                      ),
                    );
            })),
      ),
    );
  }

  /// show city bottom sheet
  dynamic showStateBottomSheet(
      {required BuildContext context, required ProfileController controller}) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      builder: (context) {
        return BottomSheetBody(
          height: 350.h,
          title: 'Select State',
          content: Obx(() {
            var stateList = controller.stateList;
            return stateList.isNotEmpty
                ? ListView(
                    children: [
                      for (var i = 0; i < stateList.length; i++)
                        BottomSheetItem(
                          text: stateList[i].name!,
                          tileColor: i % 2 == 0
                              ? Colors.white
                              : Colors.grey.withOpacity(0.1),
                          onTap: () {
                            controller.updateState(
                                currentState: stateList[i].name!,
                                stateCode: stateList[i].id!);
                            Get.back();
                          },
                        ),
                    ],
                  )
                : const Text('No State Found');
          }),
        );
      },
    );
  }

  dynamic showCityBottomSheet(
      {required BuildContext context, required ProfileController controller}) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      builder: (context) {
        return BottomSheetBody(
          height: 350,
          title: 'Select City',
          content: Obx(() {
            var cityList = controller.cityList;
            return cityList.isNotEmpty
                ? ListView(
                    children: [
                      for (var i = 0; i < cityList.length; i++)
                        BottomSheetItem(
                          text: cityList[i].name!,
                          tileColor: i % 2 == 0
                              ? Colors.white
                              : Colors.grey.withOpacity(0.1),
                          onTap: () {
                            controller.updateCity(
                              currentState: cityList[i].name!,
                            );
                            Get.back();
                          },
                        ),
                    ],
                  )
                : const Text('No State Found');
          }),
        );
      },
    );
  }

  dynamic showImagePickerSheet(
      {required BuildContext context, required ProfileController controller}) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return BottomSheetBody(
          height: 150,
          title: 'Select Profile Picture',
          shrinkWrap: true,
          content: ListView(
            shrinkWrap: true,
            children: [
              BottomSheetItem(
                text: 'Photo Library',
                onTap: () {
                  controller.getImagePicker(source: ImageSource.gallery);
                  Get.back();
                },
              ),
              BottomSheetItem(
                text: 'Camera',
                tileColor: Colors.white,
                onTap: () {
                  controller.getImagePicker(source: ImageSource.camera);
                  Get.back();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kinjalprofiledemo/model/user_details_model.dart';
import 'package:kinjalprofiledemo/routes/routes.dart';
import 'package:kinjalprofiledemo/utils/sessionmanager.dart';

class EditProfileController extends GetxController {
  File? image;
  RxString profileImg = ''.obs;
  final picker = ImagePicker();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final skillsController = TextEditingController();
  final exprienceController = TextEditingController();

  UserDetailsModel userDetails = Get.arguments;

  @override
  void onInit() {
    super.onInit();
    getUserDetails();
  }

  getUserDetails() {
    nameController.text = userDetails.name ?? '';
    emailController.text = userDetails.email ?? '';
    skillsController.text =
        userDetails.skills!.contains('[') || userDetails.skills!.contains(']')
            ? userDetails.skills
                    ?.replaceAll('[', '')
                    .replaceAll(']', '')
                    .replaceAll(' ', '') ??
                ''
            : userDetails.skills ?? '';
    exprienceController.text = userDetails.exprience ?? '';
    profileImg.value = userDetails.image ?? '';
  }

  Future saveData() async {
    var response = UserDetailsModel(
        name: nameController.text,
        email: emailController.text,
        skills: skillsController.text,
        exprience: exprienceController.text,
        image: profileImg.value);
    print('check image ${profileImg.value}');
    await SessionManager.saveUserDetails(response).then((value) {
      Get.snackbar(
        "Success",
        'Profile Updated Successfully',
      );
      Get.offNamed(AppRoutes.home, arguments: 1);
    });
  }
}

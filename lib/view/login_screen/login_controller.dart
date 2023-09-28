import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kinjalprofiledemo/model/login_model.dart';
import 'package:kinjalprofiledemo/routes/routes.dart';
import 'package:kinjalprofiledemo/utils/sessionmanager.dart';

class LoginController extends GetxController {
  RxBool remenberMe = false.obs;
  final emailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();
  RxBool isVisible = false.obs;
  final formKey = GlobalKey<FormState>();
  String editedEmail = '';
  String password = '';

  @override
  void onInit() {
    getLoginResponse();
    super.onInit();
  }

  getLoginResponse() async {
    await SessionManager.getLoginResponse().then((value) async {
      passwordTextEditingController.text = value?.password ?? '';
      password = value?.password ?? '';
      remenberMe.value = value?.rememberMe == 'true';
      await SessionManager.getUserDetails().then((user) {
        if (user != null) {
          emailTextEditingController.text =
              value?.rememberMe == 'true' ? user.email ?? '' : '';
          editedEmail = user.email ?? '';
        } else {
          emailTextEditingController.text =
              value?.rememberMe == 'true' ? value?.email ?? '' : '';
        }
      });
    });
  }

  Future saveData() async {
    print('remenberMe: herer $remenberMe');
    var response = LoginModel(
        email: remenberMe.value == true
            ? emailTextEditingController.text
            : emailTextEditingController.text,
        password:
            remenberMe.value == true ? passwordTextEditingController.text : '',
        rememberMe:
            remenberMe.value == true ? remenberMe.value.toString() : 'false');
    await SessionManager.setLoginResponse(response);
  }

  navigateTo() async {
    if (editedEmail == '' &&
        passwordTextEditingController.text != '' &&
        emailTextEditingController.text != '') {
      print('check>>>>102');
      await saveData();
      Get.offAllNamed(AppRoutes.home,
          arguments: emailTextEditingController.text);
    } else if (emailTextEditingController.text == editedEmail ||
        passwordTextEditingController.text == password) {
      print('check>>>>103');
      await saveData();
      Get.offAllNamed(AppRoutes.home,
          arguments: emailTextEditingController.text);
    } else {
      Get.snackbar(
        "Error",
        'Invalid Email or Password',
      );
    }
  }
}

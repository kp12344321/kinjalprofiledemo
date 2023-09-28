import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kinjalprofiledemo/components/my_form_field.dart';
import 'package:kinjalprofiledemo/components/my_regular_text.dart';
import 'package:kinjalprofiledemo/components/mybutton.dart';
import 'package:kinjalprofiledemo/utils/colors.dart';
import 'package:kinjalprofiledemo/utils/sizer_utills/sizer_utils.dart';
import 'package:kinjalprofiledemo/view/login_screen/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController loginController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Form(
        key: loginController.formKey,
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.width_5_5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MyRegularText(
                  label: "Login",
                  align: TextAlign.center,
                  fontWeight: FontWeight.w800,
                  fontSize: AppFontSize.size_26,
                  color: primaryBlue,
                ),
                SizedBox(
                  height: AppSizes.height_8,
                ),
                MyFormField(
                  controller: loginController.emailTextEditingController,
                  labelText: 'Email',
                  prefixIconUnderLine: const Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Icon(
                      Icons.email_outlined,
                      color: greyColor,
                    ),
                  ),
                  textInputType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Email is required';
                    }
                    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: AppSizes.height_2_5,
                ),
                MyFormField(
                  controller: loginController.passwordTextEditingController,
                  labelText: 'Password',
                  prefixIconUnderLine: const Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Icon(
                      Icons.lock_outline,
                      color: greyColor,
                    ),
                  ),
                  suffixIcon: GestureDetector(
                      onTap: () {
                        loginController.isVisible.value =
                            !loginController.isVisible.value;
                        setState(() {});
                      },
                      child: Icon(
                        loginController.isVisible.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: primaryBlue,
                      )),
                  textInputType: TextInputType.text,
                  obscureText: !loginController.isVisible.value,
                  validator: (PassCurrentValue) {
                    RegExp regex = RegExp(
                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,15}$');
                    var passNonNullValue = PassCurrentValue ?? "";
                    if (passNonNullValue.isEmpty) {
                      return ("Password is required");
                    } else if (!regex.hasMatch(passNonNullValue)) {
                      return "Password must contain at least 8 characters, one \nuppercase letter, one lowercase letter, one number \nand one special character";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: AppSizes.height_1_5,
                ),
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                        side: const BorderSide(
                          color: Colors.grey,
                        ),
                        activeColor: Colors.white,
                        checkColor: Colors.blue,
                        value: loginController.remenberMe.value,
                        onChanged: (bool? value) async {
                          loginController.remenberMe.value = value!;
                          print('value: $value');
                        },
                      ),
                    ),
                    MyRegularText(
                      label: "Remember Me?",
                      fontWeight: FontWeight.w500,
                      fontSize: AppFontSize.size_14,
                    )
                  ],
                ),
                SizedBox(
                  height: AppSizes.height_5,
                ),
                MyButton(
                  onTap: () async {
                    if (loginController.formKey.currentState!.validate()) {
                      loginController.formKey.currentState?.save();
                      await loginController.navigateTo();
                    }
                  },
                  btntext: "Login",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

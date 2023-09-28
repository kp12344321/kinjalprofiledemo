import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kinjalprofiledemo/components/my_common_container.dart';
import 'package:kinjalprofiledemo/components/my_form_field.dart';
import 'package:kinjalprofiledemo/components/mybutton.dart';
import 'package:kinjalprofiledemo/components/utilimagepicker.dart';
import 'package:kinjalprofiledemo/routes/routes.dart';
import 'package:kinjalprofiledemo/utils/colors.dart';
import 'package:kinjalprofiledemo/utils/sizer_utills/sizer_utils.dart';
import 'package:kinjalprofiledemo/view/edit_profile_screen/edit_profile_controller.dart';

import '../../components/my_regular_text.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  EditProfileController editProfileController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    editProfileController.getUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: WillPopScope(
        onWillPop: () {
          return showAlertDialog(context);
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.width_5_5),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: AppSizes.height_6,
                ),
                MyRegularText(
                  label: "Edit profile",
                  align: TextAlign.center,
                  fontWeight: FontWeight.w800,
                  fontSize: AppFontSize.size_20,
                  color: primaryTextColor,
                ),
                SizedBox(
                  height: AppSizes.height_6,
                ),
                GestureDetector(
                  onTap: () {
                    bottomSheet(context);
                  },
                  child: Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        MyCommnonContainer(
                            // color: Colors.yellow,
                            height: AppSizes.height_14,
                            width: AppSizes.height_14,
                            borderRadius: AppSizes.height_60,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  AppSizes.height_60,
                                ),
                                child: Obx(
                                  () =>
                                      editProfileController.profileImg.value !=
                                              ''
                                          ? Image.file(
                                              File(editProfileController
                                                  .profileImg.value),
                                              fit: BoxFit.cover,
                                            )
                                          : Image.network(
                                              'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
                                              fit: BoxFit.cover,
                                            ),
                                ))),
                        Positioned(
                          right: AppSizes.width_2,
                          bottom: 0,
                          child: Icon(Icons.edit,
                              color: primaryBlue, size: AppSizes.height_3_7),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: AppSizes.height_2_8,
                ),
                MyRegularText(
                  label: "Name:",
                  align: TextAlign.center,
                  fontWeight: FontWeight.w700,
                  fontSize: AppFontSize.size_14,
                  color: primaryBlue,
                ),
                SizedBox(
                  height: AppSizes.height_1,
                ),
                MyFormField(
                  controller: editProfileController.nameController,
                  labelText: 'name',
                  textInputType: TextInputType.text,
                ),
                SizedBox(
                  height: AppSizes.height_2_5,
                ),
                MyRegularText(
                  label: "Email:",
                  align: TextAlign.center,
                  fontWeight: FontWeight.w700,
                  fontSize: AppFontSize.size_14,
                  color: primaryBlue,
                ),
                SizedBox(
                  height: AppSizes.height_1,
                ),
                MyFormField(
                  controller: editProfileController.emailController,
                  labelText: 'email',
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: AppSizes.height_3,
                ),
                MyRegularText(
                  label: "Skills:",
                  align: TextAlign.center,
                  fontWeight: FontWeight.w700,
                  fontSize: AppFontSize.size_14,
                  color: primaryBlue,
                ),
                SizedBox(
                  height: AppSizes.height_1,
                ),
                MyFormField(
                  controller: editProfileController.skillsController,
                  labelText: 'Skills',
                  textInputType: TextInputType.text,
                ),
                SizedBox(
                  height: AppSizes.height_3,
                ),
                MyRegularText(
                  label: "Work Experience:",
                  align: TextAlign.center,
                  fontWeight: FontWeight.w700,
                  fontSize: AppFontSize.size_14,
                  color: primaryBlue,
                ),
                SizedBox(
                  height: AppSizes.height_1,
                ),
                MyFormField(
                  controller: editProfileController.exprienceController,
                  labelText: 'exprience',
                  textInputType: TextInputType.text,
                ),
                SizedBox(
                  height: AppSizes.height_4,
                ),
                MyButton(
                  onTap: () async {
                    await editProfileController.saveData();
                  },
                  btntext: "Save",
                )
              ]),
        ),
      ),
    ));
  }

  bottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (widgetBuilder) =>
            bottomSheetForSelectionFile(context, (File selectedFile) {
              print("imagefile ${selectedFile.path}");
              if (selectedFile != null) {
                print("imagefile ${selectedFile.path}");
                editProfileController.image = selectedFile;
                editProfileController.profileImg.value = selectedFile.path;
              }
            }));
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child:
          const Text("Don't Save", style: TextStyle(color: primaryTextColor)),
      onPressed: () {
        Navigator.pop(context);
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: const Text("Save", style: TextStyle(color: primaryBlue)),
      onPressed: () {
        editProfileController.saveData();
        Get.offAllNamed(AppRoutes.home);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text(
        "Alert",
        style: TextStyle(fontSize: 20, color: primaryBlue),
      ),
      content: const Text("Do you want to save changes to profile?",
          style: TextStyle(fontSize: 16, color: primaryTextColor)),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

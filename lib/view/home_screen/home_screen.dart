import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kinjalprofiledemo/components/my_common_container.dart';
import 'package:kinjalprofiledemo/components/my_regular_text.dart';
import 'package:kinjalprofiledemo/components/mybutton.dart';
import 'package:kinjalprofiledemo/routes/routes.dart';
import 'package:kinjalprofiledemo/utils/colors.dart';
import 'package:kinjalprofiledemo/utils/sizer_utills/sizer_utils.dart';
import 'package:kinjalprofiledemo/view/home_screen/home_controller.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  HomeController homeController = Get.find();

  @override
  void initState() {
    super.initState();
    homeController.getUserDetails();
  }

  @override
  void dispose() {
    super.dispose();
    homeController.skills.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.width_5_5),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: AppSizes.height_6,
              ),
              GestureDetector(
                onTap: () {
                  showAlertDialog(context);
                },
                child: Align(
                  alignment: Alignment.centerRight,
                  child: MyCommnonContainer(
                      height: AppSizes.height_6,
                      width: AppSizes.height_6,
                      borderRadius: AppSizes.height_8,
                      child: Icon(
                        Icons.logout,
                        color: primaryYellow,
                        size: AppSizes.height_3_2,
                      )),
                ),
              ),
              MyRegularText(
                label: "Hello, ${wishings()}",
                align: TextAlign.center,
                fontWeight: FontWeight.w800,
                fontSize: AppFontSize.size_20,
                color: primaryTextColor,
              ),
              SizedBox(
                height: AppSizes.height_6,
              ),
              Center(
                child: MyCommnonContainer(
                    // color: Colors.yellow,
                    height: AppSizes.height_14,
                    width: AppSizes.height_14,
                    borderRadius: AppSizes.height_60,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          AppSizes.height_60,
                        ),
                        child: Obx(
                          () => homeController.profileImg.value.isNotEmpty
                              ? Image.file(
                                  File(homeController.profileImg.value),
                                  fit: BoxFit.cover,
                                )
                              : Image.network(
                                  'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
                                  fit: BoxFit.cover,
                                ),
                        ))),
              ),
              SizedBox(
                height: AppSizes.height_2_8,
              ),
              MyRegularText(
                label: "Name:",
                align: TextAlign.center,
                fontWeight: FontWeight.w700,
                fontSize: AppFontSize.size_15,
                color: primaryBlue,
              ),
              SizedBox(
                height: AppSizes.height_1,
              ),
              Obx(
                () => MyRegularText(
                  label: homeController.username.value,
                  align: TextAlign.center,
                  fontWeight: FontWeight.w700,
                  fontSize: AppFontSize.size_16,
                  color: primaryTextColor,
                ),
              ),
              SizedBox(
                height: AppSizes.height_3,
              ),
              MyRegularText(
                label: "Email:",
                align: TextAlign.center,
                fontWeight: FontWeight.w700,
                fontSize: AppFontSize.size_15,
                color: primaryBlue,
              ),
              SizedBox(
                height: AppSizes.height_1,
              ),
              Obx(
                () => MyRegularText(
                  label: homeController.email.value,
                  align: TextAlign.center,
                  fontWeight: FontWeight.w700,
                  fontSize: AppFontSize.size_16,
                  color: primaryTextColor,
                ),
              ),
              SizedBox(
                height: AppSizes.height_3,
              ),
              MyRegularText(
                label: "Skills:",
                align: TextAlign.center,
                fontWeight: FontWeight.w700,
                fontSize: AppFontSize.size_15,
                color: primaryBlue,
              ),
              SizedBox(
                height: AppSizes.height_1,
              ),
              Obx(
                () => Wrap(
                  spacing: 5,
                  direction: Axis.horizontal,
                  children: widgetList(),
                ),
              ),
              SizedBox(
                height: AppSizes.height_3,
              ),
              MyRegularText(
                label: "Work Experience:",
                align: TextAlign.center,
                fontWeight: FontWeight.w700,
                fontSize: AppFontSize.size_15,
                color: primaryBlue,
              ),
              SizedBox(
                height: AppSizes.height_1,
              ),
              Obx(
                () => MyRegularText(
                  label:
                      "${homeController.workExprience.value} ${homeController.workExprience.value == '1' ? 'Year' : 'Years'} ",
                  align: TextAlign.center,
                  fontWeight: FontWeight.w700,
                  fontSize: AppFontSize.size_16,
                  color: primaryTextColor,
                ),
              ),
              SizedBox(
                height: AppSizes.height_4,
              ),
              MyButton(
                onTap: () async {
                  homeController.navigateTo();
                },
                btntext: "Edit Profile",
              )
            ]),
      ),
    ));
  }

  String? wishings() {
    var hours = DateTime.now();
    print('print hours ${hours.hour}');
    if (hours.hour < 12 && hours.hour >= 5) {
      return 'Good Morning';
    } else if (hours.hour < 18 && hours.hour >= 12) {
      return 'Good Afternoon';
    } else if (hours.hour >= 18 && hours.hour < 20) {
      return 'Good Evening';
    } else {
      return 'Good Night';
    }
  }

  List<Widget> widgetList() {
    return List<Widget>.generate(
      growable: true,
      homeController.skills.length,
      (int idx) {
        return ChoiceChip(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.width_3),
            backgroundColor: primaryBlue,
            label: MyRegularText(
              label: homeController.skills[idx],
              color: primaryYellow,
              align: TextAlign.center,
              fontWeight: FontWeight.w500,
              fontSize: AppFontSize.size_13,
            ),
            selected: homeController.tags == idx,
            onSelected: (bool selected) {});
      },
    ).toList();
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: const Text("Cancel", style: TextStyle(color: primaryTextColor)),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: const Text("Logout ", style: TextStyle(color: primaryBlue)),
      onPressed: () {
        Get.offAllNamed(AppRoutes.login);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text(
        "Alert",
        style: TextStyle(fontSize: 20, color: primaryBlue),
      ),
      content: const Text("Are you sure want to logout ?",
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

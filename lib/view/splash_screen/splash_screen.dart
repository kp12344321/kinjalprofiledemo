import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kinjalprofiledemo/components/my_common_container.dart';
import 'package:kinjalprofiledemo/components/my_regular_text.dart';
import 'package:kinjalprofiledemo/routes/routes.dart';
import 'package:kinjalprofiledemo/utils/colors.dart';
import 'package:kinjalprofiledemo/utils/sizer_utills/sizer_utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = const Duration(seconds: 6);
    return Timer(duration, navigationPage);
  }

  navigationPage() {
    Get.offAllNamed(AppRoutes.login);
  }

  @override
  Widget build(BuildContext context) {
    return MyCommnonContainer(
      image: const DecorationImage(
          image: AssetImage("assets/images/splash_back.webp"),
          fit: BoxFit.cover),
      child: MyCommnonContainer(
        color: blackColor.withOpacity(0.76),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyRegularText(
                label: "Welcome To",
                fontWeight: FontWeight.w700,
                fontSize: AppFontSize.size_20,
                color: primaryBlue,
              ),
              SizedBox(
                height: AppSizes.height_1_5,
              ),
              MyRegularText(
                label: "MyProfile",
                fontWeight: FontWeight.w700,
                fontSize: AppFontSize.size_32,
                color: primaryYellow,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

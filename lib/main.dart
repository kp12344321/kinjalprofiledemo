import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kinjalprofiledemo/general_binding/common_binding.dart';
import 'package:kinjalprofiledemo/routes/routes.dart';
import 'package:kinjalprofiledemo/utils/common_hight_width.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      AppDimensions.createInstance(context, SizerUtil.boxConstraints);
      AppDimensions.instance!.orientation =
          AppDimensions.update(context, SizerUtil.boxConstraints).orientation;
      AppDimensions.instance!.height =
          AppDimensions.update(context, SizerUtil.boxConstraints).height;
      AppDimensions.instance!.width =
          AppDimensions.update(context, SizerUtil.boxConstraints).width;
      return GetMaterialApp(
        getPages: AppRoutes.genratedRoutes,
        initialRoute: AppRoutes.splash,
        themeMode: ThemeMode.system,
        initialBinding: CommonBinding(),
        debugShowCheckedModeBanner: false,
      );
    });
  }
}

import 'package:flutter/material.dart';
import 'package:kinjalprofiledemo/components/my_common_container.dart';
import 'package:kinjalprofiledemo/components/my_regular_text.dart';
import 'package:kinjalprofiledemo/utils/colors.dart';
import 'package:kinjalprofiledemo/utils/common_hight_width.dart';
import 'package:kinjalprofiledemo/utils/sizer_utills/sizer_utils.dart';

class MyButton extends StatelessWidget {
  final GestureTapCallback? onTap;
  final String? btntext;
  final BorderRadiusGeometry? borderRadius;
  final Color? color;

  const MyButton(
      {this.onTap,
      this.borderRadius,
      required this.btntext,
      this.color,
      Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: MyCommnonContainer(
        width: AppDimensions.instance!.width,
        gradient: LinearGradient(
          colors: [primaryBlue, primaryYellow],
          begin: Alignment.topLeft, //begin of the gradient color
          end: Alignment.bottomRight,
        ),
        color: color ?? blackColor,
        borderRadius: 10,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 10.0, vertical: AppSizes.height_2),
          child: MyRegularText(
            label: btntext.toString(),
            fontSize: AppFontSize.size_15,
            color: whiteColor,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

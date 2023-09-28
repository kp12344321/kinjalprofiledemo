import 'package:flutter/material.dart';
import 'package:kinjalprofiledemo/utils/colors.dart';

import 'sizer_utills/sizer_utils.dart';

class DecorationUtils {
  BuildContext context;

  DecorationUtils(this.context);

  InputDecoration getUnderlineInputDecoration({
    String? labelText = "",
    bool isRequire = false,
    bool isEnable = true,
    final Color? enableColor,
    final Color? disabledColor,
    bool? alignLabelWithHint,
    final Color? focusedColor,
    final Color? labelTextColor,
    final FloatingLabelBehavior? floatingLabelBehavior,
    icon,
    final Widget? prefixIcon,
    final Widget? suffixIcon,
    final BorderRadius? borderRadius,
    final Color? fillColor,
    final Color? hintColor,
    final EdgeInsetsGeometry? contentPadding,
  }) {
    return InputDecoration(
      fillColor: isRequire ? fillColor ?? Colors.white : Colors.white,
      filled: (isEnable) ? true : true,
      alignLabelWithHint: alignLabelWithHint,
      suffixIcon: suffixIcon,
      icon: icon,
      border: InputBorder.none,
      prefixIcon: prefixIcon,
      contentPadding: contentPadding ??
          EdgeInsets.symmetric(horizontal: 8.0, vertical: AppSizes.height_2),
      labelText: labelText,
      counterText: "",
      labelStyle: TextStyle(
        color: labelTextColor ?? greyColor,
        fontSize: 18,
      ),
      hintStyle: TextStyle(
        color: hintColor ?? greyColor,
        fontSize: 18,
      ),
      floatingLabelBehavior:
          floatingLabelBehavior ?? FloatingLabelBehavior.never,
      enabledBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: enableColor ?? primaryIconColor, width: 1.5),
        borderRadius: borderRadius ?? BorderRadius.circular(10.0),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: disabledColor ?? primaryIconColor, width: 1.5),
        borderRadius: borderRadius ?? BorderRadius.circular(10.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: focusedColor ?? primaryIconColor, width: 1.5),
        borderRadius: borderRadius ?? BorderRadius.circular(10.0),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: errorColor, width: 1.0),
        borderRadius: borderRadius ?? BorderRadius.circular(10.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: errorColor, width: 1.0),
        borderRadius: borderRadius ?? BorderRadius.circular(10.0),
      ),
    );
  }
}

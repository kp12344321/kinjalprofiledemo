import 'package:get/get.dart';
import 'package:kinjalprofiledemo/view/edit_profile_screen/edit_profile_controller.dart';
import 'package:kinjalprofiledemo/view/home_screen/home_controller.dart';
import 'package:kinjalprofiledemo/view/login_screen/login_controller.dart';

/// Its A Example to Use This Type Of Binding
class CommonBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => EditProfileController());
  }
}

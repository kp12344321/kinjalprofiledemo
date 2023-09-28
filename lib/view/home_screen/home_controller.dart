import 'package:get/get.dart';
import 'package:kinjalprofiledemo/model/user_details_model.dart';
import 'package:kinjalprofiledemo/routes/routes.dart';
import 'package:kinjalprofiledemo/utils/sessionmanager.dart';

class HomeController extends GetxController {
  List<String> tags = [];
  RxList skills = [].obs;
  RxString username = ''.obs;
  RxString email = ''.obs;
  RxString workExprience = ''.obs;
  UserDetailsModel userDetailsModel = UserDetailsModel();

  RxString profileImg = ''.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUserDetails();
  }

  getUserDetails() async {
    await SessionManager.getUserDetails().then((value) {
      username.value = value?.name ?? 'Flutter Developer';
      print('email.value ${email.value}');
      email.value = value?.email ?? 'email@gmail.com';
      workExprience.value = value?.exprience ?? '2';
      profileImg.value = value?.image ?? '';
      print('profileImg.value ${profileImg.value}');
      skills.value = (value?.skills?.split(',') ??
          ['Flutter', 'Dart', 'Getx', 'Bloc', 'Firebase', 'Hive']);
    });
  }

  navigateTo() {
    var response = UserDetailsModel(
      name: username.value,
      email: email.value,
      skills: skills.toString(),
      exprience: workExprience.value,
      image: profileImg.value,
    );
    Get.toNamed(AppRoutes.editProfile, arguments: response);
  }
}

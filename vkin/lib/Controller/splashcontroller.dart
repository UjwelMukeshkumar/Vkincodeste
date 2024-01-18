// splash_controller.dart
import 'package:get/get.dart';
import 'package:vkin/view/Loginview.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(seconds: 3), () {
      Get.off(LoginPage());
    });
  }
}

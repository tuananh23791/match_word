import 'package:get/get.dart';
import 'package:match_work/global_controller/auth_controller.dart';

class LoginBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(AuthController(),permanent: true);
  }

}
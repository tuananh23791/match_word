import 'package:get/get.dart';
import 'package:match_work/page/register/register_controller.dart';

class RegisterBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(RegisterController());
  }
  
}
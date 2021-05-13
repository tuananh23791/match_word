import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:match_work/utils/app_info.dart';
import 'package:match_work/utils/strings.dart';
import 'package:match_work/utils/url.dart';

class AuthController extends GetxController{
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    listenerFirebaseAuth();
  }

  listenerFirebaseAuth(){
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User user) {
      if (user == null) {
        print('User is currently signed out!');
        if(AppInfo().isLoginSuccess) {
          AppInfo().isLoginSuccess = false;
          Get.offAllNamed(LOGIN_SCREEN);
        }
      } else {
        if(!AppInfo().isLoginSuccess) {
          AppInfo().isLoginSuccess = true;
          Get.offAllNamed(HOME_SCREEN);
        }
        print('User is signed in!');
      }
    });
  }
}
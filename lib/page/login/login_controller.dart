import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:match_work/utils/strings.dart';
import 'package:match_work/utils/utils.dart';

class LoginController extends GetxController{
  login({String email, String password}) async {
    Utils().showLoading();
    await FirebaseAuth.instance.signOut();
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
    } on FirebaseAuthException catch (e) {
      Utils().hideLoading();
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        print('No user found for that email.');
        Utils().showPopupErrorMessage(message: wrong_email_pwd);
      }
    }
  }
  //
  // gotoBlankScreen({String title, String content}){
  //   Get.find<BlankScreenController>().title = title;
  //   Get.find<BlankScreenController>().content = content;
  //   Get.toNamed(BLANK_SCREEN);
  // }
}
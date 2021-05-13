import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:match_work/utils/utils.dart';

class RegisterController extends GetxController{

  registerFirebase({String email = "", String password = ""}) async {
    Utils().showLoading();
    if(email.isEmpty || password.isEmpty){
      Utils().hideLoading();
      Utils().showPopupErrorMessage(message: "Email or Password not null");
      return;
    }
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        Utils().hideLoading();
        Utils().showPopupErrorMessage(message: "The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        Utils().hideLoading();
        Utils().showPopupErrorMessage(message: "The account already exists for that email.");
      }
    } catch (e) {
      print(e);
    }
  }
}
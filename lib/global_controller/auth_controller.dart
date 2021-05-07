import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

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
      } else {
        print('User is signed in!');
      }
    });
  }
}
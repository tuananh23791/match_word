import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:match_work/struct/base_widget_stateless.dart';
import 'package:match_work/utils/color.dart';
import 'package:match_work/utils/strings.dart';

class RegisterScreen extends BaseStatelessWidget {

  @override
  String appBarTitle() {
    return "Register";
  }

  @override
  Widget buildWidget(BuildContext context) {
    return widgetRegister();
  }
  Widget widgetRegister() {
    return GestureDetector(
      onTap: () {
        print("logout ne");
        _login();
      },
      child: RichText(
          text: TextSpan(children: [
            TextSpan(
                text: register,
                style: TextStyle(
                    color: purple, fontWeight: FontWeight.bold, fontSize: 17)),
            TextSpan(
              text: " $now",
              style: TextStyle(color: Colors.black, fontSize: 17),
            ),
          ])),
    );
  }

  _login() async {
    await FirebaseAuth.instance.signOut();
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: "barry.allen@example.com",
          password: "SuperSecretPassword!"
      );
    } on FirebaseAuthException catch (e) {
      // if (e.code == 'user-not-found') {
      //   print('No user found for that email.');
      // } else if (e.code == 'wrong-password') {
      //   print('Wrong password provided for that user.');
      // }
    }
  }

  @override
  bool isCanGoBack() {
    return true;
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:match_work/struct/base_widget_stateless.dart';

class HomeScreen extends BaseStatelessWidget {
  @override
  String appBarTitle() {
    return "Home";
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Container(child: Center(child: Column(
      children: [
        Text("Home"),
        GestureDetector(onTap:(){
          print("logout ne");
          FirebaseAuth.instance.signOut();
        },child: Text("Logout"))
      ],
    ),),);
  }

  @override
  bool isCanGoBack() {
    return false;
  }
}

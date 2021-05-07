import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utils {
  static final Utils _singleton = Utils._internal();

  Utils._internal();

  factory Utils() {
    return _singleton;
  }

  showPopupErrorMessage({String message}) {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Get.back();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Error"),
      content: Text(message),
      actions: [
        okButton,
      ],
    );

    Get.dialog(Center(child: alert),
        barrierDismissible: false);
  }

  showLoading(){
    Get.dialog(Center(child: CircularProgressIndicator()),
        barrierDismissible: false);
  }

  hideLoading(){
    if(Get.isDialogOpen)
      Get.back();
  }

  String getAuth(){
    String username = 'naruto';
    String password = 'bvM9pmEEQ7tfPZdC';
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    return basicAuth;
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:match_work/utils/color.dart';
import 'package:match_work/utils/strings.dart';
import 'package:match_work/widgets/custom_textfield.dart';

import 'login_controller.dart';

Widget widgetRegister() {
  return GestureDetector(
    onTap: () {
      Get.offAllNamed(REGISTER_SCREEN);
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

Widget widgetPassword(TextEditingController textEditingController) {
  return
    CustomTextField(
      height: 70,
      labelText: password,
      textEditingController: textEditingController,
      isPassword: true,
      isShowClearText: true,
    );
}

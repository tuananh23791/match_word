import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:match_work/page/register/register_controller.dart';
import 'package:match_work/struct/base_widget_stateless.dart';
import 'package:match_work/utils/color.dart';
import 'package:match_work/utils/strings.dart';
import 'package:match_work/utils/utils.dart';
import 'package:match_work/widgets/custom_button.dart';
import 'package:match_work/widgets/custom_textfield.dart';

class RegisterScreen extends BaseStatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  String appBarTitle() {
    return "Register";
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 50,right: 50),
      child: Column(
        children: [
          SizedBox(
            height: 5,
          ),
          //text field email
          CustomTextField(
            height: 70,
            labelText: email,
            textEditingController: _emailController,
            isShowClearText: true,
            textInputType: TextInputType.emailAddress,
          ),
          SizedBox(
            height: 20,
          ),

          //text field password
          CustomTextField(
            height: 70,
            labelText: password,
            textEditingController: _passwordController,
            isPassword: true,
            isShowClearText: true,
          ),
          SizedBox(
            height: 20,
          ),

          //forgot password
          GestureDetector(
            onTap: () {

            },
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(forgot_password)),
          ),
          SizedBox(
            height: 30,
          ),

          //button login
          Row(
            children: [
              Expanded(
                  child: CustomButton(
                    height: 70,
                    text: register,
                    onClick: () {
                      _validation();
                    },
                  )),
            ],
          ),
          SizedBox(
            height: 20,
          ),

          //register
          Text(not_a_member,
              style: TextStyle(color: Colors.black, fontSize: 17)),
          widgetRegister(),
        ],
      ),
    );
  }

  Widget widgetRegister() {
    return GestureDetector(
      onTap: () {
        print("logout ne");
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

  @override
  bool isCanGoBack() {
    return true;
  }

  _validation() {
    RegExp regExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",);
    String errorMessage = "";
    bool emailValid = regExp.hasMatch(_emailController.text);
    if (!emailValid) {
      errorMessage = invalid_email;
    } else if (_passwordController.text.isEmpty) {
      errorMessage = password_not_null;
    }

    if (errorMessage.isNotEmpty) {
      Utils().showPopupErrorMessage(message: errorMessage);
    } else {
      Get.find<RegisterController>().registerFirebase(
          email: _emailController.text, password: _passwordController.text);
    }
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:match_work/struct/base_widget_stateless.dart';
import 'package:match_work/utils/strings.dart';
import 'package:match_work/utils/utils.dart';
import 'package:match_work/widgets/custom_button.dart';
import 'package:match_work/widgets/custom_textfield.dart';

import 'login_controller.dart';
import 'login_widget.dart';

class LoginScreen extends BaseStatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  String appBarTitle() {
    return "Login";
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      child: SizedBox.expand(
        child: SingleChildScrollView(
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
                        text: login,
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
        ),
      ),
    );
  }

  @override
  bool isCanGoBack() {
    return false;
  }

  _validation(){
    RegExp regExp = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",);
    String errorMessage = "";
    bool emailValid = regExp.hasMatch(_emailController.text);
    if(!emailValid){
      errorMessage = invalid_email;
    }else if(_passwordController.text.isBlank){
      errorMessage = password_not_null;
    }

    if(!errorMessage.isBlank){
      Utils().showPopupErrorMessage(message: errorMessage);
    }else{
      _requestLogin();
    }
  }

  _requestLogin() async {
    String email = _emailController.text;
    String password = _passwordController.text;
    // Get.find<LoginController>()
    //     .login(email: email, password: password);
  }

  _login() async {
  }
}


import 'package:match_work/page/login/login_bindings.dart';
import 'package:match_work/page/login/login_screen.dart';
import 'package:match_work/page/register/register_screen.dart';
import 'package:match_work/utils/strings.dart';
import 'package:get/get.dart';

GetMaterialApp router(){
  return GetMaterialApp(
    initialRoute: "/",
    getPages: [
      GetPage(name: '/', page: () => LoginScreen(), binding: LoginBindings()),
      GetPage(name: REGISTER_SCREEN, page: () => RegisterScreen(), binding: LoginBindings()),

    ],
  );
}
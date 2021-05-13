
class AppInfo {
  static final AppInfo _singleton = AppInfo._internal();

  AppInfo._internal();

  factory AppInfo() {
    return _singleton;
  }

  bool isLoginSuccess = false;
}
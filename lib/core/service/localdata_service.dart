import 'package:shared_preferences/shared_preferences.dart';

class LocalService {
  static final shared = LocalService();
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  String _initialOpenKey = "initialOpen";
  String _userLoginStatusKey = "loginStatus";

  Future<bool> isUserLoggedIn() async {
    final SharedPreferences prefs = await _prefs;
    var status = prefs.getBool(_userLoginStatusKey);
    if (status == null) {
      status = false;
    }
    return status;
  }

  void changeUserLoginStatus(bool isLoggedIn) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setBool(_userLoginStatusKey, isLoggedIn);
  }

  Future<bool> isInitialOpened() async {
    final SharedPreferences prefs = await _prefs;
    var status = prefs.getBool(_initialOpenKey);
    if (status == null) {
      status = true;
    }
    return status;
  }

  void changeInitialOpenStatus(bool isInitial) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setBool(_initialOpenKey, isInitial);
  }
}

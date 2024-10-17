import 'package:shared_preferences/shared_preferences.dart';

class ShrHelper {
  Future<void> saveData() async {
    SharedPreferences shf = await SharedPreferences.getInstance();
    await shf.setBool('introStatus', true);
  }

  Future<bool?> getData() async {
    SharedPreferences shf = await SharedPreferences.getInstance();
    bool? status = shf.getBool('introStatus');
    return status;
  }

  Future<void> saveCredentials(String email, String password) async {
    SharedPreferences srf = await SharedPreferences.getInstance();
    await srf.setString('email', email);
    await srf.setString('password', password);
  }

  Future<Map<String, String?>> getCredentials() async {
    SharedPreferences srf = await SharedPreferences.getInstance();
    String? email = srf.getString('email');
    String? password = srf.getString('password');
    return {
      'email': email,
      'password': password,
    };
  }
}

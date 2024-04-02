import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  Future<bool> saveUserName(String name) async {
    bool flag = false;
    SharedPreferences sp = await SharedPreferences.getInstance();
    flag = await sp.setString('name', name);
    print(flag);
    print(name);
    return flag;
  }

  Future<String?> getUserName() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? name = sp.getString('name');
    print(name);

    return name;
  }

  Future<bool> saveUserPassword(String password) async {
    bool? flag = false;
    SharedPreferences sp = await SharedPreferences.getInstance();
    flag = await sp.setString('password', password);
    print(flag);
    print(password);
    return true;
  }

  Future<bool> saveSubmit(String questionId, bool flag) async {
    bool? flag = false;
    SharedPreferences sp = await SharedPreferences.getInstance();
    flag = await sp.setBool('${questionId}', true);
    // print(flag);
    // print(password);
    return true;
  }

  Future<bool?> getSubmit(String questionId) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool? flag = sp.getBool(questionId);
    // print(name);
    return (flag == null) ? false : flag;
  }

  Future<String?> getUserPassword() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? name = sp.getString('password');
    print(name);
    return name;
  }
}

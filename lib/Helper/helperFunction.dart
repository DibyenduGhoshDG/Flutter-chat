import 'package:shared_preferences/shared_preferences.dart';

class HelperFunction{
  static String sharedPreferenceUserLoggedInKey = "ISLOGGEDIN";
  static String sharedPreferenceUserNameKey = "USERNAMEKEY";
  static String sharedPreferenceUserEmailKey = "USERMAILKEY";

  // saving data to sharedPreference
  static Future<bool> savedLoggedInSharedPreference(bool isUserLoggedIn) async{
    SharedPreferences prefers = await SharedPreferences.getInstance();
    return await prefers.setBool(sharedPreferenceUserLoggedInKey, isUserLoggedIn);
  }

  static Future<bool> savedUserNameSharedPreference(String userName) async{
    SharedPreferences prefers = await SharedPreferences.getInstance();
    return await prefers.setString(sharedPreferenceUserNameKey, userName);
  }

  static Future<bool> savedUserEmailSharedPreference(String userEmail) async{
    SharedPreferences prefers = await SharedPreferences.getInstance();
    return await prefers.setString(sharedPreferenceUserEmailKey, userEmail);
  }

  // getting data from sharedpreference
  static Future<bool> getLoggedInSharedPreference() async {
    SharedPreferences prefers = await SharedPreferences.getInstance();
    return await prefers.getBool(sharedPreferenceUserLoggedInKey);
  }

  static Future<String> getUserNameSharedPreference() async {
    SharedPreferences prefers = await SharedPreferences.getInstance();
    return await prefers.getString(sharedPreferenceUserNameKey);
  }

  static Future<String> getUserEmailSharedPreference() async {
    SharedPreferences prefers = await SharedPreferences.getInstance();
    return await prefers.getString(sharedPreferenceUserEmailKey);
  }
}


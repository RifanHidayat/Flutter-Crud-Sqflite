import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  void saveData(int value, String dtusername, dtfirst_name, dtlast_name,
      dtemail, dtmobileno) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt("value", value);
    sharedPreferences.setString("username", dtusername);
    sharedPreferences.setString("firtsname", dtfirst_name);
    sharedPreferences.setString("lastname", dtlast_name);
    sharedPreferences.setString("mobileno", dtmobileno);
    sharedPreferences.setString("email", dtemail);
  }
}

import 'package:shared_preferences/shared_preferences.dart';

class PrefService {
  Future createCache(String _cpfEC) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    _preferences.setString("_cpfEC", _cpfEC);
  }

  Future readCache(String _cpfEC) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    var cache = _preferences.getString("_cpfEC");
    return cache;
  }

  Future removeCache(String _cpfEC) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    _preferences.remove("_cpfEC");
  }
}

import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  final SharedPreferences _sharedPreferences;

  CacheHelper(this._sharedPreferences);

  static CacheHelper? _instance;

  static Future<CacheHelper> getInstance() async {
    if (_instance == null) {
      final sharedPreferences = await SharedPreferences.getInstance();
      _instance = CacheHelper(sharedPreferences);
    }
    return _instance!;
  }

  Future<bool>? putStringList({
    required String key,
    required List<String> stringList,
  }) => _sharedPreferences.setStringList(key, stringList);

  Future<bool>? putString({required String key, required String value}) async =>
      _sharedPreferences.setString(key, value);

  List<String>? getStringList({required String key}) =>
      _sharedPreferences.getStringList(key);

  String? getString({required String key}) => _sharedPreferences.getString(key);

  Future<bool>? putBool(String key, bool value) async =>
      _sharedPreferences.setBool(key, value);

  bool? getBool({required String key}) => _sharedPreferences.getBool(key);

  Future<bool>? removeCached({required String key}) =>
      _sharedPreferences.remove(key);
}

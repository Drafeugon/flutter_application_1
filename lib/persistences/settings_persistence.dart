import 'package:shared_preferences/shared_preferences.dart';

class SettingsPersistence {
  static const _mailKey = 'mail';
  static const _passwordKey = 'password';
  static final _prefs = SharedPreferencesAsync();

  static Future<void> saveSettings(String mail, String password) async {
    await _prefs.setString(_mailKey, mail);
    await _prefs.setString(_passwordKey, password);
  }

  static Future<Map<String, String?>> loadSettings() async {
    final mail = await _prefs.getString(_mailKey);
    final password = await _prefs.getString(_passwordKey);
    return {'mail': mail, 'password': password};
  }
}
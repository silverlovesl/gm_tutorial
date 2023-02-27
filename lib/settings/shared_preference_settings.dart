import 'package:gm_tutorial/settings/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceSettings extends Settings {
  final String keyAuthToken = "authToken";

  SharedPreferences? _sharedPreferences;
  SharedPreferenceSettings();

  @override
  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  String? getAuthToken() {
    return _sharedPreferences?.getString(keyAuthToken);
  }

  @override
  Future<void> setAuthToken(String? authToken) async {
    if (authToken != null) {
      await _sharedPreferences?.setString(keyAuthToken, authToken);
    } else {
      await _sharedPreferences?.remove(keyAuthToken);
    }
  }
}

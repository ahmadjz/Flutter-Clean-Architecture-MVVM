import 'package:api_mvvm/app/resources/language_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String prefsKeyLang = "PREFS_KEY_LANG";

class AppPreferences {
  final SharedPreferences sharedPreferences;

  AppPreferences({required this.sharedPreferences});

  Future<String> getAppLanguage() async {
    String? language = sharedPreferences.getString(prefsKeyLang);
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      return LanguageType.english.getValue();
    }
  }
}

import 'dart:convert';

import 'package:api_mvvm/data/network/error_handler.dart';
import 'package:api_mvvm/data/response/responses.dart';
import 'package:shared_preferences/shared_preferences.dart';

const allDrinksKey = "ALL_DRINKS_KEY";

abstract class LocalDataSource {
  Future<AllDrinksResponse> getAllDrinksFromCache();

  Future<void> saveAllDrinksToCache(AllDrinksResponse allDrinksResponse);
}

class LocalDataSourceImplementer implements LocalDataSource {
  final SharedPreferences sharedPreferences;
  LocalDataSourceImplementer({
    required this.sharedPreferences,
  });

  @override
  Future<AllDrinksResponse> getAllDrinksFromCache() async {
    final jsonString = sharedPreferences.getString(allDrinksKey);

    if (jsonString != null) {
      final jsonMap = jsonDecode(jsonString);

      return AllDrinksResponse.fromJson(jsonMap);
    } else {
      throw ErrorHandler.handle(DataSource.cacheError);
    }
  }

  @override
  Future<void> saveAllDrinksToCache(AllDrinksResponse allDrinksResponse) async {
    final String allDrinksJson = jsonEncode(allDrinksResponse.toJson());
    await sharedPreferences.setString(allDrinksKey, allDrinksJson);
  }
}

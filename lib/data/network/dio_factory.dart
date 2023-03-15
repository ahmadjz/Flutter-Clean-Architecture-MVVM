import 'package:api_mvvm/app/app_prefs.dart';
import 'package:api_mvvm/app/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String applicationJson = "application/json";
const String contentType = "content-type";
const String accept = "accept";
const String authorization = "authorization";
const String defaultLanguage = "language";

class DioFactory {
  final AppPreferences appPreferences;

  DioFactory({required this.appPreferences});

  Future<Dio> getDio() async {
    Dio dio = Dio();

    String language = await appPreferences.getAppLanguage();
    Map<String, String> headers = {
      contentType: applicationJson,
      accept: applicationJson,
      defaultLanguage: language
    };

    dio.options = BaseOptions(
        baseUrl: Constants.baseUrl,
        headers: headers,
        receiveTimeout: Constants.apiTimeOut,
        sendTimeout: Constants.apiTimeOut);

    if (!kReleaseMode) {
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ));
    }

    return dio;
  }
}

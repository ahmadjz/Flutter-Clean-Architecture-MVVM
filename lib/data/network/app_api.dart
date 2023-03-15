import 'package:api_mvvm/data/response/responses.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../app/constants.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @GET("json/v1/1/filter.php?a=Non_Alcoholic")
  Future<AllDrinksResponse> getAllDrinks();
}

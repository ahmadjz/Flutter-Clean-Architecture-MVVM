import 'package:api_mvvm/data/network/app_api.dart';
import 'package:api_mvvm/data/response/responses.dart';

abstract class RemoteDataSource {
  Future<AllDrinksResponse> getAllDrinks();
}

class RemoteDataSourceImplementer implements RemoteDataSource {
  final AppServiceClient appServiceClient;

  RemoteDataSourceImplementer({required this.appServiceClient});

  @override
  Future<AllDrinksResponse> getAllDrinks() async {
    return await appServiceClient.getAllDrinks();
  }
}

import 'package:api_mvvm/data/data_source/local_data_source.dart';
import 'package:api_mvvm/data/data_source/remote_data_source.dart';
import 'package:api_mvvm/data/mapper/drinks_mapper.dart';
import 'package:api_mvvm/data/network/error_handler.dart';
import 'package:api_mvvm/data/network/failure.dart';
import 'package:api_mvvm/data/network/network_info.dart';
import 'package:api_mvvm/domain/model/all_drinks_model.dart';
import 'package:api_mvvm/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class RepositoryImplementer implements Repository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;
  final NetworkInfo networkInfo;
  RepositoryImplementer(
      {required this.remoteDataSource,
      required this.networkInfo,
      required this.localDataSource});

  @override
  Future<Either<Failure, AllDrinksObject>> getAllDrinksData() async {
    try {
      final response = await localDataSource.getAllDrinksFromCache();
      return Right(response.toDomain());
    } catch (cacheError) {
      if (await networkInfo.isConnected) {
        try {
          final response = await remoteDataSource.getAllDrinks();
          //TODO: add if else if the api has a status error agreed between the front-enf and the back-end developers

          localDataSource.saveAllDrinksToCache(response);
          return Right(response.toDomain());
        } catch (error) {
          return Left(ErrorHandler.handle(error).failure);
        }
      } else {
        return Left(DataSource.noInternetConnection.getFailure());
      }
    }
  }
}

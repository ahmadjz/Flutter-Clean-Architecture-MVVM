import 'package:api_mvvm/domain/model/all_drinks_model.dart';
import 'package:dartz/dartz.dart';

import '../../data/network/failure.dart';

abstract class Repository {
  Future<Either<Failure, AllDrinksObject>> getAllDrinksData();
}

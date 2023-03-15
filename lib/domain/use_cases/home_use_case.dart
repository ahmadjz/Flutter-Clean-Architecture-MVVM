import 'package:api_mvvm/data/network/failure.dart';
import 'package:api_mvvm/domain/model/all_drinks_model.dart';
import 'package:api_mvvm/domain/use_cases/base_use_case.dart';
import 'package:dartz/dartz.dart';

import '../repository/repository.dart';

class HomeUseCase implements BaseUseCase<Function?, AllDrinksObject> {
  final Repository _repository;

  HomeUseCase(this._repository);

  @override
  Future<Either<Failure, AllDrinksObject>> execute(Function? input) async {
    return await _repository.getAllDrinksData();
  }
}

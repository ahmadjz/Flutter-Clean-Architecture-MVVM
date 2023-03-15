import 'dart:async';

import 'package:api_mvvm/domain/model/all_drinks_model.dart';
import 'package:api_mvvm/domain/use_cases/home_use_case.dart';
import 'package:api_mvvm/presentation/base/base_view_model.dart';
import 'package:api_mvvm/presentation/common/state_renderer/state_renderer.dart';
import 'package:api_mvvm/presentation/common/state_renderer/state_renderer_impl.dart';
import 'package:rxdart/rxdart.dart';

class HomeViewModel extends BaseViewModel
    with HomeViewModelInput, HomeViewModelOutput {
  final _dataStreamController = BehaviorSubject<HomeViewObject>();

  final HomeUseCase _homeUseCase;

  HomeViewModel(this._homeUseCase);

  @override
  void start() {
    _getHomeData();
  }

  _getHomeData() async {
    inputState.add(
      LoadingState(
        stateRendererType: StateRendererType.fullScreenLoadingState,
      ),
    );
    (await _homeUseCase.execute(null)).fold(
      (failure) => {
        inputState.add(
          ErrorState(
            StateRendererType.fullScreenErrorState,
            failure.message,
          ),
        )
      },
      (homeObject) {
        inputState.add(ContentState());
        inputHomeData.add(
          HomeViewObject(
            drinks: homeObject.drinks,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _dataStreamController.close();
    super.dispose();
  }

  @override
  Sink get inputHomeData => _dataStreamController.sink;

  @override
  Stream<HomeViewObject> get outputHomeData =>
      _dataStreamController.stream.map((data) => data);
}

abstract class HomeViewModelInput {
  Sink get inputHomeData;
}

abstract class HomeViewModelOutput {
  Stream<HomeViewObject> get outputHomeData;
}

class HomeViewObject {
  List<Drink> drinks;

  HomeViewObject({required this.drinks});
}

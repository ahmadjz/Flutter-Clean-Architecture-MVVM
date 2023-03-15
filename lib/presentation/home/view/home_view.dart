import 'package:api_mvvm/presentation/common/animations/loading_animation_view.dart';
import 'package:api_mvvm/presentation/common/state_renderer/state_renderer_impl.dart';
import 'package:api_mvvm/presentation/home/view/widgets/drinks_grid_builder.dart';
import 'package:api_mvvm/presentation/home/viewmodel/home_view_model.dart';
import 'package:flutter/material.dart';

import '../../../../../app/di.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeViewModel _homeViewModel = instance<HomeViewModel>();

  _bind() {
    _homeViewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    _homeViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Drinks API"),
      ),
      body: Center(
        child: StreamBuilder<FlowState>(
          stream: _homeViewModel.outputState,
          builder: (context, snapshot) {
            return snapshot.data?.getScreenWidget(
                  context: context,
                  contentScreenWidget: _getContentWidget(),
                  retryActionFunction: () {
                    _homeViewModel.start();
                  },
                ) ??
                _getContentWidget();
          },
        ),
      ),
    );
  }

  Widget _getContentWidget() {
    return StreamBuilder<HomeViewObject>(
      stream: _homeViewModel.outputHomeData,
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          return DrinksGridBuilder(drinks: snapshot.data!.drinks);
        }
        return const LoadingAnimationView();
      },
    );
  }
}

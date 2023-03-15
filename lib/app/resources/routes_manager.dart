import 'package:api_mvvm/app/di.dart';
import 'package:api_mvvm/app/resources/strings_manager.dart';
import 'package:api_mvvm/presentation/home/view/home_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String homePage = "/";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homePage:
        initHomeModule();
        return MaterialPageRoute(builder: (_) => const HomeView());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.noRouteFound),
        ),
        body: const Center(child: Text(AppStrings.noRouteFound)),
      ),
    );
  }
}

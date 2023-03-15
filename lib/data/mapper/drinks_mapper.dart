import 'package:api_mvvm/app/constants.dart';
import 'package:api_mvvm/app/extensions.dart';
import 'package:api_mvvm/data/response/responses.dart';
import 'package:api_mvvm/domain/model/all_drinks_model.dart';

extension DrinkMapper on DrinkResponse? {
  Drink toDomain() {
    return Drink(
        id: this?.id.orEmpty() ?? Constants.empty,
        imageUrl: this?.imageUrl.orEmpty() ?? Constants.empty,
        name: this?.name.orEmpty() ?? Constants.empty);
  }
}

extension AllDrinksResponseMapper on AllDrinksResponse? {
  AllDrinksObject toDomain() {
    List<Drink> drinks =
        (this?.drinks?.map((drinkResponse) => drinkResponse.toDomain()) ??
                const Iterable.empty())
            .cast<Drink>()
            .toList();

    return AllDrinksObject(drinks: drinks);
  }
}

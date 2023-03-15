import 'package:json_annotation/json_annotation.dart';

part 'responses.g.dart';

@JsonSerializable()
class DrinkResponse {
  @JsonKey(name: 'idDrink')
  String? id;

  @JsonKey(name: 'strDrink')
  String? name;

  @JsonKey(name: 'strDrinkThumb')
  String? imageUrl;

  DrinkResponse({
    this.id,
    this.name,
    this.imageUrl,
  });

  Map<String, dynamic> toJson() => _$DrinkResponseToJson(this);

  factory DrinkResponse.fromJson(Map<String, dynamic> json) =>
      _$DrinkResponseFromJson(json);
}

@JsonSerializable()
class AllDrinksResponse {
  @JsonKey(name: 'drinks')
  List<DrinkResponse>? drinks;

  AllDrinksResponse(this.drinks);

  Map<String, dynamic> toJson() => _$AllDrinksResponseToJson(this);

  factory AllDrinksResponse.fromJson(Map<String, dynamic> json) =>
      _$AllDrinksResponseFromJson(json);
}

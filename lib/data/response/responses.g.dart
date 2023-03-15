// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DrinkResponse _$DrinkResponseFromJson(Map<String, dynamic> json) =>
    DrinkResponse(
      id: json['idDrink'] as String?,
      name: json['strDrink'] as String?,
      imageUrl: json['strDrinkThumb'] as String?,
    );

Map<String, dynamic> _$DrinkResponseToJson(DrinkResponse instance) =>
    <String, dynamic>{
      'idDrink': instance.id,
      'strDrink': instance.name,
      'strDrinkThumb': instance.imageUrl,
    };

AllDrinksResponse _$AllDrinksResponseFromJson(Map<String, dynamic> json) =>
    AllDrinksResponse(
      (json['drinks'] as List<dynamic>?)
          ?.map((e) => DrinkResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AllDrinksResponseToJson(AllDrinksResponse instance) =>
    <String, dynamic>{
      'drinks': instance.drinks,
    };

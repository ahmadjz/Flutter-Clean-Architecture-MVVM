class Drink {
  String id;
  String imageUrl;
  String name;
  Drink({
    required this.id,
    required this.imageUrl,
    required this.name,
  });
}

class AllDrinksObject {
  List<Drink> drinks;
  AllDrinksObject({
    required this.drinks,
  });
}

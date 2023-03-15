import 'package:api_mvvm/domain/model/all_drinks_model.dart';
import 'package:api_mvvm/presentation/home/view/widgets/drink_item_widget.dart';
import 'package:flutter/material.dart';

class DrinksGridBuilder extends StatelessWidget {
  const DrinksGridBuilder({
    Key? key,
    required this.drinks,
  }) : super(key: key);
  final List<Drink> drinks;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.02),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: MediaQuery.of(context).size.width * 0.02,
          mainAxisSpacing: MediaQuery.of(context).size.width * 0.02,
          mainAxisExtent: 200,
        ),
        itemCount: drinks.length,
        itemBuilder: (context, index) => DrinkItemWidget(
          drink: drinks[index],
        ),
      ),
    );
  }
}

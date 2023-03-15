import 'package:api_mvvm/app/resources/assets_manager.dart';
import 'package:api_mvvm/domain/model/all_drinks_model.dart';
import 'package:flutter/material.dart';

class DrinkItemWidget extends StatelessWidget {
  const DrinkItemWidget({
    Key? key,
    required this.drink,
  }) : super(key: key);
  final Drink drink;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.height * 0.3,
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.grey[300]!,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 5,
        borderOnForeground: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SizedBox(
                width: double.maxFinite,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: FadeInImage(
                    fit: BoxFit.cover,
                    image: Image.network(
                      drink.imageUrl,
                      fit: BoxFit.cover,
                    ).image,
                    imageErrorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        ImageAssets.noImagePlaceHolder,
                        fit: BoxFit.cover,
                      );
                    },
                    placeholder: const AssetImage(
                      ImageAssets.drinkPlaceHolder,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(drink.name,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:parima/models/food_item.dart';

class FoodItemProvider extends Notifier<List<FoodItem>> {
  @override
  List<FoodItem> build() {
    return <FoodItem>[];
  }

  Future<void> addFoodItem(String barcode, double mass) async {
    ProductQueryConfiguration config = ProductQueryConfiguration(
      barcode,
      version: ProductQueryVersion.v3,
    );

    ProductResultV3 product = await OpenFoodAPIClient.getProductV3(config);

    final calories = (product.product?.nutriments
                ?.getValue(Nutrient.energyKCal, PerSize.oneHundredGrams) ??
            0) *
        0.01 *
        mass;

    final carbohydrates = (product.product?.nutriments
                ?.getValue(Nutrient.carbohydrates, PerSize.oneHundredGrams) ??
            0) *
        0.01 *
        mass;

    final proteins = (product.product?.nutriments
                ?.getValue(Nutrient.proteins, PerSize.oneHundredGrams) ??
            0) *
        0.01 *
        mass;
    final fat = (product.product?.nutriments
                ?.getValue(Nutrient.fat, PerSize.oneHundredGrams) ??
            0) *
        0.01 *
        mass;

    if (product.product != null) {
      var newFoodItem = FoodItem(
        name: product.product!.productName!,
        barcode: barcode,
        calories: calories.roundToDouble(),
        mass: mass.roundToDouble(),
        carbohydrates: carbohydrates.roundToDouble(),
        proteins: proteins.roundToDouble(),
        fat: fat.roundToDouble(),
        imageUrl: product.product?.imageFrontUrl,
        date: DateTime.now(),
      );
      state = [...state, newFoodItem];
    }
  }

  void removeFoodItem(FoodItem foodItem) {
    if (!state.contains(foodItem)) {
      throw Exception('Error! Food item to be removed not found.');
    }

    state = state.where((element) => element != foodItem).toList();
  }

  double getTotalCalories() {
    var calories = 0.0;

    for (final item in state) {
      calories += item.calories;
    }

    return calories;
  }

  double getTotalCarbohydrates() {
    var carbohydrates = 0.0;

    for (final item in state) {
      carbohydrates += item.carbohydrates;
    }

    return carbohydrates;
  }

  double getTotalProteins() {
    var proteins = 0.0;

    for (final item in state) {
      proteins += item.proteins;
    }

    return proteins;
  }

  double getTotalFat() {
    var fat = 0.0;

    for (final item in state) {
      fat += item.fat;
    }

    return fat;
  }
}

final foodItemProvider = NotifierProvider<FoodItemProvider, List<FoodItem>>(
  () => FoodItemProvider(),
);

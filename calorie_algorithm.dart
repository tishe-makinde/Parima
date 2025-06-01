const carbCaloriesPerGram = 4;
const proteinCaloriesPerGram = 4;
const fatCaloriesPerGram = 9;
const alcoholCaloriesPerGram = 7;

class Food {
  final double carbs;
  final double proteins;
  final double fats;
  final double alcohol;
  final double calories;

  Food(
      {required this.carbs,
      required this.proteins,
      required this.fats,
      required this.alcohol,
      required this.calories});

  @override
  String toString() {
    return "Calorie Information:\n"
        "Carbs: $carbs\n"
        "Proteins:$proteins\n"
        "Fats: $fats\n"
        "Alcohol: $alcohol\n"
        "Total Calories: $calories\n";
  }

  Food scaleBy(double scaleFactor) {
    return Food(
        carbs: carbs * scaleFactor,
        proteins: proteins * scaleFactor,
        fats: fats * scaleFactor,
        alcohol: alcohol * scaleFactor,
        calories: calories * scaleFactor);
  }
}

class Person {
  double weight;
  late double calorieMaintence;

  Person({required this.weight}) {
    calorieMaintence = weight * 25;
  }
}

class FoodItem {
  final String name;
  final String barcode;
  String? imageUrl;
  double calories;
  double carbohydrates;
  double proteins;
  double fat;
  double mass;
  DateTime date;

  FoodItem({
    required this.name,
    required this.barcode,
    required this.calories,
    required this.mass,
    required this.carbohydrates,
    required this.proteins,
    required this.fat,
    required this.date,
    this.imageUrl,
  });
}

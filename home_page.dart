// Just a basic outline

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parima/components/calendar.dart';
import 'package:parima/components/main_floating_action_button.dart';
import 'package:parima/components/user_input_box.dart';
import 'package:parima/providers/food_item_provider.dart';
import 'package:parima/providers/user_provider.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final _barcodeController = TextEditingController();
  final _massController = TextEditingController();

  // Temporary Dummy Data
  final _dailyAllowanceCalories = 2500.0;
  final _dailyProteinsPerKgBodyWeight = 1.5;
  final _dailyCarbohydratesPerKgBodyWeight = 9.0;
  final _dailyFatPerKgBodyWeight = 1;
  final _weight = 84.0;
  final _targetWeight = 90.0;

  Future<void> _scanBarcode() async {
    String barcode = await FlutterBarcodeScanner.scanBarcode(
      '#ff0000',
      'Cancel',
      true,
      ScanMode.BARCODE,
    );

    _barcodeController.text = barcode;
  }

  @override
  Widget build(BuildContext context) {
    final foodEaten = ref.watch(foodItemProvider);
    final user = ref.watch(userProvider);

    return Scaffold(
      body: ListView(
        children: [
          Expanded(
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: _getWelcomeMessage(),
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        TextSpan(
                          text: user.firstName,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                        )
                      ],
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                  ),
                ),
              ],
            ),
          ),

          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: SfDateRangePicker(
          //     view: DateRangePickerView.month,
          //     viewSpacing: 20,
          //     headerStyle:
          //         DateRangePickerHeaderStyle(textAlign: TextAlign.center),
          //   ),
          // ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Calendar(),
          ),
          CarouselSlider(
            items: [
              _buildDailyStatCard(
                context,
                '${ref.watch(foodItemProvider.notifier).getTotalCalories()}',
                'Total Calories',
                ref.watch(foodItemProvider.notifier).getTotalCalories() /
                    _dailyAllowanceCalories,
              ),
              _buildDailyStatCard(
                context,
                '${ref.watch(foodItemProvider.notifier).getTotalProteins()}g',
                'Protein',
                ref.watch(foodItemProvider.notifier).getTotalProteins() /
                    (_dailyProteinsPerKgBodyWeight * _weight),
              ),
              _buildDailyStatCard(
                context,
                '${ref.watch(foodItemProvider.notifier).getTotalCarbohydrates()}g',
                'Carbohydrates',
                ref.watch(foodItemProvider.notifier).getTotalCarbohydrates() /
                    (_dailyCarbohydratesPerKgBodyWeight * _weight),
              ),
              _buildDailyStatCard(
                context,
                '${ref.watch(foodItemProvider.notifier).getTotalFat()}g',
                'Fats',
                ref.watch(foodItemProvider.notifier).getTotalFat() /
                    (_dailyFatPerKgBodyWeight * _weight),
              ),
              _buildDailyStatCard(
                context,
                '${_weight}kg',
                'Weight',
                _weight / _targetWeight,
              ),
            ],
            options: CarouselOptions(
              height: 300,
              autoPlay: true,
              viewportFraction: 0.7,
            ),
          ),

          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return InkWell(
                  onDoubleTap: () {
                    ref
                        .watch(foodItemProvider.notifier)
                        .removeFoodItem(foodEaten[index]);
                  },
                  onLongPress: () {
                    showDialog(
                      context: context,
                      builder: (context) => SingleChildScrollView(
                        child: AlertDialog(
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                foodEaten[index].name,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(foodEaten[index]
                                        .imageUrl ??
                                    'https://ralfvanveen.com/wp-content/uploads/2021/06/Placeholder-_-Glossary.svg'),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                'Quantity Consumed: ${foodEaten[index].mass}g',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              Text(
                                'Time Consumed: ${foodEaten[index].date.hour}:${foodEaten[index].date.minute}:${foodEaten[index].date.second}',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              Text(
                                'Calories: ${foodEaten[index].calories}kcal',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              Text(
                                'Carbohydrates: ${foodEaten[index].carbohydrates}g',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              Text(
                                'Protein: ${foodEaten[index].proteins}g',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              Text(
                                'Fat: ${foodEaten[index].fat}g',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ],
                          ),
                          backgroundColor:
                              Theme.of(context).colorScheme.surface,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                          width: 3,
                        ),
                      ),
                      color: Theme.of(context).colorScheme.surface,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  foodEaten[index].name,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                  maxLines: 1,
                                  softWrap: false,
                                ),
                                Text(
                                  '${foodEaten[index].mass}g',
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 100,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '${foodEaten[index].calories} kcal',
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: foodEaten.length,
            ),
          ),
          SizedBox(
            height: 75,
          ),
        ],
      ),
      floatingActionButton: MainFloatingActionButton(
        onPressed: () async {
          await _scanBarcode();
          showDialog(
            context: context,
            builder: (context) {
              return SingleChildScrollView(
                child: AlertDialog(
                  title: Text(
                    'Add Food Item',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  content: SizedBox(
                    width: double.maxFinite,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        UserInputBox(
                          controller: _barcodeController,
                          label: 'Barcode',
                          icon: Icons.qr_code,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        UserInputBox(
                          controller: _massController,
                          label: 'Mass (g)',
                          icon: Icons.scale,
                        ),
                      ],
                    ),
                  ),
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  actions: [
                    IconButton(
                      onPressed: _scanBarcode,
                      icon: Icon(
                        Icons.camera_alt,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.close,
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        String barcode = _barcodeController.text.trim();
                        String massAsString = _massController.text.trim();

                        if (barcode != '' && massAsString != '') {
                          double mass = double.parse(massAsString);

                          await ref
                              .read(
                                foodItemProvider.notifier,
                              )
                              .addFoodItem(
                                barcode,
                                mass,
                              );
                        }

                        _barcodeController.text = '';
                        _massController.text = '';
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.done,
                      ),
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ],
                ),
              );
            },
          );
        },
        icon: Icon(
          Icons.camera_alt,
        ),
      ),
    );
  }

  Widget _buildDailyStatCard(
      BuildContext context, String value, String label, double percentage) {
    return SizedBox(
      width: 200,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 200,
            height: 200,
            child: CircularProgressIndicator(
              value: percentage,
              color: (percentage) {
                if (percentage > 0.75) return Colors.green;
                if (percentage > 0.25) return Colors.amber;
                return Colors.red;
              }(percentage),
              backgroundColor: Theme.of(context).colorScheme.surfaceBright,
              strokeWidth: 15,
              strokeCap: StrokeCap.round,
            ),
          ),
          SizedBox(
            width: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  value,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                Text(
                  label,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _getWelcomeMessage() {
    final currentTime = DateTime.now();

    // morning
    if (currentTime.hour >= 4 && currentTime.hour < 12) {
      return 'Good morning, ';
    }

    // afternoon
    if (currentTime.hour >= 12 && currentTime.hour < 18) {
      return 'Good afternoon, ';
    }

    // evening
    if (currentTime.hour >= 18 && currentTime.hour < 21) {
      return 'Good evening, ';
    }

    return 'Go to bed, ';
  }
}

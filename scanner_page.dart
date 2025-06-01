import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parima/providers/food_item_provider.dart';

class ScannerPage extends ConsumerStatefulWidget {
  const ScannerPage({super.key});

  @override
  ConsumerState<ScannerPage> createState() => _ScannerPageState();
}

class _ScannerPageState extends ConsumerState<ScannerPage> {
  Future<void> _scanBarcode() async {
    String barcode = await FlutterBarcodeScanner.scanBarcode(
      '#ff0000',
      'Cancel',
      true,
      ScanMode.BARCODE,
    );

    ref.watch(foodItemProvider.notifier).addFoodItem(barcode, 0.5);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Scanner page contents goes here.'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _scanBarcode,
        child: const Icon(
          Icons.camera,
        ),
      ),
    );
  }
}

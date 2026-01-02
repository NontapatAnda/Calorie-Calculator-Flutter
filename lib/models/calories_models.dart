import 'package:flutter/material.dart';

class CaloriesTracker {
  static Map<String, double> caloriesByCategory = {
    'vegetables': 0.0,
    'fruits': 0.0,
    'protein': 0.0,
    'grains': 0.0,
    'dairy': 0.0,
  };

static Map<String, Set<dynamic>> selectedItems = {
  'vegetables': {},
  'fruits': {},
  'protein': {},
  'grains': {},
  'dairy': {},
};



  // เพิ่ม ValueNotifier เพื่อแจ้ง UI ว่ามีการเปลี่ยนแปลง
  static final ValueNotifier<int> itemCountNotifier = ValueNotifier(0);

  static double get totalCalories =>
      caloriesByCategory.values.fold(0.0, (a, b) => a + b);

  static bool get hasSelectedItems =>
      selectedItems.values.any((set) => set.isNotEmpty);

 static void resetAll() {
  for (final key in caloriesByCategory.keys) {
    caloriesByCategory[key] = 0.0;
    selectedItems[key]!.clear();
  }

  itemCountNotifier.value = 0;
  notifyChange();
}


static void notifyChange() {
  final count = selectedItems.values
      .fold<int>(0, (sum, set) => sum + set.length);
  itemCountNotifier.value = count;
}

static void removeItem(dynamic item) {
  for (final entry in selectedItems.entries) {
    if (entry.value.remove(item)) {
      break;
    }
  }

  for (final key in caloriesByCategory.keys) {
    caloriesByCategory[key] = selectedItems[key]!
        .fold(0.0, (sum, e) => sum + e.calories);
  }

  notifyChange();
}


}
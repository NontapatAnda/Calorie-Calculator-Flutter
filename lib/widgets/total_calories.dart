import 'package:flutter/material.dart';
import '../models/calories_models.dart';

class TotalCaloriesBar extends StatelessWidget {
  const TotalCaloriesBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: CaloriesTracker.itemCountNotifier,
      builder: (context, _, __) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(0xFF2980B9),
                Color(0xFF6DD5FA),
              ],
            ),
          ),
          child: Row(
            children: [
              /// 🔢 Total Calories
              Expanded(
                child: Text(
                  'Total Calories : ${CaloriesTracker.totalCalories.toStringAsFixed(0)} kcal',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
              ),

              /// 🔄 Reset Button
              TextButton.icon(
                onPressed: () {
                  CaloriesTracker.resetAll();

                  /// บังคับ rebuild หน้าปัจจุบัน
                  (context as Element).markNeedsBuild();
                },
                icon: const Icon(Icons.restart_alt, color: Colors.white),
                label: const Text(
                  'Reset',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black.withValues(alpha: 0.1),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:osu_app/models/vegetable_models.dart';
import 'package:osu_app/models/calories_models.dart';
import '../widgets/total_calories.dart';

class VegetableCategory extends StatefulWidget {
  VegetableCategory({super.key});

  @override
  State<VegetableCategory> createState() => _VegetableCategoryState();
}

class _VegetableCategoryState extends State<VegetableCategory> {

  List<VegetablesMenu> menu = [];
  double totalCalories = 0.0;

   @override
  void initState() {
    super.initState();
    _getInitialInfo(); 
  }

  void _getInitialInfo() {
    menu = VegetablesMenu.getVeg();
  }


void calculatedCalories() {
  final double sum = menu
      .where((item) => item.isSelected)
      .fold(0.0, (sum, item) => sum + item.calories);

  CaloriesTracker.caloriesByCategory['vegetables'] = sum; 
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vegetable'),
      ),
      body: ValueListenableBuilder<int>(
  valueListenable: CaloriesTracker.itemCountNotifier,
  builder: (context, _, __) {

    return ListView.builder(
      itemCount: menu.length,
      padding: const EdgeInsets.all(20),
      itemBuilder: (context, index) {
        final item = menu[index];

        item.isSelected =
            CaloriesTracker.selectedItems['vegetables']!.contains(item);

        return Container(
          height: 115,
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: const LinearGradient(
              colors: [
                Color(0xFF11998e),
                Color(0xFF38ef7d),
              ],
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset(item.iconPath, width: 60),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.name,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500)),
                  Text('${item.calories} kCal/100g'),
                ],
              ),
              Checkbox(
                value: item.isSelected,
                onChanged: (value) {
                  setState(() {
                    item.isSelected = value ?? false;

                    if (item.isSelected) {
                      CaloriesTracker.selectedItems['vegetables']!.add(item);
                    } else {
                      CaloriesTracker.selectedItems['vegetables']!.remove(item);
                    }

                    calculatedCalories();
                    CaloriesTracker.notifyChange();
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  },
),

    bottomNavigationBar: TotalCaloriesBar() ,
    );
  }
}

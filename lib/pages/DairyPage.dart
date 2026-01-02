import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:osu_app/models/calories_models.dart';
import 'package:osu_app/models/dairy_models.dart';
import '../widgets/total_calories.dart';

class DairyCategory extends StatefulWidget {
  DairyCategory({super.key});

  @override
  State<DairyCategory> createState() => _DairyCategoryState();
}

class _DairyCategoryState extends State<DairyCategory> {

  List<DairyMenu> menu = [];
  double totalCalories = 0.0;

   @override
  void initState() {
    super.initState();
    _getInitialInfo(); 
  }

  void _getInitialInfo() {
    menu = DairyMenu.getDairy();

  }


void calculatedCalories() {
  final double sum = menu
      .where((item) => item.isSelected)
      .fold(0.0, (sum, item) => sum + item.calories);

  CaloriesTracker.caloriesByCategory['dairy'] = sum;

}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dairy'),
      ),
     body: ValueListenableBuilder<int>(
  valueListenable: CaloriesTracker.itemCountNotifier,
  builder: (context, _,_) {

    return ListView.builder(
      itemCount: menu.length,
      padding: const EdgeInsets.all(20),
      itemBuilder: (context, index) {
        final item = menu[index];
        
        item.isSelected =
            CaloriesTracker.selectedItems['dairy']!.contains(item);

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
                      CaloriesTracker.selectedItems['dairy']!.add(item);
                    } else {
                      CaloriesTracker.selectedItems['dairy']!.remove(item);
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

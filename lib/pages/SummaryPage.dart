import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/calories_models.dart';
import '../widgets/total_calories.dart';

class SummaryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Summary')),

      body: ValueListenableBuilder<int>(
        valueListenable: CaloriesTracker.itemCountNotifier,
        builder: (context, _, __) {
          final allItems =
              CaloriesTracker.selectedItems.values.expand((e) => e).toList();

          if (allItems.isEmpty) {
            return const Center(child: Text('No items selected'));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: allItems.length,
            itemBuilder: (context, index) {
              return _itemCard(context,allItems[index]);
            },
          );
        },
      ),

      bottomNavigationBar: TotalCaloriesBar(),
    );
  }
}

Widget _itemCard(BuildContext context, dynamic item) {
  return Container(
    height: 110,
    margin: const EdgeInsets.only(bottom: 16),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      gradient: const LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          Color(0xFF11998e),
          Color(0xFF38ef7d),
        ],
      ),
    ),
    child: Row(
      children: [
        const SizedBox(width: 20),
        SvgPicture.asset(item.iconPath, width: 60),
        const SizedBox(width: 20),

        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.name,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black)),
              Text('${item.calories} kCal',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400)),
            ],
          ),
        ),

        IconButton(
          padding: EdgeInsets.only(right: 15),
          icon: const Icon(Icons.close, 
          color: Colors.black,
          ),
          onPressed: () {
            CaloriesTracker.removeItem(item);
          },
        ),
      ],
    ),
  );
}


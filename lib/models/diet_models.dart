import 'package:flutter/material.dart';

class DietModels {
  String name;
  String iconPath;
  String level;
  String duration;
  String calories;
  Color boxColor;

  DietModels({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calories,
    required this.boxColor
  });


  static List<DietModels> getDiets(){
    List<DietModels> diets = [];

    diets.add(
      DietModels(
      name: 'scrambled eggs',
      iconPath: 'assets/icons/egg2.svg',
      level: 'Easy',
      duration: '30mins',
      calories: '148kCal/100g', 
      boxColor: Color(0xff92A3FD)
    )
    );

    diets.add(
      DietModels(
       name:'Cereal',
       iconPath: 'assets/icons/cereal.svg',
       level: 'Easy',
       duration: '15mins',
       calories: '379kCal/100g',
       boxColor: Color(0xFF21E03A)
       )
    );



    return diets;
  }
}
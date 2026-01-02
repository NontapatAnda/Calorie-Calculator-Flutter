import 'package:flutter/material.dart';

class PopularDietsModel {
  String name;
  String iconPath;
  String level;
  String duration;
  String calories;
  Color boxColor;

  PopularDietsModel({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calories,
    required this.boxColor
  });


  static List<PopularDietsModel> getPopularDiets(){
    List<PopularDietsModel> popularDiets = [];

    popularDiets.add(
      PopularDietsModel(
      name: 'Soup',
      iconPath: 'assets/icons/soup.svg',
      level: 'Easy',
      duration: '15mins',
      calories: '100kCal', 
      boxColor: Color.fromARGB(255, 6, 236, 121)
    )
    );

    popularDiets.add(
      PopularDietsModel(
       name:'Bread',
       iconPath: 'assets/icons/bread.svg',
       level: 'Easy',
       duration: '10mins',
       calories: '50kCal',
       boxColor: Color.fromARGB(255, 0, 183, 207)
       )
    );

    return popularDiets;
  }
}


























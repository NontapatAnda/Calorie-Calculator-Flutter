import 'package:flutter/material.dart';

class GrainMenu {
  String name;
  double calories;
  String iconPath;
  Color boxColor;
  bool isSelected;


 GrainMenu({
  required this.name,
  required this.calories,
  required this.iconPath,
  required this.boxColor,
  this.isSelected = false
});

 @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GrainMenu && other.name == name;

  @override
  int get hashCode => name.hashCode;

 static List<GrainMenu> getGrain(){
  List<GrainMenu> grainList = [];

  grainList.add(
    GrainMenu(
      name: 'Corn',
      calories: 96,
      iconPath: 'assets/icons/corn.svg',
      boxColor: Color.fromARGB(255, 6, 236, 121)
  )
  );

  grainList.add(
    GrainMenu(name: 'Rice',
    calories: 130, 
    iconPath: 'assets/icons/riceball.svg', 
    boxColor: Color.fromARGB(255, 6, 236, 121))
  );


  return grainList;
 }
}
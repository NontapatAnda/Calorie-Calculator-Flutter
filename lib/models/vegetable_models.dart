import 'package:flutter/material.dart';

class VegetablesMenu {
  String name;
  double calories;
  String iconPath;
  Color boxColor;
  bool isSelected;


 VegetablesMenu({
  required this.name,
  required this.calories,
  required this.iconPath,
  required this.boxColor,
  this.isSelected = false
});


 @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VegetablesMenu && other.name == name;

  @override
  int get hashCode => name.hashCode;

 static List<VegetablesMenu> getVeg(){
  List<VegetablesMenu> vegList = [];

  vegList.add(
    VegetablesMenu(
      name: 'Carrot',
      calories: 41,
      iconPath: 'assets/icons/carrot.svg',
      boxColor: Color.fromARGB(255, 6, 236, 121)
  )
  );

  vegList.add(
    VegetablesMenu(name: 'Broccoli',
    calories: 33, 
    iconPath: 'assets/icons/broccoli.svg', 
    boxColor: Color.fromARGB(255, 6, 236, 121))
  );


  return vegList;
 }
}
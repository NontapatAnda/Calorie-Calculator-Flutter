import 'package:flutter/material.dart';

class DairyMenu {
  String name;
  double calories;
  String iconPath;
  Color boxColor;
  bool isSelected;


 DairyMenu({
  required this.name,
  required this.calories,
  required this.iconPath,
  required this.boxColor,
  this.isSelected = false
});

 @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DairyMenu && other.name == name;

  @override
  int get hashCode => name.hashCode;

 static List<DairyMenu> getDairy(){
  List<DairyMenu> dairyList = [];

  dairyList.add(
    DairyMenu(
      name: 'Milk',
      calories: 43,
      iconPath: 'assets/icons/milktank.svg',
      boxColor: Color.fromARGB(255, 6, 236, 121)
  )
  );

  dairyList.add(
    DairyMenu(name: 'Cheese',
    calories: 33, 
    iconPath: 'assets/icons/cheese.svg', 
    boxColor: Color.fromARGB(255, 6, 236, 121))
  );


  return dairyList;
 }
}
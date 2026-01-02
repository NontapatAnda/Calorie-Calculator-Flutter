import 'package:flutter/material.dart';

class ProteinsMenu {
  String name;
  double calories;
  String iconPath;
  Color boxColor;
  bool isSelected;


 ProteinsMenu({
  required this.name,
  required this.calories,
  required this.iconPath,
  required this.boxColor,
  this.isSelected = false
});

 @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProteinsMenu && other.name == name;

  @override
  int get hashCode => name.hashCode;


 static List<ProteinsMenu> getProtein(){
  List<ProteinsMenu> proteinList = [];

  proteinList.add(
    ProteinsMenu(
      name: 'Beef',
      calories: 250.5,
      iconPath: 'assets/icons/beef.svg',
      boxColor: Color.fromARGB(255, 6, 236, 121)
  )
  );

  proteinList.add(
    ProteinsMenu(name: 'Beans',
    calories: 313, 
    iconPath: 'assets/icons/beans.svg', 
    boxColor: Color.fromARGB(255, 6, 236, 121))
  );


  return proteinList;
 }
}
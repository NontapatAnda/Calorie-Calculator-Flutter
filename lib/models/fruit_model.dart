import 'package:flutter/material.dart';

class FruitMenu {
  String name;
  double calories;
  String iconPath;
  Color boxColor;
  bool isSelected;


 FruitMenu({
  required this.name,
  required this.calories,
  required this.iconPath,
  required this.boxColor,
  this.isSelected = false
});
 @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FruitMenu && other.name == name;

  @override
  int get hashCode => name.hashCode;
 static List<FruitMenu> getFruit(){
  List<FruitMenu> fruitList = [];

  fruitList.add(
    FruitMenu(
      name: 'Watermelon',
      calories: 30.4,
      iconPath: 'assets/icons/watermelon.svg',
      boxColor: Color.fromARGB(255, 6, 236, 121)
  )
  );

  fruitList.add(
    FruitMenu(name: 'Banana',
    calories: 33, 
    iconPath: 'assets/icons/banana.svg', 
    boxColor: Color.fromARGB(255, 6, 236, 121))
  );


  return fruitList;
 }
}
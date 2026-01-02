import 'package:flutter/material.dart';

class CategoryModels {
  String name;
  String iconPath;
  Color boxColor;
  String route;


  CategoryModels({
    required this.name,
    required this.iconPath,
    required this.boxColor,
    required this.route,
  });


  static List<CategoryModels> getCategories(){
    List<CategoryModels> categories = [];

    categories.add(
      CategoryModels(name:'Vegetables', 
      iconPath: 'assets/icons/salad.svg',
      boxColor: Color(0xff92A3FD),
      route: '/vegetables'
       )
    );

    categories.add(
      CategoryModels(name: 'Fruit',
       iconPath: 'assets/icons/fruit-icon.svg', 
       boxColor: Color(0xffC58BF2),
       route: '/fruit'
       ),
    );

    categories.add(
      CategoryModels(name: 'Protein Foods',
       iconPath: 'assets/icons/egg.svg',
        boxColor: Color(0xff92A3FD),
        route: '/protein'),
        
    );

    categories.add(
      CategoryModels(name: 'Grains', 
      iconPath: 'assets/icons/rice.svg', 
      boxColor: Color(0xffC58BF2),
      route: '/grains')
    );

    categories.add(
      CategoryModels(name: 'Dairy',
       iconPath: 'assets/icons/milk.svg',
       boxColor: Color(0xffC58BF2),
       route: '/dairy' )
    );

    return categories;
  }



}
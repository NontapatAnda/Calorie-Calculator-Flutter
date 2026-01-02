import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:osu_app/models/calories_models.dart';
import 'package:osu_app/models/category_models.dart';
import 'package:osu_app/models/diet_models.dart';
import 'package:osu_app/models/popular_models.dart';
import 'package:osu_app/pages/SummaryPage.dart';

class Homepage extends StatefulWidget {
   Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<CategoryModels> categories = [];
  List<DietModels> diets = [];
  List<PopularDietsModel> popularDiets = [];

  void _getInitialInfo(){
    categories = CategoryModels.getCategories();
    diets = DietModels.getDiets();
    popularDiets = PopularDietsModel.getPopularDiets();
  }

  @override
void initState() {
  super.initState();
  _getInitialInfo();
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          _searchField(),
          SizedBox(height: 40,),
          _categoriesSection(),
          SizedBox(height: 40,),
          _dietSection(),
          SizedBox(height: 40,),
          _popularSection(),
            SizedBox(height: 40,),
        ],
        ),
        floatingActionButton: ValueListenableBuilder<int>(
          valueListenable: CaloriesTracker.itemCountNotifier,
          builder: (context, count, child) {
            if (count == 0) return SizedBox.shrink();

           return FloatingActionButton.large(
             backgroundColor: const Color.fromARGB(255, 243, 154, 45),
             onPressed: () {
             Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => SummaryPage()),
            );
          },
          child: SvgPicture.asset(
            'assets/icons/basket.svg',
            width: 50,
            height: 50,
          ),
        );
  },
),
    );
  }

  Column _popularSection() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Popular',
                style:TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600
                )
                )
              ),
              SizedBox(height: 15,),
              ListView.separated(
                itemBuilder: (context,index){
                  return Container(
                    height: 115,
                    // ignore: sort_child_properties_last
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                        child: SvgPicture.asset(popularDiets[index].iconPath,
                        width: 65,
                        height: 65,)),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              popularDiets[index].name,
                              style:TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 16
                              ),
                            ),
                            Text(
                              popularDiets[index].level + ' | ' + popularDiets[index].duration + ' | ' + popularDiets[index].calories,
                              style: TextStyle(
                                color: Color(0xff7B6F72),
                                fontSize: 13,
                                fontWeight: FontWeight.w400
                              ),
                            )
                          ],
                        ),
                        GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset('assets/icons/right_arrow.svg',
                        width: 30,
                        height: 30,
                        )
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          offset: Offset(0, 10),
                          blurRadius: 40,
                          spreadRadius: 0
                        )
                      ]
                    ),
                  );
                },
                 shrinkWrap: true,
                 separatorBuilder: (context,index) => SizedBox(height: 25,),
                 padding: EdgeInsets.only(
                  left: 20,
                  right: 20
                 ),
                 itemCount: popularDiets.length)
          ],
          );
  }

  Column _dietSection() {
    return Column(     
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
             padding: EdgeInsets.only(left: 20),
             child:Text(
              'Recommendation\nfor diet',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600
              ),
              )
            ),
            SizedBox(height: 15,),
            Container(
              height: 240,
              child:ListView.separated(
                itemBuilder: (context,index){
                  return Container(
                    width: 210,
                    decoration: BoxDecoration(
                      color: diets[index].boxColor.withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child:Column(
                    children: [
                      Flexible(
                        child: SvgPicture.asset(diets[index].iconPath)),
                        Text(
                          diets[index].name,
                          style:TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 16
                          ),
                        ),
                        Text(
                          diets[index].level + ' | ' + diets[index].duration + ' | ' + diets[index].calories,
                          style: TextStyle(
                            color: Color(0xff7B6F72),
                            fontSize: 13,
                            fontWeight: FontWeight.w400
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 20,bottom: 20),
                        child:Container(
                          height: 45,
                          width: 130,
                          // ignore: sort_child_properties_last
                          child:Center(
                            child: Text(
                              'View',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xff9DCEFF),
                                Color(0xff92A3FD)
                                ]
                            ),
                            borderRadius: BorderRadius.circular(50)
                          ),
                        )
                        )
                    ],
                  )
                  );
                },
                separatorBuilder: (context,index) => SizedBox(width: 15,),
                itemCount: diets.length,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20
                )
                ), 
            )
          ],);
  }

  Column _categoriesSection() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25),
            child: Text('Category',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600
            ),
            ),
            ),
            SizedBox(height: 15),
            // ignore: sized_box_for_whitespace
            Container(
              height: 120,
              child: ListView.separated(
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20
                ),
                separatorBuilder:(context, index) => SizedBox(width: 25,),
                itemBuilder: (context, index){
                  final category = categories[index];

                  return InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap:(){
                      Navigator.pushNamed(context,category.route);
                    },
                  child: Container(
                    width: 100,
                    decoration: BoxDecoration(
                      color: categories[index].boxColor.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(16)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: SvgPicture.asset(categories[index].iconPath),
                          ),
                        ),
                        Text(
                          categories[index].name,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 14
                          ),
                        )
                      ],
                      ),
                  ),
                  );
                },
              ),
              ),   
          ],
        );
  }

  Container _searchField() {
    return Container(
          margin: EdgeInsets.only(top: 40,left: 20,right: 20),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color(0xff1D1617).withValues(alpha: 0.3),
                blurRadius: 40,
                spreadRadius: 0.0
              )
            ]
          ),
          child: TextField(
            decoration: InputDecoration(
             filled: true,
             hintText: 'Search Pad Kra Pao',
             hintStyle: TextStyle(
              color: Colors.blue
             ),
             fillColor: Colors.white,
             contentPadding: EdgeInsets.all(15),
             prefixIcon: Padding(
              padding: const EdgeInsets.all(12),
              child: SvgPicture.asset('assets/icons/search-button.svg'),
             ),
              // ignore: sized_box_for_whitespace
              suffixIcon: Container(
              width: 100,
              child: IntrinsicHeight(
               child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                 VerticalDivider(
                  color: Colors.black,
                  thickness: 0.2,
                  indent: 10,
                  endIndent: 10,
                 ),
                 Padding(
                  padding: const EdgeInsets.all(12),
                  child: SvgPicture.asset('assets/icons/filter.svg'),
                ),
              ], //Children
              ),
              ),
              ),
              border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none
             ),
            
          ),
        ),
        );
  }

  AppBar appBar() {
    return AppBar(
      title: Text('Foodies',
      style: TextStyle(
        color: Colors.black,
        fontSize: 21,
        fontWeight: FontWeight.bold
      ),
      ),
      centerTitle: true,
      // elevation = shadow
      elevation: 0.0,
      backgroundColor: Colors.white,
      actions: [
        GestureDetector(
          onTap:(){

          },
        child: Container(
        margin: EdgeInsets.all(10),
        width: 37,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color(0xffF7F8F8),
          borderRadius: BorderRadius.circular(10)
        ),
        child: SvgPicture.asset(
          'assets/icons/three-dots.svg',
          height: 20,
          width: 20,
          )
      ),
        ),
      ],
    );
  }
}
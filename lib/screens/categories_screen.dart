import 'package:DealMeal/widegets/categoriy_item.dart';
import 'package:DealMeal/models/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../widegets/categoriy_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  GridView(
        //  scrollDirection:,
         padding:const EdgeInsets.all(10),
        children: DUMMY_CATEGORIES.map((catData) =>CategoryItem(
          catData.id,
          catData.title,
          catData.color
        )
        ).toList(),
         gridDelegate:SliverGridDelegateWithMaxCrossAxisExtent(
           maxCrossAxisExtent: 200,
           childAspectRatio: 3/2,
           crossAxisSpacing: 22,
           mainAxisSpacing: 22,
           
         ) ,
    );
  }
}



 //   body: GridView( 
        // children: DUMMY_CATEGORISE.map((catData) => CategoryItem(
        //   catData.title,
        //   catData.color))
        //   .toList()   ,     
        
        // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //   crossAxisCount: 200,
        //   childAspectRatio: 3/2,
        //   crossAxisSpacing: 20,
        //   mainAxisSpacing: 20,
          
        //   ),
        
      // )
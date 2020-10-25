import 'package:DealMeal/screens/categories_screen.dart';
import 'package:DealMeal/screens/category_meals_screen.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
CategoryItem(this.id,this.title,this.color);

void seleceCategory(BuildContext ctx){
  Navigator.of(ctx).pushNamed(
    CategoryMealScreen.routeName,
    arguments: {
      'id':id,
      'title':title,}  
  );

}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:() => seleceCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),

        child: Container(
        padding: const EdgeInsets.all(25),
        child: Text(title,style: TextStyle(color: Colors.white,)),
        decoration: BoxDecoration(gradient: LinearGradient(colors: [
          // Colors.blue,
          // Colors.blueAccent,
          // Colors.greenAccent,
          // Colors.green
          color,
          color.withOpacity(0.7)

          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight
          ),
          borderRadius: BorderRadius.circular(15)
          ),

      ),
    );
  }
}
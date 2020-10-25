import 'package:DealMeal/models/category.dart';
import 'package:DealMeal/models/dummy_data.dart';
import 'package:DealMeal/models/meal.dart';
import 'package:DealMeal/widegets/meal_item.dart';
import 'package:flutter/material.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routeName='/category-meals';

  final List<Meal> availableMeals;
  CategoryMealScreen(this.availableMeals);

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {

  String categoryTitle;
  List<Meal> displayedMeals;
  var _loadedInitData=false;

  @override
  void initState() {
   
    super.initState();
  }

  @override
  void didChangeDependencies() {

    if(!_loadedInitData)
    {

   final routeArg=ModalRoute.of(context).settings.arguments as Map<String,String>;
  categoryTitle=routeArg['title'];
  final categoryId=routeArg['id'];
  displayedMeals=widget.availableMeals.where((meal) {
    return meal.categories.contains(categoryId);
  }).toList();
  _loadedInitData=true;
    }
    
    super.didChangeDependencies();
  }


  void _removeMeal(String mealId){
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id==mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
  

    return Scaffold(
          appBar: AppBar(
            centerTitle: true, 
            title: Text(categoryTitle),
            ),
          body:ListView.builder(itemBuilder: (ctx,index){
              return MealItem(
                id: displayedMeals[index].id,
                title: displayedMeals[index].title,
                imageurl: displayedMeals[index].imageUrl,
                duration: displayedMeals[index].duration,
                affordability: displayedMeals[index].affordability,
                complexity: displayedMeals[index].complexity,
                // removeItem: _removeMeal,
              );
            },
            itemCount: displayedMeals.length,
          ) 
    );
  }
}
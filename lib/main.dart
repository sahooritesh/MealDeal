import 'package:DealMeal/models/dummy_data.dart';
import 'package:DealMeal/models/meal.dart';
import 'package:DealMeal/screens/categories_screen.dart';
import 'package:DealMeal/models/category.dart';
import 'package:DealMeal/screens/category_meals_screen.dart';
import 'package:DealMeal/screens/fiters_screen.dart';
import 'package:DealMeal/screens/meal_detail_screen.dart';
import 'package:DealMeal/screens/tabs_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map<String,bool> _filters={
    'gluten':false,
    'lactose':false,
    'vegan':false,
    'vegetarian':false,
  };

  List<Meal> _availableMeals=DUMMY_MEALS;
  List<Meal> _favoriteMeals=[];

  void _setFilters(Map<String,bool> filterData){
    setState(() {
      _filters=filterData;

      _availableMeals=DUMMY_MEALS.where((meal){

        if(_filters['gluten'] && !meal.isGlutenFree){
          return false;
        }

      if(_filters['lactose'] && !meal.isLactoseFree){
          return false;
        }

        if(_filters['vegan'] && !meal.isVegan){
          return false;
        }
 
        if(_filters['vegetarian'] && !meal.isVegetarian){
          return false;
        }        
        return true;
      }).toList();
    });
  }


  void _toggleFavorite(String mealId){
      final exixtingIndex= _favoriteMeals.indexWhere((meal) => meal.id==mealId);

      if(exixtingIndex >=0){
        setState(() {
          _favoriteMeals.removeAt(exixtingIndex);
        });
      
      }
      else{
        setState(() {
          _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id==mealId));
        });
      }
  }

  bool _isMealFavorite(String id){
    return _favoriteMeals.any((meal) => meal.id==id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(    
      title: "DeliMeals",
      
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // primaryColor: Colors.blue
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1)
          ),
          body2: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1)
          ),
          title: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          )
        )

      ),
      initialRoute: '/',  //Initial page
      // home: CategoriesScreen(),
      routes: {
        '/':(ctx)=>TabsScreen(_favoriteMeals),
        CategoryMealScreen.routeName:(ctx)=>CategoryMealScreen(_availableMeals),
        MealDetailScreen.routeName:(ctx)=>MealDetailScreen(_toggleFavorite,_isMealFavorite),
        FiltersScreen.routeName:(ctx)=>FiltersScreen(_filters,_setFilters)
      }, 
      // onGenerateRoute: (setting){
      //   // print(setting.arguments);
      //   return MaterialPageRoute(builder: (ctx)=>MealDetailScreen(_toggleFavorite,_isMealFavorite));
      // },
      // onUnknownRoute: (setting){
      //   return MaterialPageRoute(builder: (ctx)=>CategoriesScreen());
      // },
    );
  }
}

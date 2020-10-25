import 'package:DealMeal/models/meal.dart';
import 'package:DealMeal/screens/categories_screen.dart';
import 'package:DealMeal/screens/favotites_screen.dart';
import 'package:DealMeal/widegets/main_drawer.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {

  final List<Meal> favoriteMeals;
  TabsScreen(this.favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String,Object>> _pages;

  int _selectedPageIndex=0;

  @override
  void initState() {
    _pages=[
    {'page':CategoriesScreen(),'title':'Categories'},
    {'page':FavoritesScreen(widget.favoriteMeals),'title':"My Favorite"}
  ];
    super.initState();
  }

  void _selectPage(int index){
    setState(() {
      _selectedPageIndex=index;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_pages[_selectedPageIndex]['title']),         
        ),

        drawer: MainDrawer(),


        body: _pages[_selectedPageIndex]['page'],
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          currentIndex: _selectedPageIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
            title: Text("Categories")
            ),

            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.favorite),
            title: Text("Favorites")
            )

          ],
        ),
      

      
    );
  }
}
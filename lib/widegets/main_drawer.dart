import 'package:DealMeal/screens/fiters_screen.dart';
import 'package:flutter/material.dart';
class MainDrawer extends StatelessWidget {

  Widget buidListTile(String title,IconData icon,Function tabHandler){
    return ListTile(
            leading: Icon(
              icon,
            size: 26,
            ),
            title: Text(title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold
            ),
            ),
            onTap:tabHandler
          );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,            
            child: Text("Cooking",
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 30,
              color: Theme.of(context).primaryColor
            ),
            ),
          ),
          SizedBox(height: 20,),
          
        buidListTile(
          "Meals", 
          Icons.restaurant,
          (){
            Navigator.of(context).pushReplacementNamed('/');
          }
          ),

         buidListTile("Filters",
         Icons.settings,
         (){
           Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
         }
         
         )

        ],
      ),
      
    );
  }
}
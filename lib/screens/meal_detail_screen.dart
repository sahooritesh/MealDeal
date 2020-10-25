import 'package:DealMeal/models/dummy_data.dart';
import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {

  static const routeName='/meal-datail';
  final Function toggleFavorite;
  final Function isFavorite;
  MealDetailScreen(this.toggleFavorite,this.isFavorite);

  Widget buildSectionTitle(BuildContext context, String text){
    return Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(text,
              style: TextStyle(
                fontWeight: FontWeight.bold,                
              ),
              ),
    );
  }

  Widget buildContainer(Widget child){
    return             Container(
              decoration: BoxDecoration(color: Colors.white,
              border: Border.all(color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(10)
              ),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              height: 150,
              width: 300,
              child:child ,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId=ModalRoute.of(context).settings.arguments as String;
    final selectMeal=DUMMY_MEALS.firstWhere((meal) => meal.id==mealId);

    return Scaffold(
          appBar: AppBar(title: Text(selectMeal.title)),
          body: SingleChildScrollView(
                      child: Column(
        children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.asset(selectMeal.imageUrl,
              fit: BoxFit.cover,
              ),
            ),
              buildSectionTitle(context, "Ingredients"),
              buildContainer(
                ListView.builder(
                  itemBuilder: (ctx,index)=>Card(color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10
                    ),
                    child: Text(selectMeal.ingredients[index]),
                  ),
                  ),
                  itemCount: selectMeal.ingredients.length,


                ),
              ),
              buildSectionTitle(context, "Steps"),
              buildContainer(ListView.builder(
                itemBuilder: (ctx,index)=>Column(
                                  children:[ ListTile(
                    leading: CircleAvatar(
                      child: Text('# ${(index+1)}'),
                      
                    ),
                    title: Text(selectMeal.steps[index]),
                  ),
                    Divider(),              
                  ] 
                  
                  
                  ),
                                  
                itemCount: selectMeal.steps.length,
              ))
        ],
        
      ),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(
              isFavorite(mealId)?Icons.star:Icons.star_border
            ),
            onPressed: ()=>toggleFavorite(mealId),
          ),
    );
  }
}
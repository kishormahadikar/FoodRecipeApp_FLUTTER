import 'package:flutter/material.dart';
import '../models/meals.dart';
import '../widgets/meal_screen.dart';

class FavScreen extends StatelessWidget {
  static const routeName = 'favScreen';
  List<Meal> favouriteMeals;
  FavScreen(this.favouriteMeals);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      favouriteMeals.isEmpty? 
      Container(
        child: Text('Add fav items to view here', style: TextStyle(fontSize: 30),),
      )
      : SingleChildScrollView(
        child: Container(
          child: Column(
            children: favouriteMeals.map((e) {
              return Container(
                child: MealList(
                  affordability: e.affordability,
                  complexity: e.complexity,
                  duration: e.duration,
                  id: e.id,
                  imageurl: e.imageUrl,
                  title: e.title,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

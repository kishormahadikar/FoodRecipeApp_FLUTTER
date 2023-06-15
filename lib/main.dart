import 'package:flutter/material.dart';
import 'package:mealsappnew/models/meals.dart';
import 'package:mealsappnew/screens/filterSccreen.dart';
import './screens/cat_meals_screen.dart';
import './screens/tabscreen.dart';
import './screens/meal_details_screen.dart';
import 'models/dummy_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Map<String, bool> filterss = {
    'glutenfree': false,
    'lactosefree': false,
    'veg': false,
    'vegan': false,
  };

  List<Meal> finalMeals=DUMMY_MEALS;
  List<Meal> favMeals=[];

  void toggleFav(String mealid) {
    final existingMeal = favMeals.indexWhere((element) => element.id == mealid);
    if (existingMeal >= 0) {
      setState(() {
        favMeals.removeAt(existingMeal);
      });
    } else {
      setState(() {
        favMeals.add(DUMMY_MEALS.firstWhere((element) => element.id == mealid));
      });
    }
  }

  bool isFav(String mealid) {
    return favMeals.any((element) => element.id == mealid);
  }

  void saveFilter(Map<String, bool> filterData) {
    setState(() {
      filterss = filterData;
      finalMeals = DUMMY_MEALS.where((meal) {
        if (filterss['glutenfree'] && !meal.isGlutenFree) {
          return false;
        }
        if (filterss['lactosefree'] && !meal.isLactoseFree) {
          return false;
        }
        if (filterss['veg'] && !meal.isVegetarian) {
          return false;
        }
        if (filterss['vegan'] && !meal.isVegan) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      //home:CategoryScreen(),
      routes: {
        '/': (context) => TabScreen(favMeals),
        MealScreen.routeName: (context) => MealScreen(finalMeals),
        MealDetailsScreen.routeName: (context) => MealDetailsScreen(toggleFav,isFav),
        FilterScreen.routeName: (context) => FilterScreen(saveFilter, filterss),
      },
    );
  }
}

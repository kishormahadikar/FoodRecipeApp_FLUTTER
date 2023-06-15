import 'package:flutter/material.dart';
import 'package:mealsappnew/widgets/meal_screen.dart';
import '../models/meals.dart';

class MealScreen extends StatefulWidget {
  static const routeName = './MealScreen';
  final List<Meal> finalMeals;
  MealScreen(this.finalMeals);
  @override
  State<MealScreen> createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  @override
  String title;
  List<Meal> availablemeals;
  var depCheck = false;
  void removeMeal(String mealid) {
setState(() {
      availablemeals.removeWhere((element) => element.id == mealid);

});  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if(!depCheck){
      final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final id = routeArgs['id'];
    title = routeArgs['name'];
    availablemeals = widget.finalMeals.where((element) {
      return element.categories.contains(id);
    }).toList();
    depCheck = true;}
    super.didChangeDependencies();
    
    
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: availablemeals.map((e) {
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
// import 'package:flutter/material.dart';
// import 'package:mealsappnew/widgets/meal_screen.dart';
// import '../models/meals.dart';

// class CategoryMealsScreen extends StatefulWidget {
//   static const routeName = './MealScreen';
//   final List<Meal> availableMeals;
//   CategoryMealsScreen(this.availableMeals);
//   @override
//   _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
// }

// class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
//   @override
//   List<Meal> displayedMeals;
//   String categoryTitle;
//   var _LoadedInitData = false;

//   void didChangeDependencies() {
//     if (!_LoadedInitData) {
//       final routeArgs =
//           ModalRoute.of(context).settings.arguments as Map<String, String>;
//       categoryTitle = routeArgs['name'];
//       final id = routeArgs['id'];
//       displayedMeals = widget.availableMeals.where((meal) {
//         return meal.categories.contains(id);
//       }).toList();
//       _LoadedInitData = true;
//     }
//     super.didChangeDependencies();
//   }

//   void _removeMeals(String receivedId) {
//     setState(() {
//       displayedMeals.removeWhere((mealId) => mealId.id == receivedId);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // final routeArgs =
//     //     ModalRoute.of(context).settings.arguments as Map<String, String>;
//     // final name = routeArgs['name'];
//     // final id = routeArgs['id'];
//     // final categoryMeals = DUMMY_MEALS.where((meal) {
//     //   return meal.categories.contains(id);
//     // }).toList();
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(categoryTitle),
//         ),
//         body: Container(
//           decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: NetworkImage('https://png.pngtree.com/background/20210711/original/pngtree-black-cartoon-food-picnic-psd-layered-h5-background-material-picture-image_1123500.jpg'),
//               fit: BoxFit.cover)
//             ),
//           child: ListView.builder(
//             itemBuilder: (ctx, index) {
//               return MealList(
//                   title: displayedMeals[index].title,
//                   affordability: displayedMeals[index].affordability,
//                   complexity: displayedMeals[index].complexity,
//                   imageurl: displayedMeals[index].imageUrl,
//                   duration: displayedMeals[index].duration,
//                   id: displayedMeals[index].id,
                
//               );
//             },
//             itemCount: displayedMeals.length,
//           ),
//         ));
//   }
// }

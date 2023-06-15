import 'package:flutter/material.dart';
import 'package:mealsappnew/models/dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = './MealDetailsScreen';
  final Function toggleFav;
  final Function isFav;
  MealDetailsScreen(this.toggleFav,this.isFav);
  @override
  Widget build(BuildContext context) {
    Widget headingg(String title) {
      return Column(
        children: [
          Divider(
            thickness: 3,
          ),
          SizedBox(
            height: 12,
          ),
          Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Text(title, style: TextStyle(fontSize: 25))),
          SizedBox(
            height: 12,
          ),
          Divider(
            thickness: 3,
          ),
        ],
      );
    }

    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final String routeTitle = routeArgs['name'];
    final String routeid = routeArgs['id'];
    final String routeimg = routeArgs['imageUrl'];
    final selectedMeals =
        DUMMY_MEALS.firstWhere((element) => element.id == routeid);

    return Scaffold(
        appBar: AppBar(title: Text(routeTitle)),
        body: SingleChildScrollView(
          child: Container(
              child: Column(
            children: [
              Image.network(routeimg),
              headingg('Ingredients'),
              Container(
                  height: 200,
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width / 1.05,
                  decoration: BoxDecoration(color: Colors.black54),
                  child: ListView.builder(
                    itemBuilder: ((context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              '${index + 1}. ${selectedMeals.ingredients[index]}',
                              style: TextStyle(fontSize: 17),
                            ),
                          ),
                          Divider(
                            thickness: 3,
                          )
                        ],
                      );
                    }),
                    itemCount: selectedMeals.ingredients.length,
                  )),
              headingg('Steps...'),
              Container(
                  height: 350,
                  width: MediaQuery.of(context).size.width / 1.05,
                  decoration: BoxDecoration(color: Colors.black54),
                  child: ListView.builder(
                    itemBuilder: ((context, index) {
                      return Column(
                        //mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              '${index + 1}. ${selectedMeals.steps[index]}',
                              style: TextStyle(fontSize: 19),
                            ),
                          ),
                          Divider(
                            thickness: 3,
                          )
                        ],
                      );
                    }),
                    itemCount: selectedMeals.steps.length,
                  )),
            ],
          )),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black54,
          child: Icon(
            isFav(routeid)?Icons.star : Icons.star_border_outlined,color: Colors.red,
          ),
          onPressed: () {
            toggleFav(routeid);
          },
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:mealsappnew/models/meals.dart';

class MealList extends StatelessWidget {
  static const routeName = './MealList';
  String title;
  String id;
  String imageurl;
  Affordability affordability;
  Complexity complexity;
  int duration;
  MealList(
      {this.affordability,
      this.complexity,
      this.duration,
      this.id,
      this.imageurl,
      this.title,});

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
    }
  }

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
    }
  }

  @override
  void ScreenChanger(BuildContext context, String idd, String titlee) {
    Navigator.of(context).pushNamed('./MealDetailsScreen', arguments: {
      'name': title,
      'id': id,
      'imageUrl': imageurl
    }).then((value) {
      if (value != null) {
        // removeMeal(value);
      }
    });
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
      ),
      padding: EdgeInsets.all(7),
      child: InkWell(
        onTap: (() => ScreenChanger(context, id, title)),
        splashColor: Colors.redAccent,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
          ),
          child: Column(
            children: [
              Stack(children: [
                ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    child: Image.network(
                      imageurl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 250,
                    )),
                Positioned(
                    bottom: 10,
                    left: 7,
                    child: Container(
                      padding: EdgeInsets.all(2),
                      decoration:
                          BoxDecoration(color: Colors.black26.withOpacity(0.5)),
                      child: Text(
                        title,
                        softWrap: true,
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 20),
                      ),
                    )),
              ]),
              Container(
                width: double.infinity,
                // height: 5,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.grey.shade500, Colors.grey.shade400],
                  ),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.schedule, size: 25),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '${duration} mins',
                          style: TextStyle(fontSize: 17),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.attach_money, size: 25),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          affordabilityText,
                          style: TextStyle(fontSize: 17),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.work_outline, size: 25),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          complexityText,
                          style: TextStyle(fontSize: 17),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

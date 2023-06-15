import 'package:flutter/material.dart';

class CategoryItems extends StatelessWidget {
  String title;
  Color color;
  String id;
  CategoryItems({this.color, this.title,this.id});
  @override
  void screenChange(String title, BuildContext context) {
    Navigator.of(context)
        .pushNamed('./MealScreen', arguments: {'name': title, 'id': id});
  }

  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        screenChange(title, context);
      },
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              color,
              color.withRed(200),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Container(
            padding: EdgeInsets.all(15),
            child: Text(
              title,
              softWrap: true,
              style: TextStyle(fontSize: 17),
            )),
      ),
    );
  }
}

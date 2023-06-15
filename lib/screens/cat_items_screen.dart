import 'package:flutter/material.dart';
import 'package:mealsappnew/widgets/cat_items.dart';
import '../models/dummy_data.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return GridView(
          gridDelegate:
              SliverGridDelegateWithMaxCrossAxisExtent(
                childAspectRatio: 3 / 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                maxCrossAxisExtent: 200),
                children: DUMMY_CATEGORIES.map((e) => CategoryItems(
                  color: e.color,
                  title: e.title,
                  id: e.id,
                )).toList(),
    );
  }
}

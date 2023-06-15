import 'package:flutter/material.dart';
import 'package:mealsappnew/screens/drawerScreen.dart';
import 'package:mealsappnew/screens/tabscreen.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = 'filterScreen';
  final Function saveFilter;
  Map<String, bool> currentFilter;
  FilterScreen(this.saveFilter, this.currentFilter);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  bool isGlutenFree = false;
  bool isLactoseFree = false;
  bool veg = false;
  bool vegan = false;
  @override
  void initState() {
    // TODO: implement initState
    isGlutenFree = widget.currentFilter['glutenfree'];
    isLactoseFree = widget.currentFilter['lactosefree'];
    veg = widget.currentFilter['veg'];
    vegan = widget.currentFilter['vegan'];

    super.initState();
  }

  Widget filterSwitches(
      String title, String subTitle, bool onRoff, Function sw) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(subTitle),
        value: onRoff,
        onChanged: sw);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerScreen(),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                widget.saveFilter({
                  'glutenfree': isGlutenFree,
                  'lactosefree': isLactoseFree,
                  'veg': veg,
                  'vegan': vegan,
                });
                Navigator.of(context).pushNamed('/');
              },
              icon: Icon(Icons.save))
        ],
        title: Text('Filters'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            child: Text(
              'Adjust your filters here...',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                filterSwitches(
                    'Gluten free', 'Only include gluten-free', isGlutenFree,
                    (newValue) {
                  setState(() {
                    isGlutenFree = newValue;
                  });
                }),
                filterSwitches(
                    'Lactose free', 'Only include lactose-free', isLactoseFree,
                    (newValue) {
                  setState(() {
                    isLactoseFree = newValue;
                  });
                  ;
                }),
                filterSwitches('Vegetarian', 'Only include Vegetarian', veg,
                    (newValue) {
                  setState(() {
                    veg = newValue;
                  });
                }),
                filterSwitches('Vegan', 'Only include vegan', vegan,
                    (newValue) {
                  setState(() {
                    vegan = newValue;
                  });
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}

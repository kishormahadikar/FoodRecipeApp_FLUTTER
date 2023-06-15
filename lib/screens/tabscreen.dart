import 'package:flutter/material.dart';
import 'package:mealsappnew/models/meals.dart';
import 'package:mealsappnew/screens/drawerScreen.dart';
import '../screens/cat_items_screen.dart';
import '../screens/favScreen.dart';
import '../models/dummy_data.dart';

class TabScreen extends StatefulWidget {
  static const routeName = '/tabScreen';
  List<Meal> favouriteMeals;
  TabScreen(this.favouriteMeals);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int selectedIndex = 0;
  List<Widget> _pages;
  @override
  void initState() {
    // TODO: implement initState
    _pages = [CategoryScreen(), FavScreen(widget.favouriteMeals)];
    super.initState();
  }

  void _selectedPage(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawerScreen(),
        appBar: AppBar(
          title: Text(selectedIndex == 0 ? 'Categories' : 'Favourites'),
        ),
        body: _pages[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          elevation: 7,
          onTap: _selectedPage,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Favourite',
            ),
          ],
        ));
  }
}

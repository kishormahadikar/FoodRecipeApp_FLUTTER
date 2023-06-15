import 'package:flutter/material.dart';

class DrawerScreen extends StatelessWidget {
  @override
  Widget TileBuilder(String text, IconData icon, Function lodaVro) {
    return ListTile(
      onTap: lodaVro,
      leading: Icon(icon, size: 26),
      title: Text(
        text,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black54,
      child: Container(
        child: Column(
          children: [
            Container(
            height: 150,
            color: Colors.red,
            width: double.infinity,
            padding: EdgeInsets.all(15),
            alignment: Alignment.centerLeft,
            child: Text(
              'Cooking up',
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 40),
            ),
              ),
            TileBuilder('Meals', Icons.restaurant, () {
              Navigator.of(context).pushReplacementNamed('/');
            }),
            
            TileBuilder('Filters', Icons.settings, () {
              Navigator.of(context).pushReplacementNamed('filterScreen');
            }),
          ],
        ),
      ),
    );
  }
}

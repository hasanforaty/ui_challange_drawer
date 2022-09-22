import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blueAccent,
      child: SafeArea(
        child: Theme(
          data: ThemeData(brightness: Brightness.dark),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.asset(
                'assets/flutter_europe_white.png',
                width: 200,
              ),
              const ListTile(
                leading: Icon(Icons.new_releases),
                title: Text('News'),
              ),
              const ListTile(
                leading: Icon(Icons.star),
                title: Text('Favourites'),
              ),
              const ListTile(
                leading: Icon(Icons.map),
                title: Text('Map'),
              ),
              const ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
              ),
              const ListTile(
                leading: Icon(Icons.person),
                title: Text('Profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

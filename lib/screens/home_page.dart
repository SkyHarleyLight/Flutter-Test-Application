import 'package:flutter/material.dart';
import 'package:flutter_app/components/CustomAnimatedContainer.dart';
import 'dart:math';

import 'package:flutter_app/components/CustomNavigationBar.dart';
import 'package:flutter_app/components/ItemList.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// Default value of color that will be changed after tapping the screen
  Color _color = Colors.white;

  /// The index of selected bottom navigation menu item used to change the screen
  int _selectedIndex = 0;

  /// The list displayed in the ListView on the second screen
  List<String> _months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "November",
    "October",
    "December"
  ];

  /// The function that returns the list of screen widgets
  List<Widget> _getScreens() {
    return <Widget>[
      CustomAnimatedContainer(
        color: _color,
        child: Text(
          'Hey there',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      CustomAnimatedContainer(
        color: _color,
        child: ItemList(
          list: _months,
        ),
      ),
    ];
  }

  /// The function that changes current index to recently selected
  /// bottom navigation menu item index
  void _onItemSelected(int index) {
    setState(() => _selectedIndex = index);
  }

  /// The function that generates a random color to be displayed on
  /// the background of the application
  void _randomColor() {
    setState(() => _color =
        Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: Key("gestureDetector"),
      onTap: _randomColor,
      child: Scaffold(
          body: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    backgroundColor: Colors.blue,
                    expandedHeight: 200,
                    floating: false,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      title: Text(widget.title,
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                      background: Image(
                        image: AssetImage('assets/images/flutter_logo.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ];
              },
              body: Center(
                child: _getScreens().elementAt(_selectedIndex),
              )),
          bottomNavigationBar: CustomNavigationBar(
            items: [
              GButton(
                key: Key("homeButton"),
                icon: Icons.home,
                text: "Home",
              ),
              GButton(
                key: Key("listViewButton"),
                icon: Icons.view_headline,
                text: "ListView",
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: _color,
            onItemSelected: _onItemSelected,
          )),
    );
  }
}

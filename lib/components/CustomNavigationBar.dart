import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class CustomNavigationBar extends StatefulWidget {
  CustomNavigationBar({Key key, this.currentIndex, this.onItemSelected, this.items, this.selectedItemColor}) : super(key: key);

  final int currentIndex;
  final Function onItemSelected;
  final List<GButton> items;
  final Color selectedItemColor;

  @override
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 8.0),
          child: GNav(
            gap: 8,
            activeColor: widget.selectedItemColor.withBlue(50).withGreen(10),
            iconSize: 24,
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 5),
            duration: Duration(milliseconds: 600),
            tabBackgroundColor: widget.selectedItemColor.withOpacity(.2),
            tabs: widget.items,
            selectedIndex: widget.currentIndex,
            onTabChange: widget.onItemSelected,
          ),
        ),
      ),
    );
  }
}

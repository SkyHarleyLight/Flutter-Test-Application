import 'package:flutter/material.dart';

class ItemList extends StatelessWidget {
  ItemList({Key key, this.list}) : super(key: key);

  final List list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list.length,
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
        itemBuilder: (context, index) {
          return Card(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 17.0),
              height: 70,
              child: new Text(
                list[index],
                style: TextStyle(fontSize: 25),
              ),
            ),
          );
        });
  }
}

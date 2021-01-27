import 'package:flutter/material.dart';

class CustomAnimatedContainer extends StatelessWidget {
  CustomAnimatedContainer({Key key, this.child, this.color}) : super(key: key);

  final Widget child;
  final Color color;
  final Key screenKey = new Key("screenKey");

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        key: screenKey,
        decoration: BoxDecoration(color: color),
        duration: Duration(milliseconds: 600),
        child: Center(
          child: child
        )
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_app/components/CustomAnimatedContainer.dart';
import 'package:flutter_app/components/CustomNavigationBar.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app/main.dart';

void main() {
  testWidgets('Widgets are visible', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    expect(find.byType(CustomAnimatedContainer), findsOneWidget);
    expect(find.byType(CustomNavigationBar), findsOneWidget);
    expect(find.byType(NestedScrollView), findsOneWidget);
    expect(find.byType(SliverAppBar), findsOneWidget);
  });

  testWidgets('Backgound color changing test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    Iterable<Widget> widgetList = tester.widgetList(find.byKey(Key("screenKey")));
    for(Widget widget in widgetList){
      expect(((widget as AnimatedContainer).decoration as BoxDecoration).color, Colors.white);
    }
    await tester.tap(find.byKey(Key("gestureDetector")));
    await tester.pump();
    widgetList = tester.widgetList(find.byKey(Key("screenKey")));
    for(Widget widget in widgetList){
      expect(((widget as AnimatedContainer).decoration as BoxDecoration).color == Colors.white, false);
    }
  });
}

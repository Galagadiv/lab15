import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab15/main.dart';

void main() {
  group('MyHomePage Tests', () {
    test('Test function calculateFunction', () {
      final homePageState = MyHomePageState();

      expect(homePageState.calculateFunction(2), closeTo(0.25, 0.001));//перевірка на очікуване значення 1)
      expect(homePageState.calculateFunction(3), closeTo(0.222, 0.001)); //перевірка на очікуване значення 2)
      expect(() => homePageState.calculateFunction(0), throwsArgumentError);
    });

    testWidgets('Check AppBar title', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());

      expect(
        find.text("IPZ: Illa's final Flutter App"),
        findsOneWidget,
      );
    });

    testWidgets('Check FloatingActionButton icon', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());

      final fabIcon = find.byIcon(Icons.pets);
      expect(fabIcon, findsOneWidget);
    });

    testWidgets('Check counter increments by 2', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());

      expect(find.text('0'), findsOneWidget);

      final fab = find.byType(FloatingActionButton);
      await tester.tap(fab);
      await tester.pump();

      expect(find.text('2'), findsOneWidget);
    });
  });
}

// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:NitipBeli/ui/view/splash_screen.dart';
import 'package:NitipBeli/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget testWidget = new MediaQuery(
    data: new MediaQueryData(),
    child: new MaterialApp(
      home: new SplashScreen(),
    ),
  );
  group('Splash Screen', () {
    testWidgets('Splash did show app logo', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(testWidget);

      final findAppSymbol = find.text(appName);
      // Verify that apps name is displayed
      expect(findAppSymbol, findsOneWidget);
    });
  });
}

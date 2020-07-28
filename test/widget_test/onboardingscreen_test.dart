// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:NitipBeli/ui/shared/button/primary_button.dart';
import 'package:NitipBeli/ui/view/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget testWidget = new MediaQuery(
    data: new MediaQueryData(),
    child: new MaterialApp(
      home: new OnBoardingScreen(),
    ),
  );
  group('Onboard Screen', () {
    testWidgets('Did show swiper', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(testWidget);
      final swiperWidget = find.byType(Swiper);
      // Verify that apps name is displayed
      expect(swiperWidget, findsOneWidget);
    });
    testWidgets(
        'Did show 1 icons and 3 (2 desc text and 1 button) for swiper content',
        (WidgetTester tester) async {
      await tester.pumpWidget(testWidget);
      final iconWidget = find.byType(Icon);

      final descText = find.byType(Text);
      expect(iconWidget, findsOneWidget);

      expect(
        descText,
        findsNWidgets(3),
      );
    });
    testWidgets('Did show a skip button and can tapped',
        (WidgetTester tester) async {
      await tester.pumpWidget(testWidget);
      final skipButton = find.widgetWithText(PrimaryButton, "Lewati");
      expect(skipButton, findsOneWidget);
      // Research how to mock navigator in test then uncomment line below
      // tester.tap(skipButton);
    });
  });
}

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:hello_world/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test 1', () {
    testWidgets('tap on the floating action button, verify counter',
            (tester) async {
          app.main();
          await tester.pumpAndSettle();

          // Verify the counter starts at 0.
          expect(find.text('0'), findsOneWidget);

          // Finds the floating action button to tap on.
          final Finder fab = find.byTooltip('Increment');

          // Emulate a tap on the floating action button.
          await tester.tap(fab);
          await Future.delayed(Duration(seconds: 2));
          await tester.tap(fab);
          await Future.delayed(Duration(seconds: 2));
          await tester.tap(fab);
          await Future.delayed(Duration(seconds: 2));
          await tester.tap(fab);
          await Future.delayed(Duration(seconds: 2));
          await tester.tap(fab);
          await Future.delayed(Duration(seconds: 2));
          await tester.tap(fab);
          await Future.delayed(Duration(seconds: 2));

          // Trigger a frame.
          await tester.pumpAndSettle();

          // Verify the counter increments by 1.
          expect(find.text('5'), findsOneWidget);
        });


    testWidgets('tap twice on the floating action button, verify counter',
            (tester) async {
          app.main();
          await tester.pumpAndSettle();

          // Verify the counter starts at 0.
          expect(find.text('0'), findsOneWidget);

          // Finds the floating action button to tap on.
          final Finder fab = find.byTooltip('Increment');

          // Emulate a tap on the floating action button.
          await tester.tap(fab);
          await Future.delayed(Duration(seconds: 2));
          await tester.tap(fab);
          // Trigger a frame.
          await tester.pumpAndSettle();

          // Verify the counter increments by 1.
          expect(find.text('2'), findsOneWidget);
        });
  });
}
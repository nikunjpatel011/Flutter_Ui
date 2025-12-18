import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:nikunj/main.dart';

void
main() {
  testWidgets(
    'Bottom Navigation loads correctly on Home Screen',
    (
      WidgetTester tester,
    ) async {
      // Load the app
      await tester.pumpWidget(
        const MaterialApp(
          home: MainScreen(),
        ),
      );

      // Wait for widget tree to settle
      await tester.pumpAndSettle();

      // Check if all bottom nav items appear
      expect(
        find.text(
          'Home',
        ),
        findsOneWidget,
      );
      expect(
        find.text(
          'Leads',
        ),
        findsOneWidget,
      );
      expect(
        find.text(
          'Campaigns',
        ),
        findsOneWidget,
      );
      expect(
        find.text(
          'Account',
        ),
        findsOneWidget,
      );

      // Optionally check for icons
      expect(
        find.byIcon(
          Icons.home,
        ),
        findsOneWidget,
      );
      expect(
        find.byIcon(
          Icons.people_alt_outlined,
        ),
        findsOneWidget,
      );
      expect(
        find.byIcon(
          Icons.bar_chart,
        ),
        findsOneWidget,
      );
      expect(
        find.byIcon(
          Icons.person_outline,
        ),
        findsOneWidget,
      );
    },
  );
}

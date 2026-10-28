import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:medminder_dashboard/main.dart';

void main() {
  testWidgets('renders the dashboard sections and medication schedule', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(1280, 900);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const MedMinderApp());
    await tester.pumpAndSettle();

    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.text('Good morning, Sarah'), findsOneWidget);
    expect(find.text("TODAY'S MEDICATION"), findsOneWidget);
    expect(find.text('2 of 3 doses taken today'), findsOneWidget);
    expect(find.text("Today's schedule"), findsOneWidget);
    expect(find.text('Vitamin D3'), findsOneWidget);
    expect(find.text('Omega-3'), findsOneWidget);
    expect(find.text('Magnesium'), findsOneWidget);
    expect(find.text('Weekly adherence'), findsOneWidget);
    expect(find.byType(Column), findsWidgets);
    expect(find.byType(Row), findsWidgets);
    expect(tester.takeException(), isNull);
  });

  testWidgets(
    'fits a narrow phone viewport and scrolls to the full dashboard',
    (WidgetTester tester) async {
      tester.view.physicalSize = const Size(320, 720);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(const MedMinderApp());
      await tester.pumpAndSettle();

      expect(find.byType(SingleChildScrollView), findsOneWidget);
      expect(find.text('Reminder'), findsOneWidget);
      expect(find.text('Medicine'), findsOneWidget);
      expect(find.text('Hydration'), findsOneWidget);
      expect(find.text('Report'), findsOneWidget);
      expect(tester.takeException(), isNull);

      await tester.drag(
        find.byType(SingleChildScrollView),
        const Offset(0, -900),
      );
      await tester.pumpAndSettle();

      expect(find.text('Weekly adherence'), findsOneWidget);
      expect(tester.takeException(), isNull);
    },
  );

  testWidgets('quick action gives local feedback', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const MedMinderApp());
    await tester.pumpAndSettle();

    await tester.tap(find.text('Reminder'));
    await tester.pumpAndSettle();

    expect(find.text('Reminder selected'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}

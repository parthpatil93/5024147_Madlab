import 'package:flutter_test/flutter_test.dart';
import 'package:medminder_navigation/main.dart';

void main() {
  testWidgets('medicine card opens details and back returns home', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MedMinderNavigationApp());

    await tester.tap(find.byKey(const Key('medicine-card-Vitamin D')));
    await tester.pumpAndSettle();

    expect(find.text('Reminder details'), findsOneWidget);
    expect(find.text('Vitamin D'), findsOneWidget);

    await tester.tap(find.byKey(const Key('back-button')));
    await tester.pumpAndSettle();

    expect(find.text('Your routine, at a glance.'), findsOneWidget);
  });

  testWidgets('named route opens the registered medicine detail screen', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MedMinderNavigationApp());

    await tester.tap(find.byKey(const Key('named-route-button')));
    await tester.pumpAndSettle();

    expect(find.text('Reminder details'), findsOneWidget);
    expect(find.byKey(const Key('medicine-detail-name')), findsOneWidget);
  });

  testWidgets('tap, double-tap, and long-press show feedback', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MedMinderNavigationApp());
    final gestureCard = find.byKey(const Key('gesture-card'));

    await tester.tap(gestureCard);
    await tester.pump();
    expect(find.text('Routine shortcut tapped.'), findsOneWidget);

    await tester.doubleTap(gestureCard);
    await tester.pump();
    expect(find.text('Routine shortcut saved.'), findsOneWidget);

    await tester.longPress(gestureCard);
    await tester.pump();
    expect(
      find.text('A steady routine can make reminders easier to follow.'),
      findsOneWidget,
    );
  });
}
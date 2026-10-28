import 'package:flutter_test/flutter_test.dart';
import 'package:medminder_forms/main.dart';

void main() {
  testWidgets('shows required field and consent errors on empty submit', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MedMinderApp());

    await tester.tap(find.byKey(const Key('submit-button')));
    await tester.pumpAndSettle();

    expect(find.text('Enter your name.'), findsOneWidget);
    expect(find.text('Enter your email address.'), findsOneWidget);
    expect(find.text('Enter a password.'), findsOneWidget);
    expect(find.text('Consent is required.'), findsOneWidget);
    expect(
      find.text('Please correct the highlighted fields to continue.'),
      findsOneWidget,
    );
  });

  testWidgets('rejects a malformed email and a short password', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MedMinderApp());

    await tester.enterText(find.byKey(const Key('name-field')), 'Alex Morgan');
    await tester.enterText(find.byKey(const Key('email-field')), 'not-an-email');
    await tester.enterText(find.byKey(const Key('password-field')), 'short');
    await tester.tap(find.byKey(const Key('consent-checkbox')));
    await tester.tap(find.byKey(const Key('submit-button')));
    await tester.pumpAndSettle();

    expect(find.text('Enter a valid email address.'), findsOneWidget);
    expect(find.text('Use at least 8 characters.'), findsOneWidget);
    expect(find.byKey(const Key('success-message')), findsNothing);
  });

  testWidgets('accepts valid input and clears the masked password', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MedMinderApp());

    await tester.enterText(find.byKey(const Key('name-field')), 'Alex Morgan');
    await tester.enterText(
      find.byKey(const Key('email-field')),
      'alex@example.com',
    );
    await tester.enterText(
      find.byKey(const Key('password-field')),
      'safe-demo-password',
    );
    await tester.tap(find.byKey(const Key('consent-checkbox')));
    await tester.tap(find.byKey(const Key('submit-button')));
    await tester.pumpAndSettle();

    expect(
      find.text('Your local demo profile is ready, Alex Morgan.'),
      findsOneWidget,
    );
    expect(
      find.text('Profile ready for Alex Morgan. Nothing was saved or sent.'),
      findsOneWidget,
    );
    expect(
      tester.widget<TextFormField>(find.byKey(const Key('password-field')))
          .controller
          ?.text,
      isEmpty,
    );
  });
}
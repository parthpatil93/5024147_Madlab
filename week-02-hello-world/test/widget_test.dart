import 'package:flutter_test/flutter_test.dart';
import 'package:hello_world/main.dart';

void main() {
  testWidgets('shows the practical and updates the message on tap', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const HelloWorldApp());

    expect(find.text('Hello World'), findsOneWidget);
    expect(find.text('Practical 2: Hello World'), findsOneWidget);
    expect(find.text('Press the button to say hello.'), findsOneWidget);

    await tester.tap(find.byKey(const Key('hello-world-button')));
    await tester.pump();

    expect(find.text('You pressed the button 1 time.'), findsOneWidget);
  });
}
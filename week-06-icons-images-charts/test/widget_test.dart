import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medminder_analytics/main.dart';

void main() {
  testWidgets('renders the local illustration and labelled sample chart', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MedMinderAnalyticsApp());
    await tester.pumpAndSettle();

    expect(find.text('Your week, in focus'), findsOneWidget);
    expect(find.byKey(const Key('local-illustration')), findsOneWidget);
    expect(find.byType(SvgPicture), findsOneWidget);
    expect(find.byType(BarChart), findsOneWidget);
    expect(find.text('Weekly adherence'), findsOneWidget);
    expect(find.text('Mon'), findsOneWidget);
    expect(find.text('Sun'), findsOneWidget);
    expect(find.byKey(const Key('sample-data-disclaimer')), findsOneWidget);
    expect(find.byKey(const Key('network-image')), findsNothing);
    expect(tester.takeException(), isNull);
  });

  testWidgets('loads the optional network image only after user action', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MedMinderAnalyticsApp());
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('network-image-toggle')));
    await tester.pump();

    expect(find.byKey(const Key('network-image')), findsOneWidget);
  });
}
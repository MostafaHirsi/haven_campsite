// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:haven_campsite/main.dart';
import 'package:haven_campsite/providers/http_provider.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';

import '../mocks.dart';

void main() {
  HttpProvider mockHttpProvider;

  setUp(() {
    mockHttpProvider = MockHttpProvider();
    when(
      mockHttpProvider.get('/tech+test+json.json'),
    ).thenAnswer(
      (response) => Future.value(Response(
          '[{"familyid": 1, "groupsize": 6, "caravan": 5 },{"familyid": 8, "groupsize": 2, "caravan": 3 }]',
          200)),
    );
  });

  testWidgets('Clicking on start button will begin and complete haven journey', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp(mockHttpProvider));

    final testKey = Key('StartButton');
    expect(find.text('Time taken to transport groups : -- minutes'),
        findsOneWidget);

    await tester.tap(find.byKey(testKey));
    await tester.pumpAndSettle();

    expectLater(find.text('Time taken to transport groups : 8 minutes'),
        findsOneWidget);
  });
}

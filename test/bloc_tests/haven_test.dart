import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:haven_campsite/blocs/haven_bloc/haven_bloc.dart';

import 'package:haven_campsite/main.dart';
import 'package:haven_campsite/providers/http_provider.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';

import '../mocks.dart';

void main() {
  HavenBloc havenBloc;
  HttpProvider mockHttpProvider;

  setUp(() {
    mockHttpProvider = MockHttpProvider();
    havenBloc = HavenBloc(mockHttpProvider);
  });

  test('initial state is correct', () {
    expect(havenBloc.state, HavenInitial());
  });

  test('haven camp started, should yield started and completed states', () {
    havenBloc.add(StartEvent());
    when(
      mockHttpProvider.get('/tech+test+json.json'),
    ).thenAnswer(
      (response) => Future.value(Response(
          '[{"familyid": 1, "groupsize": 6, "caravan": 5 },{"familyid": 8, "groupsize": 2, "caravan": 3 }]',
          200)),
    );
    expect(havenBloc.state, HavenInitial());
    expectLater(
      havenBloc,
      emitsInOrder([
        HavenStarted(),
        HavenComplete(8),
      ]),
    );
  });

  test('haven camp started, http provider broken, should yield error state',
      () {
    havenBloc.add(StartEvent());
    when(
      mockHttpProvider.get('/tech+test+json.json'),
    ).thenThrow(Exception('Provider broken'));
    expect(havenBloc.state, HavenInitial());
    expectLater(
      havenBloc,
      emitsInOrder([
        HavenStarted(),
        HavenError('Exception: Provider broken')
      ]),
    );
  });
}

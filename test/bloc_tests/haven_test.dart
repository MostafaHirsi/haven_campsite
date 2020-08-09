import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:haven_campsite/blocs/haven_bloc/haven_bloc.dart';

import 'package:haven_campsite/main.dart';
import 'package:haven_campsite/providers/http_provider.dart';

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

}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'haven_event.dart';
part 'haven_state.dart';

class HavenBloc extends Bloc<HavenEvent, HavenState> {
  
  HavenBloc() : super(HavenInitial());

  @override
  Stream<HavenState> mapEventToState(
    HavenEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}

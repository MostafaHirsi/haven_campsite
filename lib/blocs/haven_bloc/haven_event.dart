part of 'haven_bloc.dart';

abstract class HavenEvent extends Equatable {
  const HavenEvent();
}

class StartEvent extends HavenEvent {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

part of 'haven_bloc.dart';

abstract class HavenState extends Equatable {
  const HavenState();
}

class HavenInitial extends HavenState {
  @override
  List<Object> get props => [];
}

class HavenError extends HavenState {
  final String error;

  HavenError(this.error);
  @override
  List<Object> get props => [error];
}

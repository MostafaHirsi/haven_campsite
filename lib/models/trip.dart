import 'package:equatable/equatable.dart';

class TripModel extends Equatable {
  final int familyId;
  final List<int> route;

  TripModel({this.familyId, this.route});

  TripModel copyWith({int familyId, List<int> route}) {
    return TripModel(
      familyId: familyId ?? this.familyId,
      route: route ?? this.route,
    );
  }

  @override
  List<Object> get props => [familyId, route];
}

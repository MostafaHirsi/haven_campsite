import 'package:equatable/equatable.dart';

class RouteModel extends Equatable {
  final List<int> route;

  RouteModel({this.route});

  RouteModel copyWith({List<int> route}) {
    return RouteModel(
      route: route ?? this.route,
    );
  }

  @override
  List<Object> get props => [route];
}

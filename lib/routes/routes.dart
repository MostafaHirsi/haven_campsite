import 'package:haven_campsite/models/group.dart';
import 'package:haven_campsite/models/route.dart';

class Routes {
  static RouteModel routeA = RouteModel(
    route: [1, 13, 12, 11, 10, 9, 8],
  );

  static RouteModel routeB = RouteModel(
    route: [1, 2, 3, 4, 5, 6, 7, 8],
  );

  static RouteModel routeC = RouteModel(
    route: [1, 13, 16, 15, 14, 8],
  );

  static RouteModel pickRoute(GroupModel groupModel) {
    RouteModel routeModel;
    if (routeA.route.contains(groupModel.caravan)) {
      routeModel.copyWith(route: routeA.route);
    }

    if (routeB.route.contains(groupModel.caravan)) {
      int noOfRoutesForA = routeA.route.indexOf(groupModel.caravan);
      int noOfRoutesForB = routeB.route.indexOf(groupModel.caravan);
      if (noOfRoutesForA > noOfRoutesForB) {
        routeModel.copyWith(route: routeB.route);
      }
    }

    if (routeA.route.contains(groupModel.caravan)) {
      int noOfRoutesForA = routeA.route.indexOf(groupModel.caravan);
      int noOfRoutesForC = routeC.route.indexOf(groupModel.caravan);
      if (noOfRoutesForA > noOfRoutesForC) {
        routeModel.copyWith(route: routeC.route);
      }
    }
    return routeModel;
  }
}

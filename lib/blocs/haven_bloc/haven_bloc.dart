import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:haven_campsite/models/group.dart';
import 'package:haven_campsite/models/route.dart';
import 'package:haven_campsite/providers/http_provider.dart';
import 'package:haven_campsite/routes/routes.dart';
import 'package:http/http.dart';

part 'haven_event.dart';
part 'haven_state.dart';

class HavenBloc extends Bloc<HavenEvent, HavenState> {
  final HttpProvider httpProvider;
  HavenBloc(this.httpProvider) : super(HavenInitial());

  @override
  Stream<HavenState> mapEventToState(
    HavenEvent event,
  ) async* {
    try {
      if (event is StartEvent) {
        yield (HavenStarted());
        List<GroupModel> groupModels = await serialiseData();
        int minutesTaken = calculateRouteLength(groupModels);

        yield (HavenComplete(minutesTaken));
      }
    } catch (e) {
      yield (HavenError(e.toString()));
    }
  }

  int calculateRouteLength(List<GroupModel> groupModels) {
      int groupsLength = groupModels.length;
    Queue groupQueue = Queue.from(groupModels);
    int minutesTaken = 0;
    for (var index = 0; index < groupsLength; index++) {
      GroupModel currentGroup = groupQueue.removeFirst();
      RouteModel routeModel = Routes.pickRoute(currentGroup);
      int stops = routeModel.route.indexOf(currentGroup.caravan);
      minutesTaken += stops;
    }
    
    return minutesTaken;
  }

  Future<List<GroupModel>> serialiseData() async {
    Response response = await httpProvider.get('/tech+test+json.json');
    List jsonList = jsonDecode(response.body);
    List<GroupModel> groupModels =
        jsonList.map((json) => GroupModel.fromJson(json)).toList();
    return groupModels;
  }
}

import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:haven_campsite/models/group.dart';
import 'package:haven_campsite/models/route.dart';
import 'package:haven_campsite/providers/http_provider.dart';
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
      }
    } catch (e) {
      yield (HavenError(e.toString()));
    }
  }

  Future<List<GroupModel>> serialiseData() async {
    Response response = await httpProvider.get('/tech+test+json.json');
    List<Map<String, dynamic>> jsonList = jsonDecode(response.body);
    List<GroupModel> groupModels =
        jsonList.map((json) => GroupModel.fromJson(json));
    return groupModels;
  }
}

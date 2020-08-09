import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as flutterBloc;
import 'package:haven_campsite/blocs/haven_bloc/haven_bloc.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    HavenBloc havenBloc = flutterBloc.BlocProvider.of(context);
    return flutterBloc.BlocBuilder(
      bloc: havenBloc,
      builder: (context, state) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (state is HavenInitial)
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Text('Time taken to transport groups : -- minutes'),
                ),
              if (state is HavenComplete)
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Text('Time taken to transport groups : ${state.minutesTaken} minutes'),
                ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                alignment: Alignment.center,
                child: RaisedButton(
                  key: Key('StartButton'),
                  onPressed: state is HavenInitial || state is HavenError
                      ? () {
                          havenBloc.add(StartEvent());
                        }
                      : null,
                  child: Text('Start Journey'),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

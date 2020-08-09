import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as bloc;
import 'package:haven_campsite/blocs/haven_bloc/haven_bloc.dart';
import 'package:haven_campsite/providers/http_provider.dart';

import 'pages/home_page.dart';

void main() {
  HttpProvider httpProvider = HttpProvider();
  runApp(MyApp(
    httpProvider,
  ));
}

class MyApp extends StatelessWidget {
  final HttpProvider httpProvider;

  const MyApp(this.httpProvider, {Key key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: bloc.BlocProvider<HavenBloc>(
        create: (context) => HavenBloc(httpProvider),
        child: MyHomePage(),
      ),
    );
  }
}

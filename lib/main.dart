import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tube/api.dart';
import 'package:flutter_tube/blocos/videos_bloco.dart';
import 'package:flutter_tube/screens/home.dart';

void main() {

  Api api = Api();
  api.search('eletro');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      blocs: [Bloc((i) => VideosBloc())],
      dependencies: [],
      child: MaterialApp(
        title: 'FlutterTube',
        debugShowCheckedModeBanner: false,
        home: const Home(),
      ),
    );
  }
}

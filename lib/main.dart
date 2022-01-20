import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'bloc/bloc_observe.dart';
import 'layout/bottom_navigation_bar.dart';


void main() {
  BlocOverrides.runZoned(
    () {
      runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
  
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home:  BottomBar(),
      debugShowCheckedModeBanner: false,
    );
  }
}


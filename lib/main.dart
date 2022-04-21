import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:test/pages/launcher.dart';
import 'bloc/bloc_observe.dart';
import 'layout/bottom_navigation_bar.dart';


void main() {
  BlocOverrides.runZoned(
    () {
      AwesomeNotifications().initialize(
      null,
      [NotificationChannel(
        channelKey: 'basic_channel', 
        channelName: 'Basic_notification', 
        defaultColor: Colors.teal,
        importance: NotificationImportance.High,
        channelShowBadge: true,
        channelDescription: '',
        )
      ],
  );
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
      home:  MyTask(),
      debugShowCheckedModeBanner: false,
    );
  }
}


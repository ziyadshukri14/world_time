import 'package:flutter/material.dart';
import 'package:world_time_apps/pages/choose_location.dart';
import 'package:world_time_apps/pages/home.dart';
import 'package:world_time_apps/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
    },
    initialRoute: '/',
  ));
}

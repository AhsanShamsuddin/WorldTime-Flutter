import 'package:WorldTimeApp/pages/choose_location.dart';
import 'package:WorldTimeApp/pages/home.dart';
import 'package:WorldTimeApp/pages/loading.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home' : (context) => Home(),
      '/location' : (context) => ChooseLocation()
    },
  ));
}
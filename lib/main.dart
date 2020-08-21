import 'package:flutter/material.dart';
import 'package:worldtime/Pages/choose_location.dart';
import 'package:worldtime/Pages/loading.dart';
import 'package:worldtime/pages/home.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/",
    routes: {
      "/" : (context) => Loading(),
      "/home" : (context) => Home(),
      "/location" : (context) => ChooseLocation()
    },
  ));
}




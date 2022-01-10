import 'package:flutter/material.dart';
import 'package:platzi_trips_avanzado/platzi_trips.dart';
import 'platzi_trips_cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Trip',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: PlatziTrips()
    );
  }
}
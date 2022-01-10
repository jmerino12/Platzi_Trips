import 'package:flutter/material.dart';
import 'package:platzi_trips_avanzado/Place/ui/screens/home_trips.dart';
import 'package:platzi_trips_avanzado/Place/ui/screens/search_trips.dart';
import 'package:platzi_trips_avanzado/platzi_trips_cupertino.dart';
import 'dart:io' show Platform;
import 'User/ui/screens/profile_trips.dart';

class PlatziTrips extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PlatziTrips();
  }
}

class _PlatziTrips extends State<PlatziTrips> {
  int indexScreen = 0;

  final List<Widget> screens = [HomeTrips(), SearchTrips(), ProfileTrips()];

  void onTapTapped(int index) {
    setState(() {
      indexScreen = index;
    });
  }

  Widget BottomNavigation() {
    if (Platform.isAndroid) {
      return BottomNavigationBar(
        currentIndex: indexScreen,
        onTap: onTapTapped,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "")
        ],
      );
    } else {
      return PlatziTripsCupertino();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[indexScreen],
      bottomNavigationBar: Theme(
          data: Theme.of(context)
              .copyWith(canvasColor: Colors.white, primaryColor: Colors.purple),
          child: BottomNavigation()
      ),
    );
  }
}
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:platzi_trips_avanzado/widgets/gradient_back.dart';
import 'package:platzi_trips_avanzado/widgets/title_header.dart';

class AddPlaceScreen extends StatefulWidget {
  File? image;

  AddPlaceScreen({Key? key, required this.image});

  @override
  State<StatefulWidget> createState() {
    return _AddPlaceScreen();
  }
}

class _AddPlaceScreen extends State<AddPlaceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GradientBack(height: 300),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 25, left: 5),
                child: SizedBox(
                  height: 45,
                  width: 45,
                  child: IconButton(
                      icon: const Icon(
                        Icons.keyboard_arrow_left,
                        color: Colors.white,
                        size: 45,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ),
              ),
              Flexible(
                  child: Container(
                padding: const EdgeInsets.only(top: 45, left: 20, right: 10),
                child: TitleHeader(title: "Add a new Place"),
              ))
            ],
          )
        ],
      ),
    );
  }
}

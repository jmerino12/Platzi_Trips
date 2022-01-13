import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platzi_trips_avanzado/Place/ui/widgets/card_image.dart';
import 'package:platzi_trips_avanzado/Place/ui/widgets/title_input_locaction.dart';
import 'package:platzi_trips_avanzado/widgets/button_purple.dart';
import 'package:platzi_trips_avanzado/widgets/gradient_back.dart';
import 'package:platzi_trips_avanzado/widgets/text_input.dart';
import 'package:platzi_trips_avanzado/widgets/title_header.dart';

class AddPlaceScreen extends StatefulWidget {
  File? image;

  AddPlaceScreen({Key? key, this.image});

  @override
  State<StatefulWidget> createState() {
    return _AddPlaceScreen();
  }
}

class _AddPlaceScreen extends State<AddPlaceScreen> {
  @override
  Widget build(BuildContext context) {
    final _controllerTitlePlace = TextEditingController();
    final _controllerDescriptionPlace = TextEditingController();
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
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 120, bottom: 20),
            child: ListView(
              children: [
                Container(
                  alignment: Alignment.center,
                  child: CardImage(
                    pathImage: "assets/img/beach_palm.jpeg",
                    iconData: Icons.camera,
                    width: 350,
                    height: 250,
                    onPressed: () {},
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20, top: 20),
                  child: TextInput(
                      hintText: "Title",
                      inputType: TextInputType.text,
                      maxLines: 1,
                      controller: _controllerTitlePlace),
                ),
                TextInput(
                    hintText: "Description",
                    inputType: TextInputType.multiline,
                    controller: _controllerDescriptionPlace,
                    maxLines: 4),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: TextInputLocation(
                    hintText: "Add location",
                    iconData: Icons.location_on,
                  ),
                ),
                Container(
                  width: 70,
                  child: ButtonPurple(buttonText: "Add Place", onPress: () {}),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

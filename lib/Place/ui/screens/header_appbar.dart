import 'package:flutter/material.dart';
import 'package:platzi_trips_avanzado/Place/ui/widgets/card_image_list.dart';
import 'package:platzi_trips_avanzado/widgets/gradient_back.dart';


class HeaderAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        GradientBack("Bienvenido"),
        CardImageList()
      ],
    );
  }

}
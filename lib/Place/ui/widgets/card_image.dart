import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platzi_trips_avanzado/widgets/floating_action_button_green.dart';

class CardImage extends StatelessWidget {
  final double height;
  final double width;
  final double? marginLeft;
  final double? marginTop;
  final VoidCallback onPressed;
  final IconData iconData;
  final String? pathImage;
  XFile? fileImage;
  bool internet;

  CardImage(
      {Key? key,
      required this.pathImage,
      required this.width,
      required this.height,
      required this.onPressed,
      required this.iconData,
      this.fileImage,
      this.marginLeft,
      this.marginTop,
      this.internet = true});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var card;
    if (pathImage != null) {
      card = Container(
        height: height,
        width: width,
        margin: EdgeInsets.only(left: marginLeft ?? 0, top: marginTop ?? 0),
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(pathImage!)),
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            shape: BoxShape.rectangle,
            boxShadow: const <BoxShadow>[
              BoxShadow(
                  color: Colors.black38,
                  blurRadius: 15.0,
                  offset: Offset(0.0, 7.0))
            ]),
      );
    } else {
      card = Container(
        height: height,
        width: width,
        margin: EdgeInsets.only(left: marginLeft ?? 0, top: marginTop ?? 0),
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: FileImage(File(fileImage!.path))),
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            shape: BoxShape.rectangle,
            boxShadow: const <BoxShadow>[
              BoxShadow(
                  color: Colors.black38,
                  blurRadius: 15.0,
                  offset: Offset(0.0, 7.0))
            ]),
      );
    }

    return Stack(
      alignment: Alignment(0.9, 1.1),
      children: <Widget>[
        card,
        FloatingButtonGreen(iconData: iconData, onPressed: onPressed)
      ],
    );
  }
}

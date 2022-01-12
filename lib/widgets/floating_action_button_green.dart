import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FloatingButtonGreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FloatingButtonGreen();
  }
}

class _FloatingButtonGreen extends State<FloatingButtonGreen> {

  bool _pressed = false;

  void onPressedFav() {
    setState(() {
      _pressed = !_pressed;
    });
    if(Platform.isAndroid){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(_pressed
              ? "Agregado a tus favoritos"
              : "Eliminado de tus favoritos")));
    }else{
      new CupertinoAlertDialog(
        title: Text("Navegando"),
        content: Text("fsfsfsd"),
      );
    }

  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: const Color(0xFF11DA53),
      mini: true,
      tooltip: "Fav",
      onPressed: onPressedFav,
      child: Icon(_pressed ? Icons.favorite : Icons.favorite_border),
      heroTag: null,
    );
  }
}
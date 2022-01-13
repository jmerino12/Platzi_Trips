
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FloatingButtonGreen extends StatefulWidget {
  late final IconData iconData;
  late final VoidCallback onPressed;

  FloatingButtonGreen(
      {Key? key, required this.iconData, required this.onPressed});

  @override
  State<StatefulWidget> createState() {
    return _FloatingButtonGreen();
  }
}

class _FloatingButtonGreen extends State<FloatingButtonGreen> {


  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: const Color(0xFF11DA53),
      mini: true,
      tooltip: "Fav",
      onPressed: widget.onPressed,
      child: Icon(widget.iconData),
      heroTag: null,
    );
  }
}
import 'package:flutter/material.dart';

class TextInputLocation extends StatelessWidget {
  late final String hintText;
  late final TextEditingController? controller;
  late final IconData iconData;

  TextInputLocation(
      {Key? key,
      required this.hintText,
      required this.iconData,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(right: 20.0, left: 20.0),
        child: TextField(
          controller: controller,
          style: const TextStyle(
              fontSize: 15.0,
              fontFamily: "Lato",
              color: Colors.blueGrey,
              fontWeight: FontWeight.bold),
          decoration: InputDecoration(
              hintText: hintText,
              suffixIcon: Icon(iconData),
              fillColor: Color(0xFFFFFFFF),
              filled: true,
              border: InputBorder.none,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFFFFFFF)),
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFFFFFFF)),
                  borderRadius: BorderRadius.all(Radius.circular(12)))),
        ),
        decoration: const BoxDecoration(boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black12, blurRadius: 15, offset: Offset(0.0, 7.0))
        ]));
  }
}

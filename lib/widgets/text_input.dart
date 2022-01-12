import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String hintText;
  final TextInputType? inputType;
  final TextEditingController controller;
  int? maxLines = 1;

  TextInput(
      {Key? key,
      required this.hintText,
      this.inputType,
      required this.controller,
      this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(right: 20, left: 20),
        child: TextField(
            controller: controller,
            keyboardType: inputType,
            style: const TextStyle(
                fontSize: 15,
                fontFamily: "Lato",
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold),
            decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFFE5E5E5),
                border: InputBorder.none,
                hintText: hintText,
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(9)),
                  borderSide: BorderSide(color: Color(0xFFE5E5E5)),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(9)),
                  borderSide: BorderSide(color: Color(0xFFE5E5E5)),
                ))));
  }
}

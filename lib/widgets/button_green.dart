import 'package:flutter/material.dart';

class ButtonGreen extends StatefulWidget {
  final String text;
  double width = 0.0;
  double heigth = 0.0;
  final VoidCallback onPressed;

  ButtonGreen({Key? key, required this.text, required this.onPressed
    , required this.heigth, required this.width});

  @override
  State<StatefulWidget> createState() {
    return _ButtonGreen();
  }

}

class _ButtonGreen extends State<ButtonGreen> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        margin: const EdgeInsets.only(
            top: 30,
            left: 20,
            right: 20
        ),
        width: widget.width,
        height: widget.heigth,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
                colors: [
                  Color(0xFFA7FF84),
                  Color(0xFF1CBB78),
                ],
                begin: FractionalOffset(0.2, 0.0),
                end: FractionalOffset(1.0, 0.6),
                stops: [0.0, 0.6],
                tileMode: TileMode.clamp)),
        child: Center(
          child: Text(
            widget.text,
            style: const TextStyle(
                fontSize: 18.0, fontFamily: "Lato", color: Colors.white),
          ),
        ),
      ),
    );
  }
}
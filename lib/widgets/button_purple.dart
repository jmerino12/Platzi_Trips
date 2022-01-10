import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonPurple extends StatelessWidget {
  void messageAlert(BuildContext context){
    if(Platform.isAndroid){
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Navegando")));
    }else{
      const CupertinoAlertDialog(
        title: Text("Navegando"),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: (){
           messageAlert(context);
        },
        child: Container(
          margin: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
          height: 50,
          width: 180,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: const LinearGradient(
                  colors: [
                    Color(0xFF4268D3),
                    Color(0xFF584cd1),
                  ],
                  begin: FractionalOffset(0.2, 0.0),
                  end: FractionalOffset(1.0, 0.6),
                  stops: [0.0, 0.6],
                  tileMode: TileMode.clamp)),
          child: const Center(
            child: Text(
              "Navigate",
              style: TextStyle(
                  fontSize: 18.0, fontFamily: "Lato", color: Colors.white),
            ),
          ),
        ));
  }
}

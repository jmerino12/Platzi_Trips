import 'package:flutter/material.dart';
import 'package:platzi_trips_avanzado/widgets/button_green.dart';
import 'package:platzi_trips_avanzado/widgets/gradient_back.dart';

class SignInScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _SignInScreen();
  }
}

class _SignInScreen extends State<SignInScreen>{
  @override
  Widget build(BuildContext context) {
    return signInGoogleUi();
  }

  Widget signInGoogleUi(){
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          GradientBack("",MediaQuery.of(context).size.height),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              const Text("Welcome \n This is your Travel App",style:
                TextStyle(
                  fontSize: 37.0,
                  fontFamily: "Lato",
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                )),
              ButtonGreen(text: "Login with Gmail", onPressed: (){

              }, heigth: 50, width: 300)
            ],
          )
        ],
      ),
    );
  }

}
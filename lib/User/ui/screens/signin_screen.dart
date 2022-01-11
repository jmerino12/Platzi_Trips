import 'package:flutter/material.dart';
import 'package:platzi_trips_avanzado/User/bloc/bloc_user.dart';
import 'package:platzi_trips_avanzado/widgets/button_green.dart';
import 'package:platzi_trips_avanzado/widgets/gradient_back.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class SignInScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _SignInScreen();
  }
}

class _SignInScreen extends State<SignInScreen>{
  late UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
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
                userBloc.signIn().then((value) => {
                  print(value)
                });
              }, heigth: 50, width: 300)
            ],
          )
        ],
      ),
    );
  }

}
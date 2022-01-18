import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_avanzado/Place/model/place.dart';
import 'package:platzi_trips_avanzado/User/bloc/bloc_user.dart';
import 'package:platzi_trips_avanzado/widgets/button_purple.dart';

class DescriptionPlace extends StatelessWidget {
  String namePlace;
  int stars;
  String descriptionPlace;

  DescriptionPlace(this.namePlace, this.stars, this.descriptionPlace);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    UserBloc userBloc = BlocProvider.of(context);

    return StreamBuilder(
        stream: userBloc.placeSelectedStream,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            Place place = snapshot.data;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                titleStars(place),
                descriptionWidget(place.description),
                ButtonPurple(buttonText: "Navigate", onPress: () {})
              ],
            );
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                      top: 400.0, left: 20.0, right: 20.0),
                  child: const Text(
                    "Selecciona un lugar",
                    style: TextStyle(
                        fontFamily: "Lato",
                        fontSize: 30.0,
                        fontWeight: FontWeight.w900),
                    textAlign: TextAlign.left,
                  ),
                )
              ],
            );
          }
        });
    /*return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        titleStars,
        description,
        ButtonPurple(buttonText: "Navigate", onPress: () {})
      ],
    );*/
  }

  Widget titleStars(Place place) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(top: 350.0, left: 20.0, right: 20.0),
          child: Text(
            place.name,
            style: TextStyle(
                fontFamily: "Lato",
                fontSize: 30.0,
                fontWeight: FontWeight.w900),
            textAlign: TextAlign.left,
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            top: 370.0,
          ),
          child: Text(
            "Hearts: ${place.likes}",
            style: TextStyle(
                fontFamily: "Lato",
                fontSize: 18.0,
                fontWeight: FontWeight.w900,
                color: Colors.amber),
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }

  Widget descriptionWidget(String descriptionPlace) {
    return Container(
      margin: new EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
      child: new Text(
        descriptionPlace,
        style: const TextStyle(
            fontFamily: "Lato",
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF56575a)),
      ),
    );
  }
}
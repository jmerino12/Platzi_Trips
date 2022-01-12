import 'package:flutter/material.dart';
import 'package:platzi_trips_avanzado/Place/model/place.dart';
import 'package:platzi_trips_avanzado/User/ui/widgets/profile_place_info.dart';


class ProfilePlace extends StatelessWidget {

  Place place;

  ProfilePlace(this.place);

  @override
  Widget build(BuildContext context) {

    final photoCard = Container(
      margin: const EdgeInsets.only(
          top: 10.0,
          bottom: 70.0
      ),
      height: 220.0,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(place.uriImage)),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          color: Colors.red,
          boxShadow: const <BoxShadow>[
            BoxShadow(
                color: Colors.black38,
                blurRadius: 10.0,
                offset: Offset(0.0, 5.0)
            )
          ]
      ),
    );

    return Stack(
      alignment: const Alignment(0.0, 0.8),
      children: <Widget>[
        photoCard,
        ProfilePlaceInfo(place)
      ],
    );
  }

}

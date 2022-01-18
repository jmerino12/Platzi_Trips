import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_avanzado/Place/model/place.dart';
import 'package:platzi_trips_avanzado/User/bloc/bloc_user.dart';
import 'package:platzi_trips_avanzado/User/model/user.dart';

import 'card_image.dart';

class CardImageList extends StatefulWidget {
  User user;

  CardImageList(@required this.user);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CardImageList();
  }
}

class _CardImageList extends State<CardImageList> {
  late UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    userBloc = BlocProvider.of<UserBloc>(context);

    return Container(
        height: 350.0,
        child: StreamBuilder(
            stream: userBloc.placesStream,
            builder: (context, AsyncSnapshot snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  print("PLACESLIST: WAITING");
                  return CircularProgressIndicator();
                case ConnectionState.none:
                  print("PLACESLIST: NONE");
                  return CircularProgressIndicator();
                case ConnectionState.active:
                  print("PLACESLIST: ACTIVE");
                  return listViewPlaces(
                      userBloc.buildPlaces(snapshot.data.docs, widget.user));
                case ConnectionState.done:
                  print("PLACESLIST: DONE");
                  return listViewPlaces(
                      userBloc.buildPlaces(snapshot.data.docs, widget.user));
                default:
                  return listViewPlaces(
                      userBloc.buildPlaces(snapshot.data.docs, widget.user));
              }
            }));
  }

  Widget listViewPlaces(List<Place> places) {
    void setLiked(Place place) {
      setState(() {
        place.liked = !place.liked!;
        userBloc.likePlace(place, widget.user.uid);
        place.likes = place.liked! ? place.likes! + 1 : place.likes! - 1;
        userBloc.placeSelectedSink.add(place);
      });
    }

    IconData iconDataLiked = Icons.favorite;
    IconData iconDataLike = Icons.favorite_border;
    return ListView(
      padding: EdgeInsets.all(25.0),
      scrollDirection: Axis.horizontal,
      children: places.map((place) {
        return GestureDetector(
          onTap: () {
            print("CLICK PLACE: ${place.name}");
            userBloc.placeSelectedSink.add(place);
          },
          child: CardImage(
            pathImage: place.uriImage,
            width: 300.0,
            height: 250.0,
            marginLeft: 20.0,
            iconData: place.liked! ? iconDataLiked : iconDataLike,
            onPressed: () {
              setLiked(place);
            },
          ),
        );
      }).toList(),
    );
  }
}

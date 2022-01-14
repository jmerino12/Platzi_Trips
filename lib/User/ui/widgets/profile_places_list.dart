import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_avanzado/User/bloc/bloc_user.dart';
import 'package:platzi_trips_avanzado/User/model/user.dart';

class ProfilePlacesList extends StatelessWidget {
  late User user;
  late UserBloc userBloc;

  ProfilePlacesList({Key? key, required this.user});

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    return Container(
      margin: const EdgeInsets.only(
          top: 10.0, left: 20.0, right: 20.0, bottom: 10.0),
      child: StreamBuilder(
          stream: userBloc.myPlacesListStream(user.uid),
          builder: (context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return CircularProgressIndicator();
              case ConnectionState.done:
                return Column(
                    children: userBloc.buildMyPlaces(snapshot.data.docs));
              case ConnectionState.active:
                /*print(snapshot.data.docs[0].data());
                var DocData = snapshot.data.docs[0] as DocumentSnapshot;
                print(DocData['name']);*/
                return Column(
                    children: userBloc.buildMyPlaces(snapshot.data.docs));

              case ConnectionState.none:
                return CircularProgressIndicator();
              default:
                return Column(
                    children: userBloc.buildMyPlaces(snapshot.data.docs));
            }
          }),
    );
  }
}

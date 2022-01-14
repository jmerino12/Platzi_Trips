import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_avanzado/User/bloc/bloc_user.dart';
import 'package:platzi_trips_avanzado/User/model/user.dart';
import 'package:platzi_trips_avanzado/User/ui/screens/profile_header.dart';
import 'package:platzi_trips_avanzado/User/ui/widgets/profile_background.dart';
import 'package:platzi_trips_avanzado/User/ui/widgets/profile_places_list.dart';

class ProfileTrips extends StatelessWidget {
  late UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    return StreamBuilder(
        stream: userBloc.authStatus,
        builder: (context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return CircularProgressIndicator();
              break;
            case ConnectionState.active:
              return showProfileData(snapshot);
              break;
            case ConnectionState.done:
              return showProfileData(snapshot);
              break;
            default:
              return CircularProgressIndicator();
          }
        });
  }

  Widget showProfileData(AsyncSnapshot snapshot) {
    if (!snapshot.hasData || snapshot.hasError) {
      print("No logueado");
      return Stack(
        children: <Widget>[
          ProfileBackground(),
          ListView(
            children: const [Text(("Usuario no logueado"))],
          ),
        ],
      );
    } else {
      var user = User(
          uid: snapshot.data.uid,
          name: snapshot.data.displayName,
          email: snapshot.data.email,
          photoUrl: snapshot.data.photoURL);
      return Stack(
        children: <Widget>[
          ProfileBackground(),
          ListView(
            children: [
              ProfileHeader(user: user),
              ProfilePlacesList(user: user)
            ],
          ),
        ],
      );
    }
  }
}

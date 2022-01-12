import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_avanzado/User/bloc/bloc_user.dart';
import 'package:platzi_trips_avanzado/User/model/user.dart';
import 'package:platzi_trips_avanzado/User/ui/widgets/button_bar.dart';
import 'package:platzi_trips_avanzado/User/ui/widgets/user_info.dart';

class ProfileHeader extends StatelessWidget {
  late UserBloc userBloc;
  late User user;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return CircularProgressIndicator();
            case ConnectionState.active:
            case ConnectionState.done:
              return showProfileData(snapshot);
          }
        },
        stream: userBloc.streamFirebase);
  }

  Widget showProfileData(AsyncSnapshot snapshot) {
    if (!snapshot.hasData || snapshot.hasError) {
      return Container(
        margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
        child: Column(
          children: <Widget>[
            Row(
              children: const [
                CircularProgressIndicator(),
                Text("No se pudo cargar la informacion")
              ],
            ),
          ],
        ),
      );
    } else {
      user  = User(uid: snapshot.data.uid, name: snapshot.data.displayName, email: snapshot.data.email, photoUrl: snapshot.data.photoURL);
      const title = const Text(
        'Profile',
        style: TextStyle(
            fontFamily: 'Lato',
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30.0),
      );

      return Container(
        margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
        child: Column(
          children: <Widget>[
            Row(
              children: [title],
            ),
            UserInfo(user),
            ButtonsBar()
          ],
        ),
      );
    }
  }
}

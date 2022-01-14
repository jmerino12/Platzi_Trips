import 'package:flutter/material.dart';
import 'package:platzi_trips_avanzado/User/model/user.dart';
import 'package:platzi_trips_avanzado/User/ui/widgets/button_bar.dart';
import 'package:platzi_trips_avanzado/User/ui/widgets/user_info.dart';

class ProfileHeader extends StatelessWidget {
  late User user;

  ProfileHeader({Key? key, required this.user});

  @override
  Widget build(BuildContext context) {
    final title = const Text(
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
            children: <Widget>[title],
          ),
          UserInfo(user),
          ButtonsBar()
        ],
      ),
    );
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


import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platzi_trips_avanzado/Place/ui/screens/add_place_screen.dart';
import 'package:platzi_trips_avanzado/User/bloc/bloc_user.dart';

import 'circle_button.dart';

class ButtonsBar extends StatelessWidget {
  late UserBloc userBloc;
  late ImagePicker picker;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    picker = ImagePicker();
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
        child: Row(
          children: <Widget>[
            CircleButton(true, Icons.vpn_key, 20.0,
                const Color.fromRGBO(255, 255, 255, 0.6), () => {}),
            CircleButton(
                false, Icons.add, 40.0, const Color.fromRGBO(255, 255, 255, 1),
                () {
              getImage(context);
            }),
            CircleButton(
                true,
                Icons.exit_to_app,
                20.0,
                const Color.fromRGBO(255, 255, 255, 0.6),
                () => {userBloc.signOut()}),
          ],
        ));
  }

  Future getImage(BuildContext context) async {
    XFile? image = await picker
        .pickImage(source: ImageSource.camera)
        .catchError((onError) => print(onError));
    if (image != null) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => AddPlaceScreen(image: image)));
    }
  }
}

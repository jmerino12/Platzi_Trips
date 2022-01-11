import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_avanzado/User/bloc/bloc_user.dart';
import 'package:platzi_trips_avanzado/User/ui/screens/signin_screen.dart';
import 'package:platzi_trips_avanzado/platzi_trips.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        child: MaterialApp(
            title: 'Trip',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: SignInScreen()),
        bloc: UserBloc());
  }
}

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'Servicios/movieService.dart';
import 'Servicios/registro_user.dart';
import 'Views/login.dart';

void setupMovie(){
  GetIt.I.registerLazySingleton(() => MovieService());
  GetIt.I.registerLazySingleton(()=> RegisterUserCLient());
}

void main() {
  setupMovie();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: new LoginPage(),
    );
  }
}



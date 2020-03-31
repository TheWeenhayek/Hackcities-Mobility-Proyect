import 'package:flutter/material.dart';
import 'package:myapp/datamodels/user_location.dart';
import 'package:myapp/services/location_service.dart';
import 'package:myapp/views/home_view.dart';
import 'package:provider/provider.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserLocation>(
      create: (context) => LocationService().locationStream,
      child: MaterialApp(
          title: 'Aplicación Hackcities',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Scaffold(
            appBar: AppBar(
              title: Text('Interfaz adquisición de datos'),
            ),
            body: HomeView(),
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:myapp/datamodels/user_location.dart';
import 'package:myapp/services/location_service.dart';
//import 'package:myapp/views/home_view.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserLocation>(
      create: (context) => LocationService().locationStream,
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Scaffold(
            //body: HomeView(),
                body:new StreamBuilder(
                  stream: Firestore.instance.collection("Sist.de.bus").snapshots(),
                  builder: (context, snapshot){
                    if(!snapshot.hasData)
                      return new Text("Conectando......");
                    return new ListView.builder(
                      itemCount: snapshot.data.documents.lenght,
                      itemBuilder: (context, index){
                          DocumentSnapshot ds = snapshot.data.documents['index'];
                          return new Text(ds['Latitud']);
                      }
                          );
                      }
                      ),   


          )),
    );
  }
}
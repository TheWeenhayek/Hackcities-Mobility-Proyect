//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myapp/datamodels/user_location.dart';
import 'package:provider/provider.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
//import 'dart:async';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    var userLocation = Provider.of<UserLocation>(context);
    var longi = userLocation.longitude;
    var lati = userLocation.latitude;
    var resu;
    var parada;
    var aux = 0;
    var aux1 = 0;
    var aux2;

    if (((lati > -16.500791) & (lati < -16.500709)) &
        ((longi > -68.130387) & (longi < -68.129988))) {
      resu = '1';
      aux=1;


      if((aux==1)&(aux1==0)){
     /*
      Firestore.instance.collection('Sist.de.bus').document()
       .setData({ 'Latitud': Timestamp.now(), 'Longitud': longi, 'ID Parada': resu});
     */
     
      FirebaseDatabase.instance.reference().child("2").set({
    'Longitud': lati ,
    'description': longi
  });



       aux1=1;
      }





    }
    if (((lati > -16.500469) & (lati < -16.500072)) &
        ((longi > -68.132131) & (longi < -68.131991))) {
      resu = '0';
    }
    /*
    if((aux==1)&(aux1==0)){
      Firestore.instance.collection('Sist.de.bus').document()
       .setData({ 'Latitud': Timestamp.now(), 'Longitud': longi, 'ID Parada': resu});
       
       aux1=1;
      }
    */
    
    /*
    Firestore.instance
    .collection('Sist.de.bus')
    .where("Id bus", isEqualTo: 5)
    .snapshots()
    .listen((data) =>
        data.documents.forEach((doc) => aux2=doc[""]));   
*/

    switch (resu) {
      case "0":
        {
          parada = "Parada 0 (Calle Bueno)";
        }
        break;

      case "1":
        {
          parada = "Parada 1 (PUC)";
        }
        break;

      default:
        {
          parada = 'Usted no se encuentra cerca de ninguna estación';
          aux = 0;
          aux1 = 0;
        }
        break;
    }

    return Center(
      child: Text('''Tu ubicacion actual es: 
              Lat: ${userLocation?.latitude}
              Long: ${userLocation?.longitude}
              Tu ubicacion actual es: $parada
              $aux,$aux1
              
              $aux2'''),
    );
  }
/*
    

         new StreamBuilder(
                  stream: Firestore.instance.collection("Sist.de.bus").snapshots(),
                  builder: (context, snapshot){
                    if(!snapshot.hasData)
                      return new Text("Conectando......");

                    return new ListView.builder(
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index){
                          DocumentSnapshot ds = snapshot.data.documents[index];
                          //return new Text(ds['NombreParada']);
                          var latifb= ds['Latitud'];
                          var longifb= ds['Longitud'];
                          var horafechafb= ds['Hora y fecha'];
                          var nompfb= ds['NombreParada'];
                          var rutafb= ds['Ruta'];
                          var par= ds['ID Parada'];
                          var bus= ds['ID bus'];

                          





                      }
                          );
                      }
                      );  

           */          

}

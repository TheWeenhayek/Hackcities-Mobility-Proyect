import 'package:flutter/material.dart';
import 'package:myapp/datamodels/user_location.dart';
import 'package:provider/provider.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userLocation = Provider.of<UserLocation>(context);
    var longi=userLocation.longitude;
    var lati=userLocation.latitude;
    var resu;
    var parada;
    if(((lati>-16.500791)&(lati<-16.500709))&((longi>-68.130387)&(longi<-68.129988))){
      resu='1';
    }
    if(((lati>-16.500469)&(lati<-16.500072))&((longi>-68.132131)&(longi<-68.131991))){
      resu='0';
    }

    switch(resu) { 
      case "0": {parada="Parada 0 (Calle Bueno)"; } 
      break; 
     
      case "1": {parada="Parada 1 (PUC)"; } 
      break; 
     
      
      default: {parada='Usted no se encuentra cerca de ninguna estación'; } 
      break; 
   } 
  
    return Center(
      child: Text(
          '''Tu ubicacion actual es: 
              Lat: ${userLocation?.latitude}
              Long: ${userLocation?.longitude}
              Tu ubicacion actual es: $parada'''),
    );


       
    


  }
}
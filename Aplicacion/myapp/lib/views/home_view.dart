import 'package:flutter/material.dart';
import 'package:myapp/datamodels/user_location.dart';
import 'package:provider/provider.dart';
import 'package:firebase_database/firebase_database.dart';

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
    //var aux2;

    DateTime aux3 = DateTime.now();
    //aux2=year as int;
    if (((lati > -16.500791) & (lati < -16.500709)) &
        ((longi > -68.130387) & (longi < -68.129988))) {
      resu = '1';
      aux = 1;
      if ((aux == 1) & (aux1 == 0)) {
        /*
      Firestore.instance.collection('Sist.de.bus').document()
       .setData({ 'Latitud': Timestamp.now(), 'Longitud': longi, 'ID Parada': resu});
     */
        var texto = "Parada1";
        FirebaseDatabase.instance
            .reference()
            .child("Sist de bus")
            .child(texto)
            .set({
          //-----------------
          'Dia': 31,
          'Mes': 03,
          'Año': 10,
          'Hora': 00,
          'Minutos': 00,
          'Segundos': 00,
          //-----------------
          'Id parada': resu,
          'Id bus': 569,
          'Id ruta': 'Achumani',
          'NombreParada': 'PUC',
          'Latitud': lati,
          'Nombre Chofer': 'Juan Perez',
          'Nombre Anfitrion': 'Maria Perez',
          'Longitud': longi
        });
        aux1 = 1;
      }
    }
    if (((lati > -16.500469) & (lati < -16.500072)) &
        ((longi > -68.132131) & (longi < -68.131991))) {
      resu = '0';
      
    }
    switch (resu) {
      case "0":
        {
          parada = "Calle Bueno";
        }
        break;

      case "1":
        {
          parada = "PUC";
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
      child: Text("TRACKING........... \n"
          "Datos adquiridos del bus: \n"
          "     Nombre del chofer: Juan Perez \n"
          "     Nombre del Anfitrion: María Perez \n"
          "     Número de bus: 569 \n"
          "     Ruta: Achumani \n"
          "Datos adquiridos del dispositivo: \n"
          "     Latitud: ${userLocation?.latitude} \n"
          "     Longitud: ${userLocation?.longitude} \n"
          "     ID de parada: $resu\n"
          "     Nombre de parada: $parada \n"
          "     Fecha y hora: $aux3 \n"
          ),
    );
  }

}

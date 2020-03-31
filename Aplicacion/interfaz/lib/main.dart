import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
      title: 'INTERFAZ INICIO USUARIO',
      home: new MyApp()
  ));
}

class MyApp extends StatelessWidget {
  var nomChofer;
  var nomAnfi;
  var idBUSPM;
  var ruta;
  
  @override
  Widget build(BuildContext context) {
    // Create first input field



    TextField NombreChofer = new TextField(
        decoration: new InputDecoration(
            labelText: "Nombre Completo Chofer"),
        keyboardType: TextInputType.text,
        onChanged: (String value) {
          try {
            nomChofer= value.toString();
          } catch (exception) {
            nomChofer= null;

          }
        }
    );



    // Create another input field
    TextField NombreAnfitrion = new TextField(
        decoration: new InputDecoration(
            labelText: "Nombre Completo Anfitrion"),
        keyboardType: TextInputType.text,
        onChanged: (String value) {
      try {
        nomAnfi=value.toString();
      } catch (exception) {
        nomChofer=null;
      }
    }
    );


        // Create another input field
    TextField idBUS = new TextField(
        decoration: new InputDecoration(
            labelText: "Identificador del bus"),
        keyboardType: TextInputType.number,
        onChanged: (String value) {
      try {
        idBUSPM= int.parse(value.toString());
      } catch (exception) {
       idBUSPM=null;
      }
    }
    );

           // Create another input field
    TextField laruta = new TextField(
        decoration: new InputDecoration(
            labelText: "Ruta"),
        keyboardType: TextInputType.text,
        onChanged: (String value) {
      try {
        ruta= (value.toString());
      } catch (exception) {
       ruta=null;
      }
    }
    );



    
    RaisedButton calculateButton = new RaisedButton(
        child: new Text("Registrar datos"),
        onPressed: () {
          // Calculate tip and total
          //double calculatedGst =  gstPercentage / 100.0;
          //double total =  calculatedGst;

// Generate dialog
          AlertDialog dialog = new AlertDialog(
              content: new Text("Nombre del chofer:$nomChofer \n"
                                "Nombre del Anfitrion:$nomAnfi \n"
                                "Número de bus: $idBUSPM\n"
                                "Ruta: $ruta\n")
          );

// Show dialog
          showDialog(context: context, child: dialog);
        }
    );


Container container = new Container(
    padding: const EdgeInsets.all(20),
    child: new Column(
        children: [ NombreChofer,
        NombreAnfitrion,
        idBUS,
        laruta,
        calculateButton ]
    )

);
AppBar appBar = new AppBar(title: new Text("INTERFAZ INICIO USUARIO"));
Scaffold scaffold = new Scaffold(appBar: appBar,body: container);
return scaffold;
    }
}
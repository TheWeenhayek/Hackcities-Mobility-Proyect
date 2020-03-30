import 'package:flutter/material.dart';
import 'package:myapp/datamodels/user_location.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userLocation = Provider.of<UserLocation>(context);
    return Center(
      child: Text(
          'Tu ubicacion actual es: Lat${userLocation?.latitude}, Long: ${userLocation?.longitude}'),
    );
  }
}
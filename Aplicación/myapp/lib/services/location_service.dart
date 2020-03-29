import 'dart:async';
import 'package:location/location.dart';
import 'package:myapp/datamodels/user_location.dart';
class LocationService {
  // Keep track of current location
  UserLocation _currentLocation;

  var location = Location();
  // Continously emit location updates
  StreamController<UserLocation> _locationController =
      StreamController<UserLocation>();

  Stream<UserLocation> get locationStream => _locationController.stream;

  LocationService() {
    // Request permission to use location
    location.requestPermission().then((granted) {
      if (granted != null) {
        // If granted listen to the onLocationChanged stream and emit over our controller
        location.onLocationChanged().listen((locationData) {
          if (locationData != null) {
            _locationController.add(UserLocation(
              latitude: locationData.latitude,
              longitude: locationData.longitude,
            ));
          }
        });
      }
    });
  }




  Future<UserLocation> getLocation() async {
    try {
      var userLocation = await location.getLocation();
      _currentLocation = UserLocation(
        latitude: userLocation.latitude+100,
        longitude: userLocation.longitude+100,
      );
    } on Exception catch (e) {
      print('Could not get location: ${e.toString()}');
    }

    return _currentLocation;
  }
}
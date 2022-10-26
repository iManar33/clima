import 'package:geolocator/geolocator.dart';

class Location {
 late double longitude;
 late double latitude;
 // Location({required this.latitude , required this.longitude});
 Future<void> getCurrentLocation() async {
   try {
   Position position = await Geolocator.getCurrentPosition();
   latitude = position.latitude;
   longitude = position.longitude;
   // print(position);
   print(3);
   }
   catch (e){
   print(e);
   }
 }

}
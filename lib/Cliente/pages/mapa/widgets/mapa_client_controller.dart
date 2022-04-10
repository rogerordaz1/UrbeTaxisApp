import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapaClientController extends GetxController {
  var markerlist = <Marker>[].obs;
  Rx<BitmapDescriptor?> icono = Rx<BitmapDescriptor?>(null);
  Rx<Position?> position = Rx<Position?>(null);
  Rx<StreamSubscription<Position>?> positionStream =
      Rx<StreamSubscription<Position>?>(null);
}

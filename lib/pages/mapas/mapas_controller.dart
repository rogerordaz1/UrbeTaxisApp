import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/state_manager.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:marker_icon/marker_icon.dart';

class MapasController extends GetxController {
  var markerlist = <Marker>[].obs;
  Rx<Position?> position = Rx<Position?>(null);

  @override
  void onInit() async {
    await Geolocator.requestPermission();

    position.value = await Geolocator.getCurrentPosition();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      updateLocation();
    });
    super.onInit();
  }

  void addMarker(Marker marker) {
    markerlist.add(marker);
  }

  addMarkerToMap(LatLng latLng, String id) async {
    markerlist.add(
      Marker(
        markerId: MarkerId(id),
        position: latLng,
        icon: await convertIconFromAsset("assets/taxi.png"),
        infoWindow:
            const InfoWindow(title: "Taxi", snippet: "Chofe pare el Taxi"),
        draggable: false,
        zIndex: 2,
        flat: true,
        anchor: const Offset(0.5, 0.5),
        rotation: position.value!.heading,
      ),
    );
  }

  updateLocation() async {
    position.value = await Geolocator.getLastKnownPosition();

    await addMarkerToMap(
        LatLng(position.value!.latitude, position.value!.longitude), "1");
  }

  Future<BitmapDescriptor> convertIconFromAsset(String imgPath) async {
    var icon = await MarkerIcon.pictureAsset(
        assetPath: imgPath, width: 80, height: 80);
    return icon;
  }
}

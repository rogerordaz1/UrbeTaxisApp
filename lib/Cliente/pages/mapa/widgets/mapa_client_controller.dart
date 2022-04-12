import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:marker_icon/marker_icon.dart';
import 'package:http/http.dart' as http;
import 'package:urbe_taxis/Cliente/models/rutas_mapbox.dart';
import 'package:google_polyline_algorithm/google_polyline_algorithm.dart';

class MapaClientController extends GetxController {
  var markerlist = <Marker>[].obs;
  Rx<BitmapDescriptor?> icono = Rx<BitmapDescriptor?>(null);
  Rx<BitmapDescriptor?> icono1 = Rx<BitmapDescriptor?>(null);
  Rx<Position?> position = Rx<Position?>(null);
  Rx<LatLng?> markercoords = Rx<LatLng?>(null);
  Rx<StreamSubscription<Position>?> positionStream =
      Rx<StreamSubscription<Position>?>(null);

  var points = <LatLng>[].obs;

  var polyli = <Polyline>[].obs;

  var isMarcador = false.obs;
  var isConfirmar = false.obs;
  var isRepintMapa = false.obs;
  var showModal = false.obs;
  var showModalTravelConfirm = true.obs;

  @override
  void onInit() async {
    icono.value = await convertIconFromAsset("assets/taxi.png");
    icono1.value = await convertIconFromAsset("assets/iconlocation.png");
    await Geolocator.requestPermission();

    position.value = await Geolocator.getCurrentPosition();
    markercoords.value =
        LatLng(position.value!.latitude, position.value!.longitude);

    checkGps();
    updateLocation();

    super.onInit();
  }

  Future getRutas(
      {required double fromlat,
      required double fromlong,
      required double tolat,
      required double tolong}) async {
    var headers = {'token': ''};
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://api.mapbox.com/directions/v5/mapbox/driving-traffic/$fromlong,$fromlat;$tolong,$tolat.json?access_token=pk.eyJ1IjoiamF2aWVyOTgwNTA2MDIiLCJhIjoiY2wxcnV6cXdnMG8xNDNqbzk1cHBsNzRuciJ9.U_npzOoO9d4x4HYJ4uclCQ'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final respuesta =
          RutasMapbox.fromJson(await response.stream.bytesToString());

      final polyline = decodePolyline(respuesta.routes![0].geometry!);

      final latLongList = polyline
          .map((point) => LatLng(point[0].toDouble(), point[1].toDouble()))
          .toList();

      points.value = latLongList;

      polyli.add(Polyline(
        polylineId: const PolylineId('1'),
        color: Colors.black,
        width: 3,
        points: points.value,
      ));

      print('${polyli[0].color}');

      addMarkerToMap(latLongList.last, "2");

      isRepintMapa.value = true;
    } else {
      print(response.reasonPhrase);
    }
  }

  void addMarker(Marker marker) {
    markerlist.add(marker);
  }

  addMarkerToMap(LatLng latLng, String id) {
    markerlist.add(
      Marker(
        markerId: MarkerId(id),
        position: latLng,
        icon: icono1.value!,
        infoWindow:
            const InfoWindow(title: "Taxi", snippet: "Chofe pare el Taxi"),
        draggable: false,
        zIndex: 2,
        flat: true,
        anchor: const Offset(0.5, 0.5),
        // rotation: position.value!.heading,
      ),
    );
  }

  void checkGps() async {
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isLocationServiceEnabled) {
      bool locationGps = await Location.instance.requestService();
    }
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  updateLocation() async {
    try {
      await _determinePosition();
      position.value = await Geolocator.getLastKnownPosition();

      positionStream.value = Geolocator.getPositionStream(
        locationSettings: const LocationSettings(
          distanceFilter: 1,
        ),
      ).listen((Position position) {
        this.position.value = position;
        //  addMarkerToMap(LatLng(position.latitude, position.longitude), "1");
      });
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<BitmapDescriptor> convertIconFromAsset(String imgPath) async {
    var icon = await MarkerIcon.pictureAsset(
        assetPath: imgPath, width: 80, height: 80);
    return icon;
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:urbe_taxis/Drivers/mapas/mapas_driver_controller.dart';

class MapasDriverPage extends StatelessWidget {
  const MapasDriverPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MapasDriverController controller = Get.find();
    return Obx(() => SafeArea(
          child: GoogleMap(
            zoomControlsEnabled: false,
            initialCameraPosition: const CameraPosition(
              target: LatLng(22.42259, -83.69854),
              zoom: 16,
            ),
            markers: Set<Marker>.of(controller.markerlist.value),
            myLocationEnabled: false,
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:urbe_taxis/pages/mapas/mapas_controller.dart';

class MapasPage extends StatelessWidget {
  const MapasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MapasController controller = Get.find();
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

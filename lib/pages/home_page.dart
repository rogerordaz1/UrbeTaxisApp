import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:urbe_taxis/pages/pages.dart';

import 'mapas/mapas_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MapasController controller = Get.put(MapasController());
    return Scaffold(
      body: Center(
          child: TextButton(
              onPressed: () async {
                await controller.addMarkerToMap(
                    const LatLng(22.424717, -83.694877), "1");
                Get.to(() => const MapasPage());
              },
              child: const Text("Mapas Page"))),
    );
  }
}

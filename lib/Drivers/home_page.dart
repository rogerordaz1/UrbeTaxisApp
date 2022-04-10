import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'mapas/mapas_driver_controller.dart';
import 'mapas/mapas_driver_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MapasDriverController controller = Get.put(MapasDriverController());
    return Scaffold(
      body: Center(
          child: TextButton(
              onPressed: () {
                Get.to(() => const MapasDriverPage());
              },
              child: const Text("Mapas Page"))),
    );
  }
}

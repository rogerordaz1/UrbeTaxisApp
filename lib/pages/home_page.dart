import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
              onPressed: () {
                Get.to(() => const MapasPage());
              },
              child: const Text("Mapas Page"))),
    );
  }
}

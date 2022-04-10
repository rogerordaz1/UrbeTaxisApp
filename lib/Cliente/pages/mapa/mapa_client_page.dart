import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:urbe_taxis/Cliente/pages/mapa/widgets/mapa_client_controller.dart';

import 'widgets/botton_modal_client.dart';
import 'widgets/btn_location.dart';
import 'widgets/drawer_client.dart';
import 'widgets/search_bar_client.dart';

class MapaClientPage extends StatelessWidget {
  const MapaClientPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MapaClientController controller = Get.put(MapaClientController());

    return Scaffold(
      drawer: const CustomDrawer(),
      body: Stack(
        children: [
          GoogleMap(
            onCameraMove: (qwe) {
              print(qwe.target);
            },
            zoomControlsEnabled: false,
            initialCameraPosition: const CameraPosition(
              target: LatLng(22.42259, -83.69854),
              zoom: 16,
            ),
            //   markers: Set<Marker>.of(controller.markerlist.value),
            myLocationEnabled: false,
          ),
          const SearchBar(),
          const Align(
              alignment: Alignment.center, child: IconSelectMyLocation()),
          const BottonModalShet(),
        ],
      ),
      floatingActionButton: const BtnCurrentLocation(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,

      // BtnToggleUserRoute(),
      // BtnFollowUser(),
    );
  }
}

class IconSelectMyLocation extends StatelessWidget {
  const IconSelectMyLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.1,
      width: Get.width * 0.1,
      child: const Image(image: AssetImage('assets/iconlocation.png')),
    );
  }
}

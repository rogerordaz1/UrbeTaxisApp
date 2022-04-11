import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ndialog/ndialog.dart';
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
          (controller.isRepintMapa.value == true)
              ? GoogleMap(
                  onCameraMove: (qwe) {
                    controller.markercoords.value = qwe.target;
                  },
                  zoomControlsEnabled: false,
                  initialCameraPosition: const CameraPosition(
                    target: LatLng(22.42259, -83.69854),
                    zoom: 16,
                  ),

                  polylines: controller.polyline!.toSet(),
                  // markers: Set<Marker>.of(controller.markerlist.value),
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                )
              : GoogleMap(
                  onCameraMove: (qwe) {
                    controller.markercoords.value = qwe.target;
                  },
                  zoomControlsEnabled: false,
                  initialCameraPosition: const CameraPosition(
                    target: LatLng(22.42259, -83.69854),
                    zoom: 16,
                  ),

                  // markers: Set<Marker>.of(controller.markerlist.value),
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                ),
          const SearchBar(),
          Obx(() {
            if (controller.isMarcador.value == true) {
              return const Align(
                  alignment: Alignment.center, child: IconSelectMyLocation());
            } else {
              return Container();
            }
          }),
          Obx(() {
            if (controller.isConfirmar.value == true) {
              return const ConfirmarButton();
            } else {
              return Container();
            }
          }),
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

class ConfirmarButton extends StatelessWidget {
  const ConfirmarButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MapaClientController controller = Get.find();

    return Positioned(
      bottom: Get.height * 0.12,
      left: Get.width * 0.26,
      child: MaterialButton(
        color: const Color(0xFFf8ac00),
        minWidth: 200,
        onPressed: () async {
          controller.isMarcador.value = false;

          print(controller.position.value!.longitude);
          print(controller.position.value!.latitude);

          print(controller.markercoords.value!.latitude);
          print(controller.markercoords.value!.longitude);

          await controller.getRutas(
              fromlat: controller.position.value!.latitude,
              fromlong: controller.position.value!.longitude,
              tolat: controller.markercoords.value!.latitude,
              tolong: controller.markercoords.value!.longitude);

          ProgressDialog progressDialog = ProgressDialog(context,
              message: const Text("This is the message"),
              title: const Text("This is the title"));

          //You can set Message using this function
          progressDialog.setTitle(const Text("Cargando"));
          progressDialog
              .setMessage(const Text("Calculando Ruta Por favor espere."));
          progressDialog.show();

          await Future.delayed(const Duration(seconds: 5));

          progressDialog.dismiss();
        },
        child: const Text("Confirmar Ruta"),
      ),
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

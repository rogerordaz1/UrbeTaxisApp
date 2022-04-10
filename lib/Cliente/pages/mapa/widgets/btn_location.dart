import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BtnCurrentLocation extends StatelessWidget {
  const BtnCurrentLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10, top: Get.height * 0.18),
      child: CircleAvatar(
        backgroundColor: Colors.orange,
        maxRadius: 25,
        child: IconButton(
            icon: const Icon(Icons.my_location_outlined, color: Colors.black),
            onPressed: () {}),
      ),
    );
  }
}

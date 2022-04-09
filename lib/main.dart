import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urbe_taxis/pages/pages.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: '/home',
      getPages: [
        GetPage(name: '/home', page: () => const HomePage()),
        GetPage(name: '/mapa', page: () => const MapasPage()),
      ],
    );
  }
}

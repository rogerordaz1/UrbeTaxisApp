import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urbe_taxis/Cliente/pages/mapa/mapa_client_page.dart';

import 'Cliente/pages/login.dart';
import 'Cliente/pages/register.dart';
import 'Drivers/home_page.dart';
import 'Drivers/mapas/mapas_driver_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: '/client/mapa',
      getPages: [
        GetPage(name: '/home', page: () => const HomePage()),
        GetPage(name: '/mapa', page: () => const MapasDriverPage()),
        GetPage(name: '/login', page: () => const LoginCLient()),
        GetPage(name: '/register', page: () => const RegisterPage()),
        GetPage(name: '/client/mapa', page: () => const MapaClientPage()),
      ],
    );
  }
}

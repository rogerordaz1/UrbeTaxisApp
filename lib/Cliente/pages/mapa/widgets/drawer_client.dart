import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        const HeaderDrawer(),
        const CustomListTile(
          text: "Mapa",
          icon: Icons.person,
        ),
        const Separador(),
        const CustomListTile(
          text: "Favoritos",
          icon: Icons.favorite,
        ),
        const Separador(),
        const CustomListTile(
          text: "Historial",
          icon: Icons.history,
        ),
        const Separador(),
        const CustomListTile(
          text: "Mi monedero",
          icon: Icons.credit_card,
        ),
        const Separador(),
        const CustomListTile(
          text: "Acerca de",
          icon: Icons.info_sharp,
        ),
        const Separador(),
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 30),
          child: ListTile(
            leading: const Icon(
              Icons.logout,
              size: 40,
              color: Colors.grey,
            ),
            title: const Text("Salir",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                )),
            onTap: () {},
          ),
        ),
      ]),
    );
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    Key? key,
    required this.icon,
    required this.text,
    this.color,
  }) : super(key: key);

  final IconData icon;
  final String text;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 35,
        color: color ?? const Color(0xFFF9AC00),
      ),
      title: Text(
        text,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
      onTap: () {},
    );
  }
}

class HeaderDrawer extends StatelessWidget {
  const HeaderDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: Get.height * 0.26,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xFFF9AC00),
          ),
        ),
        Positioned(
          top: Get.height * 0.06,
          left: Get.height * 0.12,
          child: Column(
            children: const [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  'https://blogs.publico.es/strambotic/files/2019/02/person7-1.jpeg',
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Laura Perez",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Separador extends StatelessWidget {
  const Separador({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(height: 1, width: Get.width * 0.70, color: Colors.grey);
  }
}

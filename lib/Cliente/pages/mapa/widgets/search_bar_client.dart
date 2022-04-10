import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _SearchBarBody();
  }
}

class _SearchBarBody extends StatelessWidget {
  const _SearchBarBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 5,
              left: 10,
            ),
            child: GestureDetector(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: const Icon(
                Icons.menu,
                size: 30,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.symmetric(horizontal: 30),
            width: double.infinity,
            child: GestureDetector(
                onTap: () async {},
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.local_fire_department_outlined),
                          SizedBox(width: 10),
                          Text('¿Dónde quieres ir?',
                              style: TextStyle(color: Colors.black87)),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        height: 1,
                        width: 300,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: const [
                          Icon(Icons.location_on),
                          SizedBox(width: 10),
                          Text('Elija un destino',
                              style: TextStyle(color: Colors.black87)),
                        ],
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: const Color(0xFFF9AC00),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5,
                            offset: Offset(0, 5))
                      ]),
                )),
          ),
        ],
      ),
    );
  }
}

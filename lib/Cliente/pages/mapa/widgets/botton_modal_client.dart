import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottonModalShet extends StatelessWidget {
  const BottonModalShet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.08,
      minChildSize: 0.08,
      maxChildSize: 0.3,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Color(0xFFf8ac00),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: _BottonModalShetBody(scrollController: scrollController),
        );
      },
    );
  }
}

class _BottonModalShetBody extends StatelessWidget {
  const _BottonModalShetBody({
    Key? key,
    required this.scrollController,
  }) : super(key: key);
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      child: SizedBox(
        height: Get.height * 0.3,
        child: const ModalLogica(),
      ),
    );
  }
}

class ModalLogica extends StatelessWidget {
  const ModalLogica({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 25),
                  width: 60,
                  height: 3,
                  color: Colors.white,
                ),
                const SizedBox(height: 10),
                const Text(
                  "Elija un Taxi",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ],
            )
          ],
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                SelecionarTipoTaxi(
                    texto: "Economico", imagen: 'assets/econimico-cuidad.png'),
                SelecionarTipoTaxi(
                    texto: "Confortable",
                    imagen: 'assets/confortable-cuidad.png'),
                SelecionarTipoTaxi(
                    texto: "Familiar", imagen: 'assets/familiar-ciudad.png'),
                SelecionarTipoTaxi(
                    texto: "Camioneta", imagen: 'assets/camioneta-cuidad.png'),
                SelecionarTipoTaxi(
                    texto: "Camion", imagen: 'assets/camion-cuidad.png'),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class SelecionarTipoTaxi extends StatelessWidget {
  const SelecionarTipoTaxi({
    Key? key,
    required this.texto,
    required this.imagen,
  }) : super(key: key);
  final String texto;
  final String? imagen;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              child: Image(image: AssetImage(imagen!))),
          const SizedBox(height: 10),
          Text(texto,
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.white)),
        ],
      ),
    );
  }
}

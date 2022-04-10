import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Widget/Custom_buttom.dart';
import '../Widget/Input.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(248, 172, 0, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(
              child: SizedBox(
                height: Get.height * 0.04,
                width: Get.width,
                child: const Image(
                    image: AssetImage('assets/cuadrados_negros.png'),
                    fit: BoxFit.contain),
              ),
            ),
            SizedBox(
              width: Get.width,
              height: Get.height * 0.88,
              child: Column(children: [
                SizedBox(
                  height: Get.height * 0.05,
                ),
                const Text(
                  'Registro',
                  style: TextStyle(fontSize: 32),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                InputFieldWidget(
                  hinttext: 'Nombre',
                  left: 60,
                  right: 60,
                  width: Get.width,
                  onChanged: null,
                  keyboardType: null,
                  obscureText: false,
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                InputFieldWidget(
                  hinttext: 'Correo Electrónico',
                  left: 60,
                  right: 60,
                  width: Get.width,
                  onChanged: null,
                  keyboardType: null,
                  obscureText: false,
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                InputFieldWidget(
                  hinttext: 'Movil',
                  left: 60,
                  right: 60,
                  width: Get.width,
                  onChanged: null,
                  keyboardType: null,
                  obscureText: false,
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                InputFieldWidget(
                  hinttext: 'Contraseña',
                  left: 60,
                  right: 60,
                  width: Get.width,
                  onChanged: null,
                  keyboardType: null,
                  obscureText: false,
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                InputFieldWidget(
                  hinttext: 'Confirmar Contraseña',
                  left: 60,
                  right: 60,
                  width: Get.width,
                  onChanged: null,
                  keyboardType: null,
                  obscureText: false,
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                CustomButton(
                  width: Get.width,
                  left: 60,
                  right: 60,
                  onPressed: null,
                  title: 'Confirmar Contraseña',
                  color: Colors.black,
                ),
              ]),
            ),
            SizedBox(
              width: Get.width,
              height: Get.height * 0.04,
              child: const Image(
                  image: AssetImage('assets/cuadrados_negros.png'),
                  fit: BoxFit.contain),
            )
          ],
        ),
      ),
    );
  }
}

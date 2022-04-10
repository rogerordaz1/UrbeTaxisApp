import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urbe_taxis/Cliente/Widget/Input.dart';
import 'package:urbe_taxis/Cliente/pages/register.dart';

import '../Widget/Custom_buttom.dart';

class LoginCLient extends StatelessWidget {
  const LoginCLient({Key? key}) : super(key: key);

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
                  height: Get.height * 0.2,
                ),
                const Text(
                  'Inicio de Sesión',
                  style: TextStyle(fontSize: 32),
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                InputFieldWidget(
                  hinttext: 'Usuario',
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
                InputFieldWidget(
                  hinttext: 'Contrasena',
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
                  title: 'Inicio de Sesión',
                  color: Colors.black,
                ),
                SizedBox(
                  height: Get.height * 0.13,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '¿No tines una cuenta? ',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    GestureDetector(
                      child: Column(
                        children: [
                          const Text(
                            'Regístrate',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 2),
                            color: Colors.white,
                            height: 2,
                            width: 88,
                          )
                        ],
                      ),
                      onTap: () => Get.to(() => const RegisterPage()),
                    ),
                  ],
                )
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

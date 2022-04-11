import 'package:get/get.dart';
import 'package:urbe_taxis/Cliente/models/rutas_mapbox.dart';

class RutasProvider extends GetConnect {
  String token =
      'pk.eyJ1IjoiamF2aWVyOTgwNTA2MDIiLCJhIjoiY2wxcnV6cXdnMG8xNDNqbzk1cHBsNzRuciJ9.U_npzOoO9d4x4HYJ4uclCQ';

  Future<RutasMapbox> getRutas(var pos1, var pos2) async {
    final response = await get(
        'https://api.mapbox.com/directions/v5/mapbox/driving-traffic/$pos1;$pos2.json?access_token=$token');

    response.body;
    final respuesta = RutasMapbox.fromJson(response.body);
    print(respuesta.routes![0].geometry);

    return respuesta;
  }
}

import 'package:carros/pages/carro/carro.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class TipoCarro {
  static final String classicos = "classicos";
  static final String esportivos = "esportivos";
  static final String luxo = "luxo";
}

class CarrosApi {
  static Future<List<Carro>> getCarros(String tipo) async {
    /*
    // A outra maneira de fazer tratamento do erro é no snapshot do FutureBuilder, ao invés de usar o try..catch aqui no método API.
    try {
    */

    /*
    String s = tipo.toString().replaceAll("TipoCarro.", "");
    var url = 'https://carros-springboot.herokuapp.com/api/v1/carros/tipo/$s';
    */

    var url =
        'https://carros-springboot.herokuapp.com/api/v1/carros/tipo/$tipo';

    print("GET > $url");

    var response = await http.get(url);

    String json = response.body;
    //print(json);

    List list = convert.json.decode(json);

    /*
    // Map manual com for().
    final carros = List<Carro>();

    for (Map map in list) {
      Carro c = Carro.fromJson(map);
      carros.add(c);
    }
    */

    /*
    final carros = list.map<Carro>((map) {
      return Carro.fromJson(map);
    }).toList();
    */

    final carros = list.map<Carro>((map) => Carro.fromJson(map)).toList();

    return carros;
    /*
    } catch (error) {
      print(error);
    }
    */
  }
}

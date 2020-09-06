import 'package:carros/pages/carro/carro.dart';

class CarrosApi {
  static Future<List<Carro>> getCarros() async {
    await Future.delayed(Duration(seconds: 2));

    final carros = List<Carro>();

    carros.add(Carro(
      nome: "AUDI GT Spyder",
      urlFoto:
          "https://s3-sa-east-1.amazonaws.com/videos.livetouchdev.com.br/esportivos/Audi_Spyder.png",
    ));
    carros.add(Carro(
      nome: "Porsche Panamera",
      urlFoto:
          "https://s3-sa-east-1.amazonaws.com/videos.livetouchdev.com.br/esportivos/Porsche_Panamera.png",
    ));
    carros.add(Carro(
      nome: "Lamborghini Aventador",
      urlFoto:
          "https://s3-sa-east-1.amazonaws.com/videos.livetouchdev.com.br/esportivos/Lamborghini_Aventador.png",
    ));

    return carros;
  }
}

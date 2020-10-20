import 'package:carros/pages/carro/carro.dart';
import 'package:carros/pages/carro/carros_api.dart';
import 'package:carros/pages/carro/simple_bloc.dart';

class CarrosBloc extends SimpleBloc<List<Carro>> {
  Future<List<Carro>> fetch(String tipo) async {
    List<Carro> carros;

    try {
      carros = await CarrosApi.getCarros(tipo);

      add(carros);
    } on Exception catch (e) {
      addError(e);
    }

    return carros;
  }
}

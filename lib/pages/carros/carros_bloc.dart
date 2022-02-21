import 'package:carros/pages/carros/carro.dart';
import 'package:carros/pages/carros/carros_api.dart';
import 'package:carros/pages/carros/simple_bloc.dart';
import 'package:carros/pages/carros/carro_dao.dart';
import 'package:carros/utils/network.dart';

class CarrosBloc extends SimpleBloc<List<Carro>> {
  Future<List<Carro>> fetch(String tipo) async {
    List<Carro> carros;

    try {
      if (!await isNetworkOn()) {
        print("Busca local...");

        carros = await CarroDAO().findAllByTipo(tipo);
      } else {
        carros = await CarrosApi.getCarros(tipo);

        if (carros.isNotEmpty) {
          final dao = CarroDAO();

          // Salvar todos os carros
          carros.forEach(dao.save);
        }
      }

      add(carros);

      return carros;
    } on Exception catch (e) {
      addError(e);
    }

    return null;
  }
}

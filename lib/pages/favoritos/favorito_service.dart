import 'package:carros/pages/carros/carro.dart';
import 'package:carros/pages/favoritos/favorito.dart';
import 'package:carros/pages/favoritos/favorito_dao.dart';

class FavoritoService {
  static favoritar(Carro c) async {
    /*
    Favorito f = Favorito();
    f.id = c.id;
    f.nome = c.nome;
    */

    Favorito f = Favorito.fromCarro(c);

    final dao = FavoritoDAO();

    final exists = await dao.exists(c.id);

    if (exists) {
      // Remove dos favoritos
      dao.delete(c.id);
    } else {
      // Adiciona nos favoritos
      dao.save(f);
    }
  }
}

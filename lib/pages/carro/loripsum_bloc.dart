import 'dart:async';

import 'package:carros/pages/carro/loripsum_api.dart';

class LoripsumBloc {
  final _streamController = StreamController<String>();

  Stream<String> get stream => _streamController.stream;

  fetch() async {
    try {
      String s = await LoripsumApi.getLoripsum();

      _streamController.add(s);
    } on Exception catch (e) {
      _streamController.addError(e);
    }
  }

  void dispose() {
    _streamController.close();
  }
}

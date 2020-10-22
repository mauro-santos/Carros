import 'dart:async';

import 'package:carros/pages/carros/loripsum_api.dart';

class LoripsumBloc {
  static String s;

  final _streamController = StreamController<String>();

  Stream<String> get stream => _streamController.stream;

  fetch() async {
    try {
      s = s ?? await LoripsumApi.getLoripsum();

      _streamController.add(s);
    } on Exception catch (e) {
      _streamController.addError(e);
    }
  }

  void dispose() {
    _streamController.close();
  }
}

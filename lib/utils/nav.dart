import 'package:flutter/material.dart';

Future push(BuildContext context, Widget page) {
  return Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
    return page;
  }));
}

pop(BuildContext context, {String text}) {
  text != null ? Navigator.pop(context, text) : Navigator.pop(context);
}

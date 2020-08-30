import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final showProgress;

  AppButton(this.text, {this.onPressed, this.showProgress = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      child: RaisedButton(
        color: Colors.blue,
        child: showProgress
            ? Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Aguarde",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              )
            : Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
        onPressed: showProgress ? () => {} : onPressed,
      ),
    );
  }
}

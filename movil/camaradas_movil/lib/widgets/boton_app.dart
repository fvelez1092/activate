import 'package:flutter/material.dart';

class BotonApp extends StatelessWidget {
  late Color color;
  late String texto;
  Function ?onPressedFunction;

  BotonApp({
  required this.texto,
  this.color = Colors.black,
  this.onPressedFunction

  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: (){
          onPressedFunction!();
        },
        child: Text(texto),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          primary: color,
          onPrimary: Colors.black
        ),
      ),
    );
  }
}

// ignore_for_file: file_names
import 'package:flutter/material.dart';

class BotonesMenu extends StatelessWidget {
  String pathImage = "assets/img/diente.png";
  String ruta = "";

  BotonesMenu(this.pathImage, this.ruta);
  @override
  Widget build(BuildContext context) {
    final icono = Container(
      height: 150.0,
      width: 150.0,
      margin: EdgeInsets.only(top: 30.0, left: 35.0),
      child: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: FlatButton(
            onPressed: () {
              Navigator.pushNamed(context, ruta);
            },
            padding: EdgeInsets.all(75),
            child: Image.asset(pathImage)),
      ),
      decoration: BoxDecoration(
          image:
              DecorationImage(fit: BoxFit.cover, image: AssetImage(pathImage)),
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(width: 5.0, color: Colors.black)),
    );

    return Container(child: icono);
  }
}

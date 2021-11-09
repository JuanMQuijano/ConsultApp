// ignore_for_file: file_names
import 'package:flutter/material.dart';

class OpcionesMenu extends StatelessWidget {
  String pathImage = "assets/img/diente.png";
  String texto = "Nombre Clinica";
  String ruta = "";

  OpcionesMenu(this.pathImage, this.texto, this.ruta);
  @override
  Widget build(BuildContext context) {
    final btn = Container(
      height: 130.0,
      width: 300.0,
      margin: EdgeInsets.only(
        top: 20.0,
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: FlatButton(
          onPressed: () {
            Navigator.pushNamed(context, ruta);
          },
          padding: EdgeInsets.all(75),
          child: Image.asset(pathImage),
        ),
      ),
      decoration: BoxDecoration(
          image:
              DecorationImage(fit: BoxFit.cover, image: AssetImage(pathImage)),
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(width: 3.0, color: Colors.black)),
    );

    return Column(
      children: <Widget>[
        btn,
        Text(
          texto,
          style: TextStyle(
              color: Colors.black,
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              fontFamily: "Lato",
              decoration: TextDecoration.none),
        )
      ],
    );
  }
}

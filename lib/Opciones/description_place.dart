import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'register_form.dart';
import 'package:ejemplo/menuBlanqueamiento.dart';

class DescriptionPlace extends StatelessWidget {
  String namePlace;
  int stars = 0;
  String descriptionPlace;
  String rutas;

  DescriptionPlace(this.namePlace, this.descriptionPlace, this.rutas);

  @override
  Widget build(BuildContext context) {
    final star_half = Container(
      margin: EdgeInsets.only(
        top: 323.0,
        right: 3.0,
      ),
      child: Icon(Icons.star_half, color: Color(0xFFf2C611)),
    );

    final star_border = Container(
      margin: EdgeInsets.only(
        top: 323.0,
        right: 3.0,
      ),
      child: Icon(Icons.star_border, color: Color(0xFFf2C611)),
    );

    final star = Container(
      margin: EdgeInsets.only(
        top: 323.0,
        right: 3.0,
      ),
      child: Icon(Icons.star, color: Color(0xFFf2C611)),
    );

    final title_stars = Row(
      //Todo lo que va en Fila
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            top: 320.0,
            left: 20.0,
            right: 20.0,
          ),
          child: Text(
            namePlace,
            style: TextStyle(
                fontFamily: "Lato",
                fontSize: 23.0,
                fontWeight: FontWeight.w900),
            textAlign: TextAlign.left,
          ),
        ),
        Row(
          children: <Widget>[star, star, star, star_half, star_border],
        ),
      ],
    );

    final description = Container(
      margin: EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0),
      child: new Text(
        descriptionPlace,
        style: const TextStyle(
            fontFamily: "Lato",
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF56575a)),
        textAlign: TextAlign.left,
      ),
    );

    final btnAgendar = Container(
      margin: EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0),
      height: 50.0,
      width: 150.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          gradient: LinearGradient(
              colors: [Color(0xFF4268D3), Color(0xFF584CD1)],
              begin: FractionalOffset(0.2, 0.0),
              end: FractionalOffset(1.0, 0.6),
              stops: [0.0, 0.6],
              tileMode: TileMode.clamp)),
      child: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: FlatButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RegisterForm(namePlace)));
            },
            child: Text("Agendar",
                style: TextStyle(
                    fontSize: 18.0, fontFamily: "Lato", color: Colors.white))),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[title_stars, description, btnAgendar],
    );
  }
}

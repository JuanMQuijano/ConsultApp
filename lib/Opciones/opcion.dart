import 'package:ejemplo/Opciones/card_list.dart';
import 'package:ejemplo/user_profile.dart';
import 'package:flutter/material.dart';
import 'description_place.dart';
import 'review_list.dart';

/*Esta clase crea la Interfaz de opcion General, generando así una interfaz con los parametros ingresados*/
class Opcion extends StatelessWidget {
  String pathImage = "a",
      nombreClinica = "a",
      descripcion = "a",
      nUsuario = "a",
      comment = "a",
      nUsuario2 = "a",
      comment2 = "a",
      nUsuario3 = "a",
      comment3 = "",
      ruta = "";

  Opcion(
      this.pathImage,
      this.nombreClinica,
      this.descripcion,
      this.nUsuario,
      this.comment,
      this.nUsuario2,
      this.comment2,
      this.nUsuario3,
      this.comment3,
      this.ruta);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              boxShadow: <BoxShadow>[BoxShadow(color: Colors.white)]),
        ),
        ListView(
          children: [
            DescriptionPlace(nombreClinica, descripcion, ruta),
            ReviewList.general(
                nUsuario, comment, nUsuario2, comment2, nUsuario3, comment3)
          ],
        ),
        Column(children: [
          Container(
            height: 50.0,
            margin: EdgeInsets.only(top: 24.0),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xFF4268D3), Color(0xFF584CD1)],
                    begin: FractionalOffset(0.2, 0.0),
                    end: FractionalOffset(1.0, 0.6),
                    stops: [0.0, 0.6],
                    tileMode: TileMode.clamp)),
            child: Row(children: [
              ElevatedButton(
                  child: Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () {
                    Navigator.pushNamed(context, ruta);
                  }),
              Container(
                child: Text(
                  nombreClinica,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                      fontFamily: "Lato"),
                ),
                margin: EdgeInsets.only(left: 15.0),
              ),
              Container(
                child: ElevatedButton(
                    child: Icon(Icons.account_box, color: Colors.black),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UserProfile()),
                      );
                    }),
                margin: EdgeInsets.only(left: 10.0),
              )
            ]),
          ),
          CardList(pathImage)
        ])
      ],
    )));
  }
}

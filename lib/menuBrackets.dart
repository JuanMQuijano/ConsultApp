// ignore_for_file: file_names
import 'package:ejemplo/Opciones/opcion.dart';
import 'package:ejemplo/opcionesMenu.dart';
import 'package:ejemplo/user_profile.dart';
import 'menu.dart';
import 'package:flutter/material.dart';
import 'opcionesMenu.dart';

class MenuBrackets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ConsultApp',
      home: Scaffold(
        body: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(routes: <String, WidgetBuilder>{
      "/back": (BuildContext context) => MenuBrackets(),
      "/opcion1": (BuildContext context) => Opcion(
          "assets/img/clinica2.png",
          "Clinica Sonrisas Felices",
          "El mejor lugar para tu boca",
          /*Comment 1*/
          "Luis Muñoz",
          "Muy buena atención",
          /*Comment 2*/
          "Alberto Devia",
          "La mejor clinica dental de Popayán",
          /*Comment 3*/
          "Carlos Orozco",
          "Buen servicio",
          "/back"),
      "/opcion2": (BuildContext context) => Opcion(
          "assets/img/dental.png",
          "Clinica Dental",
          "El mejor lugar para tus dientes tristes",
          /*Comment 1*/
          "Carlos Orozco",
          "Buen servicio",
          /*Comment 2*/
          "Luis Muñoz",
          "Muy buena atención",
          /*Comment 3*/
          "Alberto Devia",
          "La mejor clinica dental de Popayán",
          "/back"),
    }, home: Home2());
  }
}

class Home2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            boxShadow: <BoxShadow>[BoxShadow(color: Colors.white)]),
        child: ListView(scrollDirection: Axis.vertical, children: <Widget>[
          NavBar(),
          new OpcionesMenu("assets/img/clinica2.png",
              "Clinica Sonrisas Felices", "/opcion1"),
          new OpcionesMenu("assets/img/dental.png", "Prueba", "/opcion2"),
          // new OpcionesMenu("assets/img/dental.png", "Prueba"),
        ]));
  }
}

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Menu()),
              );
            }),
        Container(
          child: Text(
            'Ortodoncia',
            style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
                fontFamily: "Lato"),
          ),
          margin: EdgeInsets.only(left: 80.0),
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
          margin: EdgeInsets.only(left: 50.0),
        )
      ]),
    );
  }
}

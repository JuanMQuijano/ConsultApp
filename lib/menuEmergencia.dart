// ignore_for_file: file_names
import 'package:ejemplo/Opciones/opcion.dart';
import 'package:ejemplo/opcionesMenu.dart';
import 'package:ejemplo/user_profile.dart';
import 'menu.dart';
import 'package:flutter/material.dart';
import 'opcionesMenu.dart';

class MenuEmergencia extends StatelessWidget {
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
      "/back": (BuildContext context) => MenuEmergencia(),
      "/opcion1": (BuildContext context) => Opcion(
          "assets/img/dental.png",
          "Clinica Sonrisas Felices",
          "El mejor lugar para tu boca",
          /*Comment 1*/
          "Alberto Devia",
          "La mejor clinica dental de Popayán",
          /*Comment 2*/
          "Carlos Orozco",
          "Buen servicio",
          /*Comment 3*/
          "Luis Muñoz",
          "Muy buena atención",
          "/back"),
      "/opcion2": (BuildContext context) => Opcion(
          "assets/img/dental.png",
          "Clinica Sonrisas Felices",
          "El mejor lugar para tu boca",
          /*Comment 1*/
          "Alberto Devia",
          "La mejor clinica dental de Popayán",
          /*Comment 2*/
          "Carlos Orozco",
          "Buen servicio",
          /*Comment 3*/
          "Luis Muñoz",
          "Muy buena atención",
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
        child: Column(children: <Widget>[
          NavBar(),
          new OpcionesMenu(
              "assets/img/dental.png", "Clinica Sonrisas Felices", "/opcion1"),
          new OpcionesMenu("assets/img/dental.png", "Prueba", "/opcion2"),
          //new OpcionesMenu("assets/img/dental.png", "Prueba"),
        ]));
  }
}

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Menu()),
              );
            }),
        Container(
          child: Text(
            'Emergencias',
            style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
                fontFamily: "Lato"),
          ),
          margin: EdgeInsets.only(left: 80),
        ),
      ]),
    );
  }
}

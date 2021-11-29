import 'package:ejemplo/botonesMenu.dart';
import 'package:ejemplo/menuBlanqueamiento.dart';
import 'package:ejemplo/menuBrackets.dart';
import 'package:ejemplo/menuCaries.dart';
import 'package:ejemplo/menuEmergencia.dart';
import 'package:ejemplo/menuExtraccion.dart';
import 'package:ejemplo/menuGeneral.dart';
import 'package:ejemplo/user_profile.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class Menu extends StatelessWidget {
  String email = "";
  Menu(String email) {
    this.email = email;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        "/opcion1": (BuildContext context) => MenuBlanqueamiento(email),
        "/opcion2": (BuildContext context) => MenuCaries(email),
        "/opcion3": (BuildContext context) => MenuGeneral(email),
        "/opcion4": (BuildContext context) => MenuBrackets(email),
        "/opcion5": (BuildContext context) => MenuExtraccion(email),
        "/opcion6": (BuildContext context) => MenuEmergencia(email),
      },
      title: 'ConsultApp',
      home: Scaffold(
        body: Container(
            child: Center(
              child: Column(children: <Widget>[
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Main()),
                          );
                        }),
                    Container(
                      child: Text(
                        'Menú Principal',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none,
                            fontFamily: "Lato"),
                      ),
                      margin: EdgeInsets.only(left: 70.0),
                    ),
                    Container(
                      child: ElevatedButton(
                          child: Icon(Icons.account_box, color: Colors.black),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UserProfile(email),
                                ));
                          }),
                      margin: EdgeInsets.only(left: 30.0),
                    )
                  ]),
                ),
                Row(children: <Widget>[
                  new BotonesMenu("assets/img/blanqueamiento.png", "/opcion1"),
                  new BotonesMenu("assets/img/caries.png", "/opcion2"),
                ]),
                Row(children: <Widget>[
                  new BotonesMenu("assets/img/herramientas.png", "/opcion3"),
                  new BotonesMenu("assets/img/brackets.png", "/opcion4"),
                ]),
                Row(children: <Widget>[
                  new BotonesMenu("assets/img/extraccion.png", "/opcion5"),
                  new BotonesMenu("assets/img/sirena.png", "/opcion6"),
                ])
              ]),
            ),
            decoration: BoxDecoration(
                boxShadow: <BoxShadow>[BoxShadow(color: Colors.white)])),
      ),
    );
  }
}

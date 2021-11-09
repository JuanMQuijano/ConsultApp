import 'package:ejemplo/Opciones/button_purple.dart';
import 'package:ejemplo/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:ejemplo/Menu.dart';

class RegisterForm extends StatelessWidget {
  String namePlace = "";
  RegisterForm(
    this.namePlace,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ConsultApp',
      home: Scaffold(
        body: Home(namePlace),
      ),
    );
  }
}

class Home extends StatelessWidget {
  String namePlace = "";

  Home(this.namePlace);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          NavBar(namePlace),
          campoComments(),
          Calendario(),
          ButtonPurple("Confirmar")
        ],
      )),
      decoration:
          BoxDecoration(boxShadow: <BoxShadow>[BoxShadow(color: Colors.white)]),
    );
  }
}

class campoComments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
      child: TextField(
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            hintText: 'Agregar un comentario: ',
            fillColor: Colors.white,
            filled: true),
      ),
      margin: EdgeInsets.only(top: 10.0),
    );
  }
}

class Calendario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 355.0,
        width: 250.0,
        margin: EdgeInsets.only(top: 10.0),
        child: ListView(scrollDirection: Axis.vertical, children: <Widget>[
          Text(
            "Elige una fecha",
            style: TextStyle(fontSize: 20.0),
            textAlign: TextAlign.center,
          ),
          CalendarDatePicker(
            initialDate: DateTime.now(),
            firstDate: DateTime.utc(2021),
            lastDate: DateTime.utc(2023),
            onDateChanged: (value) => 1,
          )
        ]));
  }
}

class NavBar extends StatelessWidget {
  String namePlace = "";

  NavBar(this.namePlace);

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
                  context, MaterialPageRoute(builder: (context) => Menu()));
            }),
        Container(
          child: Text(
            namePlace,
            style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
                fontFamily: "Lato"),
          ),
          margin: EdgeInsets.only(left: 30.0),
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
        )
      ]),
    );
  }
}

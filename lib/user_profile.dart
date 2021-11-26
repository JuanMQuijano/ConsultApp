import 'package:ejemplo/menu.dart';
import 'package:ejemplo/modify.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  String email = "", nombre = "", telefono = "";

  UserProfile(String email) {
    this.email = email;
  }

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  void _read() async {
    try {
      var result = await firestore
          .collection('registros')
          .where("Correo", isEqualTo: email)
          .get();
      result.docs.forEach((element) {
        print(element.data());
      });
    } catch (e) {
      print("No hay un correo asignado");
    }
  }

  @override
  Widget build(BuildContext context) {
    final icono = Container(
      height: 100.0,
      width: 100.0,
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.cover, image: AssetImage("assets/img/diente.png")),
      ),
    );

    final campoNombre = Container(
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
      child: TextField(
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            hintText: 'Nombre', fillColor: Colors.white, filled: true),
        onChanged: (value) {
          nombre = value;
        },
      ),
      margin: EdgeInsets.only(top: 35.0),
    );

    final campoTelefono = Container(
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
      child: TextField(
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            hintText: 'Teléfono', fillColor: Colors.white, filled: true),
        onChanged: (value) {
          telefono = value;
        },
      ),
      margin: EdgeInsets.only(top: 10.0),
    );

    final campoNacimiento = Container(
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
      child: TextField(
        textAlign: TextAlign.center,
        obscureText: true,
        decoration: InputDecoration(
            hintText: 'Fecha Nacimiento',
            fillColor: Colors.white,
            filled: true),
      ),
      margin: EdgeInsets.only(top: 10.0),
    );

    final Botones = Column(children: <Widget>[
      InkWell(
        onTap: () async {
          try {
            await firestore
                .collection('registros')
                .doc('fUAcfzEID25ogjJJ85JY')
                .update({
              'Nombre': nombre,
              'Telefono': telefono,
            });
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Actualización éxitosa")));
          } catch (e) {
            print(e);
          }
        },
        child: Container(
          margin: EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0),
          height: 50.0,
          width: 130.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              gradient: LinearGradient(
                  colors: [Color(0xFF4268D3), Color(0xFF584CD1)],
                  begin: FractionalOffset(0.2, 0.0),
                  end: FractionalOffset(1.0, 0.6),
                  stops: [0.0, 0.6],
                  tileMode: TileMode.clamp)),
          child: Center(
            child: Text(
              'Modificar',
              style: TextStyle(
                  fontSize: 18.0, fontFamily: "Lato", color: Colors.white),
            ),
          ),
        ),
      ),
      InkWell(
        onTap: () {
          _read();
        },
        child: Container(
          margin: EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0),
          height: 50.0,
          width: 180.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              gradient: LinearGradient(
                  colors: [Color(0xFF4268D3), Color(0xFF584CD1)],
                  begin: FractionalOffset(0.2, 0.0),
                  end: FractionalOffset(1.0, 0.6),
                  stops: [0.0, 0.6],
                  tileMode: TileMode.clamp)),
          child: Center(
            child: Text(
              "Comprobar",
              style: TextStyle(
                  fontSize: 18.0, fontFamily: "Lato", color: Colors.white),
            ),
          ),
        ),
      )
    ]);

    final NavBar = Container(
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
            'Perfil',
            style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
                fontFamily: "Lato"),
          ),
          margin: EdgeInsets.only(left: 90.0),
        )
      ]),
    );

    final body = MaterialApp(
        home: Scaffold(
            body: ListView(children: [
      Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          NavBar,
          icono,
          campoNombre,
          campoTelefono,
          campoNacimiento,
          Botones
        ],
      )),
    ])));
    return body;
  }
}

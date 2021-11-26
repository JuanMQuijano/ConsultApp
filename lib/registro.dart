import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'main.dart';

class Registro extends StatelessWidget {
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
  String email = "", password = "", nombre = "", telefono = "";
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          NavBar(),
          Container(
            padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
            child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  hintText: 'Nombre', fillColor: Colors.white, filled: true),
              onChanged: (value) {
                nombre = value;
              },
            ),
            margin: EdgeInsets.only(top: 10.0),
          ),
          Container(
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
          ),
          Container(
            padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
            child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  hintText: 'Correo', fillColor: Colors.white, filled: true),
              onChanged: (value) {
                email = value;
              },
            ),
            margin: EdgeInsets.only(top: 10.0),
          ),
          Container(
            padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
            child: TextField(
                textAlign: TextAlign.center,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'Contraseña',
                    fillColor: Colors.white,
                    filled: true),
                onChanged: (value) {
                  password = value;
                }),
            margin: EdgeInsets.only(top: 10.0),
          ),
          campoNacimiento(),
          InkWell(
              onTap: () async {
                try {
                  await firestore.collection('registros').add({
                    'Nombre': nombre,
                    'Telefono': telefono,
                    'Correo': email,
                    'Cotraseña': password
                  });
                  UserCredential userCredential = await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: email, password: password);
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Registro éxitoso")));
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'weak-password') {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("La contraseña es muy debil")));
                  } else if (e.code == 'email-already-in-use') {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            "El correo ya se encuentra asociado a una cuenta")));
                  }
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
                    'Registrar',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: "Lato",
                        color: Colors.white),
                  ),
                ),
              ))
        ],
      )),
    ]);
  }
}

class campoNacimiento extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
      child: TextField(
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            hintText: 'Fecha Nacimiento',
            fillColor: Colors.white,
            filled: true),
      ),
      margin: EdgeInsets.only(top: 10.0),
    );
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
                MaterialPageRoute(builder: (context) => Main()),
              );
            }),
        Container(
          child: Text(
            'Registro',
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
  }
}

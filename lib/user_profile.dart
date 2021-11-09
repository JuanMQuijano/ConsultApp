import 'package:ejemplo/menu.dart';
import 'package:ejemplo/modify.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
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
    return Container(
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          NavBar(),
          icono,
          campoNombre(),
          campoTelefono(),
          campoNacimiento(),
          Botones()
        ],
      )),
      decoration:
          BoxDecoration(boxShadow: <BoxShadow>[BoxShadow(color: Colors.white)]),
    );
  }
}

final icono = Container(
  height: 100.0,
  width: 100.0,
  decoration: BoxDecoration(
    image: DecorationImage(
        fit: BoxFit.cover, image: AssetImage("assets/img/diente.png")),
  ),
);

class campoNombre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
      child: TextField(
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            hintText: 'Nombre', fillColor: Colors.white, filled: true),
      ),
      margin: EdgeInsets.only(top: 35.0),
    );
  }
}

class campoTelefono extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
      child: TextField(
        textAlign: TextAlign.center,
        obscureText: true,
        decoration: InputDecoration(
            hintText: 'Teléfono', fillColor: Colors.white, filled: true),
      ),
      margin: EdgeInsets.only(top: 10.0),
    );
  }
}

class campoCorreo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
      child: TextField(
        textAlign: TextAlign.center,
        obscureText: true,
        decoration: InputDecoration(
            hintText: 'Correo', fillColor: Colors.white, filled: true),
      ),
      margin: EdgeInsets.only(top: 10.0),
    );
  }
}

class campoPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
      child: TextField(
        textAlign: TextAlign.center,
        obscureText: true,
        decoration: InputDecoration(
            hintText: 'Contraseña', fillColor: Colors.white, filled: true),
      ),
      margin: EdgeInsets.only(top: 10.0),
    );
  }
}

class campoNacimiento extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
  }
}

class Botones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Modify()),
          );
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
    ]);
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
  }
}

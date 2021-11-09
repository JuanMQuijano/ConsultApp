// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'menu.dart';
import 'registro.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
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

final icono = Container(
  height: 100.0,
  width: 100.0,
  decoration: BoxDecoration(
    image: DecorationImage(
        fit: BoxFit.cover, image: AssetImage("assets/img/diente.png")),
  ),
);

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icono,
          bienvenido(),
          campoUsuario(),
          campoPassword(),
          Botones()
        ],
      )),
      decoration:
          BoxDecoration(boxShadow: <BoxShadow>[BoxShadow(color: Colors.white)]),
    );
  }
}

class bienvenido extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Bienvenido',
      style: TextStyle(
          color: Colors.black, fontSize: 40.0, fontWeight: FontWeight.bold),
    );
  }
}

class campoUsuario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.0, right: 5.0, top: 5.0),
      child: TextField(
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            hintText: 'Usuario', fillColor: Colors.white, filled: true),
      ),
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
    );
  }
}

class Botones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Menu()),
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
                'Ingresar',
                style: TextStyle(
                    fontSize: 18.0, fontFamily: "Lato", color: Colors.white),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Registro()),
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
                'Registrar',
                style: TextStyle(
                    fontSize: 18.0, fontFamily: "Lato", color: Colors.white),
              ),
            ),
          ),
        )
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }
}

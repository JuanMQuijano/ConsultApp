import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ejemplo/Menu.dart';

class RegisterForm extends StatelessWidget {
  String namePlace = "";
  String comentario = "";
  String nombre = "";
  DateTime _selectedValue = DateTime.now();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  RegisterForm(
    this.namePlace,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(children: [
          Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
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
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Menu()));
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
                ]),
              ),
              Container(
                padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: 'Comentario',
                      fillColor: Colors.white,
                      filled: true),
                  onChanged: (value) {
                    comentario = value;
                  },
                ),
                margin: EdgeInsets.only(top: 10.0),
              ),
              Container(
                padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: 'aaa', fillColor: Colors.white, filled: true),
                  onChanged: (value) {
                    nombre = value;
                  },
                ),
                margin: EdgeInsets.only(top: 10.0),
              ),
              Container(
                child: DatePicker(DateTime.now(),
                    initialSelectedDate: DateTime.now(),
                    selectionColor: Colors.black,
                    selectedTextColor: Colors.white, onDateChange: (date) {
                  _selectedValue = date;
                }),
              ),
              InkWell(
                  onTap: () async {
                    try {
                      await firestore.collection('citas').add({
                        'Comentario': comentario,
                        'Fecha': _selectedValue,
                        'Nombre': nombre
                      });
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
          ))
        ]),
      ),
    );
  }
}

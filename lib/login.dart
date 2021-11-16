// ignore_for_file: file_names
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'menu.dart';
import 'registro.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final login = MaterialApp(
      title: 'ConsultApp',
      home: Scaffold(
        body: Home(),
      ),
    );

    return login;
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
  final FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> signup(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      // Getting users credential
      UserCredential result = await auth.signInWithCredential(authCredential);
      User? user = result.user;

      if (result != null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Menu()));
      } // if result not null we simply call the MaterialpageRoute,
      // for go to the HomePage screen
    }
  }

  String email = "", contrasena = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icono,
          Text(
            'Bienvenido',
            style: TextStyle(
                color: Colors.black,
                fontSize: 40.0,
                fontWeight: FontWeight.bold),
          ),
          Container(
            padding: EdgeInsets.only(left: 10.0, right: 5.0, top: 5.0),
            child: TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    hintText: 'Correo', fillColor: Colors.white, filled: true),
                onChanged: (value) {
                  email = value;
                }),
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
                  contrasena = value;
                }),
          ),
          Row(
            children: <Widget>[
              InkWell(
                onTap: () async {
                  try {
                    final user = await auth.signInWithEmailAndPassword(
                        email: email, password: contrasena);
                    if (user != null) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Menu()));
                    }
                  } catch (e) {
                    print(e);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Verifique los datos ingresados")));
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
                      'Ingresar',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontFamily: "Lato",
                          color: Colors.white),
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
                          fontSize: 18.0,
                          fontFamily: "Lato",
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          FlatButton.icon(
              onPressed: () {
                signup(context);
              },
              icon: Icon(Icons.account_box),
              label: Text("Ingresar Con Google"))
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
          onChanged: (value) {
            // email = value;
          }),
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

// class Botones extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: <Widget>[
//         InkWell(
//           onTap: () async {
//               try {
//                 final user = await auth.signInWithEmailAndPassword(
//                     email: email, password: contrasena);
//                 if (user != null) {
//                   Navigator.push(
//                       context, MaterialPageRoute(builder: (context) => Menu()));
//                 }
//               } catch (e) {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(content: Text("Verifique los datos ingresados")));
//               }
//             },
//           child: Container(
//             margin: EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0),
//             height: 50.0,
//             width: 130.0,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(30.0),
//                 gradient: LinearGradient(
//                     colors: [Color(0xFF4268D3), Color(0xFF584CD1)],
//                     begin: FractionalOffset(0.2, 0.0),
//                     end: FractionalOffset(1.0, 0.6),
//                     stops: [0.0, 0.6],
//                     tileMode: TileMode.clamp)),
//             child: Center(
//               child: Text(
//                 'Ingresar',
//                 style: TextStyle(
//                     fontSize: 18.0, fontFamily: "Lato", color: Colors.white),
//               ),
//             ),
//           ),
//         ),
//         InkWell(
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => Registro()),
//             );
//           },
//           child: Container(
//             margin: EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0),
//             height: 50.0,
//             width: 130.0,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(30.0),
//                 gradient: LinearGradient(
//                     colors: [Color(0xFF4268D3), Color(0xFF584CD1)],
//                     begin: FractionalOffset(0.2, 0.0),
//                     end: FractionalOffset(1.0, 0.6),
//                     stops: [0.0, 0.6],
//                     tileMode: TileMode.clamp)),
//             child: Center(
//               child: Text(
//                 'Registrar',
//                 style: TextStyle(
//                     fontSize: 18.0, fontFamily: "Lato", color: Colors.white),
//               ),
//             ),
//           ),
//         ),
//       ],
//       mainAxisAlignment: MainAxisAlignment.center,
//     );
//   }
// }

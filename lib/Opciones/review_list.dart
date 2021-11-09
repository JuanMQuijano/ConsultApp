import 'package:flutter/material.dart';
import 'review.dart';

class ReviewList extends StatelessWidget {
  String nUsuario = "a";
  String comment = "aa";
  String nUsuario2 = "a";
  String comment2 = "aa";
  String nUsuario3 = "a";
  String comment3 = "aa";

  ReviewList.paraBD(this.nUsuario, this.comment) {
    this.nUsuario = nUsuario;
    this.comment = comment;
  }
  ReviewList.general(String nUsuario, String comment, String nUsuario2,
      String comment2, String nUsuario3, String comment3) {
    this.nUsuario = nUsuario;
    this.comment = comment;
    this.nUsuario2 = nUsuario2;
    this.comment2 = comment2;
    this.nUsuario3 = nUsuario3;
    this.comment3 = comment3;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Review("assets/img/diente.png", nUsuario, comment),
        new Review("assets/img/diente.png", nUsuario2, comment2),
        new Review("assets/img/diente.png", nUsuario3, comment3)
      ],
    );
  }
}

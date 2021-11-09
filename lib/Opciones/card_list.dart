import 'package:flutter/material.dart';
import 'card_image.dart';

class CardList extends StatelessWidget {
  String pathImage = "";

  CardList(this.pathImage);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0,
      child: ListView(
        padding: EdgeInsets.all(25.0),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          new CardImage(pathImage),
          new CardImage(pathImage),
          new CardImage(pathImage),
        ],
      ),
    );
  }
}


import 'package:cineloj_v1/Views/home.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

import 'creditCardBack.dart';
import 'creditCardFront.dart';

class CreditCard extends StatefulWidget {
  @override
  _CreditCardState createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
  String _name = "";
  String _creditCardNumber = "";
  String _securityCode = "";

  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: FlipCard(
                key: cardKey,
                flipOnTouch: false,
                front: CreditCardFront(name: _name,creditCardNumber: _creditCardNumber),
                back: CreditCardBack(securityCode: _securityCode),
              ),
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  _name = value;
                });
              },
              decoration: InputDecoration(labelText: "Enter name",icon: Icon(Icons.person)),
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  _creditCardNumber = value;
                });
              },
              decoration: InputDecoration(labelText: "Enter credit card number",icon: Icon(Icons.credit_card)),
            ),
             TextField(
               onChanged: (value) {
                 setState(() {
                   _securityCode = value;
                 });
               },
              onSubmitted: (value) {
                setState(() {
                  cardKey.currentState.toggleCard();
                });
               },
              onTap: () {
                setState(() {
                  cardKey.currentState.toggleCard();
                });
              },
              decoration: InputDecoration(labelText: "Enter security code",icon: Icon(Icons.credit_card)),
            ),
            SizedBox(height: 12),
            RaisedButton(
              color: Colors.blue,
              child: Text('Reservar', style: TextStyle(color: Colors.white),),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CineHome()));
              },
            )
          ],
        ),
      ),
    );
  }
}

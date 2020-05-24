import 'package:finance_app/constants.dart';
import 'package:finance_app/data_provider/model/card_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ReusedCard extends StatelessWidget {
  static const TextStyle cardInfoHeaderStyle =
      TextStyle(fontSize: 10, color: Color(0XB3FFFFFF),fontWeight: FontWeight.bold);
  static const cardInfoDescriptionStyle =
      TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w700);

  final CardData cardData;

  ReusedCard({this.cardData});

  Color _getCardColor() {
    return (cardData.cardType.toLowerCase() == "visa")
        ? pinkThemeColor
        : Color(0XFF18284B);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 5, right: 5),
      padding: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: _getCardColor(),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(
                  Icons.check_circle,
                  color: Colors.lightGreenAccent.shade700,
                  size: 26,
                ),
                Text(
                  cardData.cardType,
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w700),
                )
              ],
            ),
          ),
          Expanded(
            child: Text(
              cardData.cardNumber,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  "CARD HOLDER",
                  style: cardInfoHeaderStyle,
                ),
              ),
              Text(
                "EXPIRES",
                style: cardInfoHeaderStyle,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                "CVV",
                style: cardInfoHeaderStyle,
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  cardData.individualName,
                  style: cardInfoDescriptionStyle,
                ),
              ),
              Text(
                cardData.date,
                style: cardInfoDescriptionStyle,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                cardData.cvv,
                style: cardInfoDescriptionStyle,
              )
            ],
          )
        ],
      ),
    );
  }
}

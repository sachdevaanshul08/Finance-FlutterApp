import 'package:finance_app/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'components/choice.dart';
import 'components/reused_card.dart';
import 'data_provider/model/card_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // This is the theme of your application.
          canvasColor: Colors.white,
          primaryColor: primaryColor),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Choice _selectedChoice = choices[0]; // The app's "state".

  int _current = 0;

  @override
  void initState() {
    super.initState();
    getCards();
  }

  void _select(Choice choice) {
    // Causes the app to rebuild with the new _selectedChoice.
    setState(() {
      _selectedChoice = choice;
    });
  }

  List<Widget> _cardList = [];

  List<Widget> getCards() {
    //get your cards here form webservice
    _cardList.add(ReusedCard(
        cardData: CardData(
            cardType: "VISA",
            cardNumber: "**** **** **** 4897",
            individualName: "Anshul Sachdeva",
            date: "08/22",
            cvv: "123")));
    _cardList.add(ReusedCard(
      cardData: CardData(
          cardType: "MasterCard",
          cardNumber: "**** **** **** **** 9999",
          individualName: "Bohemia",
          date: "08/21",
          cvv: "999"),
    ));
    return _cardList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 6,
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 240,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50)),
                      color: primaryColor),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      AppBar(
                        elevation: 0,
                        leading: CircleAvatar(
                          backgroundImage: AssetImage("images/Anshul.jpg"),
                        ),
                        actions: <Widget>[
                          PopupMenuButton(
                            onSelected: _select,
                            itemBuilder: (context) {
                              return choices.map((Choice choice) {
                                return PopupMenuItem<Choice>(
                                  value: choice,
                                  child: Text(choice.title),
                                );
                              }).toList();
                            },
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "My cards",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 160,
                  height: 210,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        width: 60,
                        height: 60,
                        child: Icon(
                          Icons.add,
                          color: primaryColor,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              child: PageView(
                                  children: _cardList,
                                  onPageChanged: (index) {
                                    setState(() {
                                      _current = index;
                                    });
                                  }),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: _cardList.map((t) {
                                int index = _cardList.indexOf(t);
                                return Container(
                                  width: 8.0,
                                  height: 8.0,
                                  margin: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 2.0),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: _current == index
                                        ? primaryColor
                                        : Colors.grey.shade400,
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 7,
            child: Padding(
              padding: EdgeInsets.only(
                left: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    "Popular Categories",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w900),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      RawMaterialButton(
                        elevation: 10,
                        child: Column(
                          children: <Widget>[
                            Icon(
                              Icons.payment,
                              color: Colors.white,
                            ),
                            Text(
                              "Bills",
                              style: TextStyle(
                                color: Color(0XFFB3FFFFFF),fontWeight: FontWeight.bold
                              ),
                            )
                          ],
                        ),
                        onPressed: () {},
                        fillColor: pinkThemeColor,
                        padding:
                            EdgeInsets.symmetric(vertical: 30, horizontal: 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      RawMaterialButton(
                        elevation: 10,
                        child: Column(
                          children: <Widget>[
                            Icon(
                              Icons.fastfood,
                              color: primaryColor,
                            ),
                            Text(
                              "Food",
                              style: TextStyle(
                                color: Colors.black,fontWeight: FontWeight.bold
                              ),
                            )
                          ],
                        ),
                        onPressed: () {},
                        fillColor: Colors.white,
                        padding:
                            EdgeInsets.symmetric(vertical: 30, horizontal: 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Latest Transactions",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w900),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

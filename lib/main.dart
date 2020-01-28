import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CardOutSideItem(),
    );
  }
}

class CardOutSideItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cardHeight = MediaQuery.of(context).size.height/3.5;
    var cardWidth = MediaQuery.of(context).size.width/2.5;

    return Scaffold(
      appBar: AppBar(),
      body: Container(    
        margin: EdgeInsets.all(5),    
        height: cardHeight,
        width: cardWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)
          ),
        ),
        child: Stack(
          fit: StackFit.loose,
          children: <Widget>[
            Positioned(
              bottom: 0,
              child: Container(
                height: cardHeight  - cardHeight * 0.3,
                width: cardWidth - cardWidth * 0.07,
                decoration: BoxDecoration(
                  color: Colors.green[400],
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0.0, 7.0),
                      blurRadius: 5
                    )
                  ],
                ),
              ),
            ),
            Container(
              //padding: EdgeInsets.all(10),
              alignment: AlignmentDirectional(0, 0),
              child: Image.asset("assets/vespa-amarela.png"),
            ),
            Container(
              width: cardWidth - cardWidth * 0.3,
              margin: EdgeInsets.only(bottom: 10),
              alignment: AlignmentDirectional(cardWidth * 2, 1),
              child: Text("bla bla vla asdfasd asdfas ",
                style: TextStyle(color: Colors.white), overflow: TextOverflow.ellipsis),
            )
          ],
        ),
      ),
    );
  }
}
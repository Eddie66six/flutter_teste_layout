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
      home: Scaffold(body: EvoCardPerfil(20)),
    );
  }
}

class EvoCardPerfil extends StatelessWidget {
  final double percentage;
  EvoCardPerfil(this.percentage);
  @override
  Widget build(BuildContext context) {
    var marginCard = 15.0;
    var paddingCard = 5.0;
    var widthCard = MediaQuery.of(context).size.width-marginCard*2;
    var heightCard = MediaQuery.of(context).size.height/5;
    var avatarRadius = heightCard/3 - paddingCard*2;

    var smallFontStyle = TextStyle(fontSize: 12);
    var smallFontStyleBold = TextStyle(fontSize: 12, fontWeight: FontWeight.bold);
    _buildAvatar(){
      return Expanded(
        flex: 2,
        child: Container(
          alignment: Alignment.topLeft,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: avatarRadius,
            backgroundImage:
              NetworkImage("http://www.vipcloset.com.br/media/catalog/product/cache/1/thumbnail/600x600/9df78eab33525d08d6e5fb8d27136e95/i/r/iron_maiden_eddie_giving_the_finger_ts_937_b.jpg"),
          ),
        ),
      );
    }

    _buildMiddle(){
      return Expanded(
              flex: 5,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Rodrigo Texeira"),
                        Row(
                          children: <Widget>[
                            Text("Nivel", style: smallFontStyle),
                            Text("  "),
                            Text("Azul, 3 grau", style: smallFontStyleBold),
                          ],
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text("Progresso", style: smallFontStyle),
                            Text(" - ", style: smallFontStyle),
                            Text("1000/1000", style: smallFontStyleBold),
                            Text(" "),
                            Text("sessoes", style: smallFontStyle)
                          ],
                        ),
                      LayoutBuilder(
                        builder: (context, box) => 
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 5),
                            height: 10,
                            width: percentage/100 * box.maxWidth,
                            decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(10),
                                right: Radius.circular(10)
                              )
                            ),
                          )
                        ),
                        Row(
                          children: <Widget>[
                            Icon(Icons.web_asset),
                            Icon(Icons.web_asset),
                            Icon(Icons.web_asset),
                            Icon(Icons.web_asset)
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
    }

    _buildRightSide(){
      return Expanded(
        flex: 2,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(Icons.more_vert),
              Column(
                children: <Widget>[
                  Text("Aguardando graduaçao", textAlign: TextAlign.right, style: smallFontStyle),
                  //size icons left
                  SizedBox(height: 36/2, width: 10)
                ],
              )
            ],
          ),
        )
      );
    }

    return Container(
          height: heightCard,
          width: widthCard,
          color: Colors.white,
          margin: EdgeInsets.all(marginCard),
          padding: EdgeInsets.all(paddingCard),
          child: Row(
            children: <Widget>[
              _buildAvatar(),
              _buildMiddle(),
              _buildRightSide()
            ],
          )
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

class Seila extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: Center(
        child: Stack(
          children: <Widget>[
            CustomPaint(
              painter: BorderPainter(),
              child: Container(
                height: MediaQuery.of(context).size.height -200,
                width: MediaQuery.of(context).size.width - 100,
              ),
            ),
            ClipPath(
              clipper: MyCustomClipper(),
              child: Container(
                  height: MediaQuery.of(context).size.height -210,
                  width: MediaQuery.of(context).size.width - 100,
                  color: Colors.white
                )
            )
          ],
          )
        ),
    );
  }
}

//https://dribbble.com/shots/9802474-Concert-Ticket-Booking-App/attachments/1834162?mode=media
class BorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.black45
      ..maskFilter = MaskFilter.blur(
        BlurStyle.normal, 3.0
      );
    Path path = Path();
    path.lineTo(0, 30);
      path.lineTo(0, size.height/2 -30);
      path.quadraticBezierTo(30, size.height/2-30, 30, size.height/2);
      path.quadraticBezierTo(30, size.height/2+30, 0, size.height/2+30);
      path.lineTo(0, size.height -30);
      path.quadraticBezierTo(size.width, size.height, 30, size.height-30);
      path.lineTo(0, size.height-30);
      path.quadraticBezierTo(0, size.height, 30, size.height);
      path.lineTo(size.width-30, size.height);
      path.quadraticBezierTo(size.width, size.height, size.width, size.height-30);
      path.lineTo(size.width, size.height/2+30);
      path.quadraticBezierTo(size.width-30, size.height/2+30, size.width-30, size.height/2);
      path.quadraticBezierTo(size.width-30, size.height/2-30, size.width, size.height/2-30);
      path.lineTo(size.width, 30);
      path.quadraticBezierTo(size.width, 0, size.width-30, 0);
      path.lineTo(30, 0);
      path.quadraticBezierTo(0, 0, 0, 30);
      path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

 class MyCustomClipper extends CustomClipper<Path> {
    @override
    Path getClip(Size size) {
      final path = Path();
      path.lineTo(0, 30);
      path.lineTo(0, size.height/2 -30);
      path.quadraticBezierTo(30, size.height/2-30, 30, size.height/2);
      path.quadraticBezierTo(30, size.height/2+30, 0, size.height/2+30);
      path.lineTo(0, size.height -30);
      path.quadraticBezierTo(size.width, size.height, 30, size.height-30);
      path.lineTo(0, size.height-30);
      path.quadraticBezierTo(0, size.height, 30, size.height);
      path.lineTo(size.width-30, size.height);
      path.quadraticBezierTo(size.width, size.height, size.width, size.height-30);
      path.lineTo(size.width, size.height/2+30);
      path.quadraticBezierTo(size.width-30, size.height/2+30, size.width-30, size.height/2);
      path.quadraticBezierTo(size.width-30, size.height/2-30, size.width, size.height/2-30);
      path.lineTo(size.width, 30);
      path.quadraticBezierTo(size.width, 0, size.width-30, 0);
      path.lineTo(30, 0);
      path.quadraticBezierTo(0, 0, 0, 30);
      path.close();
      return path;
    }
  
    @override
    bool shouldReclip(CustomClipper oldClipper) {
      return true;
    }
  }
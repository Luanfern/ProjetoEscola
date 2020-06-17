import 'package:flutter/material.dart';
import 'dadosesportes.dart';

class Barsidescreen extends StatefulWidget {
  @override
  _BarsidescreenState createState() => _BarsidescreenState();
}

class _BarsidescreenState extends State<Barsidescreen>
    with SingleTickerProviderStateMixin {
  double abledesablesidebar = 35;
  AnimationController animation;
  double notinicial = 0.0;

  @override
  void initState() {
    animation =
        AnimationController(duration: Duration(milliseconds: 600), vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    animation.dispose();
  }

  setarnomeindex(index) {
    setState(() {
      esporteenviar = esportes[index].nomeesporte;
      localenviar = index;
      notinicial = MediaQuery.of(context).size.width;
    });
  }

  String esporteenviar;
  int localenviar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Stack(children: <Widget>[
            Container(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.45,
                color: Color.fromRGBO(139, 35, 50, 1.0),
              ),
            ),
            Container(
              child: Align(
                alignment: Alignment(0, 1),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.55,
                  width: MediaQuery.of(context).size.width,
                  margin: new EdgeInsets.all(2.0),
                  decoration: new BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.5),
                        blurRadius:
                            10.0, // has the effect of softening the shadow
                        spreadRadius:
                            2.0, // has the effect of extending the shadow
                        offset: Offset(
                          0.0, // horizontal, move right 10
                          -1.0, // vertical, move down 10
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              child: Align(
                alignment: Alignment(0, 1),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.55,
                  width: MediaQuery.of(context).size.width,
                  color: Color.fromRGBO(13, 34, 64, 1.0),
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    child: ListView.builder(
                      itemCount: localenviar == null
                          ? 0
                          : esportes[localenviar].modo.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.only(top: 10, bottom: 5),
                          child: Align(
                            alignment:
                                Alignment(index % 2 == 0 ? 1.0 : -1.0, 0.5),
                            child: RaisedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Areajogo(
                                      esporte:
                                          esportes[localenviar].modo[index],
                                    ),
                                  ),
                                );
                              },
                              hoverElevation: 10.0,
                              child: Container(
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Image.asset(esportes[localenviar]
                                          .imagemmodo[index]),
                                      Text(
                                        esportes[localenviar].modo[index],
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                width: MediaQuery.of(context).size.width * 0.60,
                                height: 60,
                                padding: EdgeInsets.only(
                                  left: 20,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            Container(
              child: Material(
                elevation: 15.0,
                child: Container(
                  height: 65,
                  color: Color.fromRGBO(255, 198, 39, 1.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      esporteenviar == null ? '' : esporteenviar.toUpperCase(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment(0, -0.05),
              child: Container(
                child: Material(
                  elevation: 15.0,
                  child: Container(
                    height: 50,
                    color: Color.fromRGBO(255, 198, 39, 1.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'MODO'.toUpperCase(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            //Barsidescreen(),
          ]),
          AnimatedContainer(
            margin: EdgeInsets.only(left: notinicial),
            duration: Duration(milliseconds: 280),
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'imgs/1.gif',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 280),
            width: abledesablesidebar,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    color: Color.fromRGBO(13, 34, 64, 1.0),
                    child: topicossidebar(),
                  ),
                ),
                Align(
                  alignment: Alignment(0, -0.7),
                  child: ClipPath(
                    clipper: Clipperbuttomsidebar(),
                    child: Container(
                      width: 35,
                      height: 100,
                      color: Color.fromRGBO(13, 34, 64, 1.0),
                      child: FlatButton(
                        padding: EdgeInsets.only(right: 15),
                        onPressed: () => {
                          abledesablesidebarfunction(context),
                        },
                        child: AnimatedIcon(
                          icon: AnimatedIcons.menu_close,
                          progress: animation,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  abledesablesidebarfunction(cxt) {
    setState(() {
      if (abledesablesidebar == 35) {
        abledesablesidebar = MediaQuery.of(cxt).size.width - 20;
        if (esporteenviar == null) {
          notinicial = MediaQuery.of(context).size.width - 55;
        } else {
          if (abledesablesidebar == 35) {
            setState(() {
              notinicial = MediaQuery.of(context).size.width;
            });
          } else {
            setState(() {
              notinicial = MediaQuery.of(context).size.width - 55;
            });
          }
        }

        animation.forward();
      } else {
        abledesablesidebar = 35;
        if (esporteenviar == null) {
          notinicial = 0.0;
        } else {
          setState(() {
            notinicial = MediaQuery.of(context).size.width;
          });
        }
        animation.reverse();
      }
    });
  }

  topicossidebar() {
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 90),
          child: ListView.builder(
            itemCount: esportes.length,
            itemBuilder: (BuildContext context, int index) {
              return FlatButton(
                padding: EdgeInsets.all(0),
                child:
                    esportesidebar(esportes[index].nomeesporte, index, context),
                onPressed: () {
                  abledesablesidebarfunction(context);
                  setarnomeindex(
                    index,
                  );
                },
              );
            },
          ),
        ),
        ClipPath(
          clipper: Clippertopsidebar(),
          child: Container(
            height: 120,
            color: Color.fromRGBO(139, 35, 50, 1.0),
            child: Center(
              child: Text(
                'Modalidades'.toUpperCase(),
                style: TextStyle(
                  //fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontFamily: 'Anton',
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  esportesidebar(esporte, index, cxt) {
    return Container(
      margin: EdgeInsets.only(top: 0, bottom: 0),
      child: Stack(
        children: <Widget>[
          Align(
            //alignment: Alignment(),
            alignment: Alignment(index % 2 == 0 ? 1 : -1, 0),
            child: Container(
              margin: EdgeInsets.only(top: 10),
              child: Container(
                height: 80,
                width: MediaQuery.of(cxt).size.width * 0.60,
                color: Color.fromRGBO(255, 198, 39, 1.0),
                child: Center(
                  child: Text(
                    esporte.toUpperCase(),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(index % 2 == 0 ? 1 : -1, 0),
            child: Container(
              margin: EdgeInsets.only(
                left: index % 2 != 0 ? MediaQuery.of(cxt).size.width * 0.50 : 0,
                right:
                    index % 2 == 0 ? MediaQuery.of(cxt).size.width * 0.50 : 0,
              ),
              width: 100.0,
              height: 100.0,
              decoration: new BoxDecoration(
                color: Color.fromRGBO(13, 34, 64, 1.0),
                image: DecorationImage(
                  image: AssetImage(esportes[index].imagemesporte),
                  fit: BoxFit.cover,
                ),
                shape: BoxShape.circle,
                border: Border.all(
                  color: Color.fromRGBO(255, 198, 39, 1.0),
                  width: 3,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Clipperbuttomsidebar extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(
        size.width - 1, size.height / 2 - 20, size.width, size.height / 2);
    path.quadraticBezierTo(
        size.width + 1, size.height / 2 + 20, 10, size.height - 16);
    path.quadraticBezierTo(0, size.height - 8, 0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class Clippertopsidebar extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height - 43);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 43);
    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class Areajogo extends StatefulWidget {
  final String esporte;

  const Areajogo({
    Key key,
    this.esporte,
  }) : super(key: key);

  @override
  _AreajogoState createState() => _AreajogoState();
}

double conf;

class _AreajogoState extends State<Areajogo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: Color.fromRGBO(139, 35, 50, 1.0),
          ),
          Container(
            margin: EdgeInsets.only(top: 70),
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(''),
          ),
          Container(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Color.fromRGBO(255, 198, 39, 1.0),
                width: MediaQuery.of(context).size.width,
                height: 285,
              ),
            ),
          ),
          Container(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                color: Color.fromRGBO(13, 34, 64, 1.0),
                height: 300,
                width: MediaQuery.of(context).size.width * 0.30,
              ),
            ),
          ),
          Container(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                color: Color.fromRGBO(13, 34, 64, 1.0),
                height: 300,
                width: MediaQuery.of(context).size.width * 0.30,
              ),
            ),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 280),
            margin: EdgeInsets.only(
                left: conf == null ? MediaQuery.of(context).size.width : conf,
                top: 75),
            color: Colors.white,
            height: 220,
            width: MediaQuery.of(context).size.width * 0.65,
          ),
          Material(
            elevation: 10,
            child: Container(
              alignment: Alignment(0, -1),
              width: MediaQuery.of(context).size.width,
              color: Color.fromRGBO(255, 198, 39, 1.0),
              height: 70,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () => {
                        Navigator.of(context).pop(),
                      },
                    ),
                    Text(
                      widget.esporte.toUpperCase(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.settings),
                      onPressed: () => {
                        if (conf == MediaQuery.of(context).size.width * 0.34)
                          {
                            setState(() {
                              conf = MediaQuery.of(context).size.width;
                            }),
                          }
                        else
                          {
                            setState(() {
                              conf = MediaQuery.of(context).size.width * 0.34;
                            }),
                          }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

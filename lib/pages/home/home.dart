import 'dart:io';
import 'package:path/path.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:path_provider/path_provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:app_teste/pages/services/prefs_service.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

final PrefService _prefService = PrefService();

class HomeState extends State<Home> {
  Future<void> _launchLink(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: false, forceSafariVC: false);
    } else {
      print('Não foi possível executar o link');
    }
  }

  @override
  Widget build(BuildContext context) {
    CarouselController carouselController = new CarouselController();
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Image.asset(
            'assets/msangue.png',
            width: 140,
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Color.fromARGB(0, 255, 255, 255),
          iconTheme: IconThemeData(
            color: Color(0xFF900000),
          ),
        ),
        drawer: Drawer(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/backgroud.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 40.0,
                  ),
                  ListTile(
                    title: Image.asset(
                      'assets/msangue.png',
                      height: 80,
                      alignment: Alignment.topLeft,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(
                      height: 7,
                      thickness: 1,
                      color: Color.fromARGB(52, 0, 0, 0)),
                  SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    leading:
                        Icon(Icons.home, size: 32.0, color: Color(0xFF900000)),
                    title: Text(
                      'Tela Inicial',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Color(0xFF900000),
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).pushReplacementNamed('/home');
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.location_on,
                      size: 32.0,
                      color: Color(0xFF900000),
                    ),
                    title: Text(
                      'Locais de Doação',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Color(0xFF900000),
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).pushReplacementNamed('/locais');
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.playlist_add_check,
                      size: 32.0,
                      color: Color(0xFF900000),
                    ),
                    title: Text(
                      'Meus Agendamentos',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Color(0xFF900000),
                      ),
                    ),
                    onTap: () {},
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.person_add,
                      size: 32.0,
                      color: Color(0xFF900000),
                    ),
                    title: Text(
                      'Convide seus amigos',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Color(0xFF900000),
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).pushReplacementNamed('/invite');
                    },
                  ),
                  SizedBox(
                    height: 200,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.logout,
                      size: 32.0,
                      color: Color(0xFF900000),
                    ),
                    title: Text(
                      'Sair',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Color(0xFF900000),
                      ),
                    ),
                    onTap: () async {
                      await _prefService.removeCache("_cpfEC").whenComplete(() {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            '/primary', (Route<dynamic> route) => false);
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    //enlargeCenterPage: true,
                    //scrollDirection: Axis.vertical,
                  ),
                  items: [
                    'assets/image/junho_verme.jpg',
                    'assets/image/menina_deitada.png',
                    'assets/image/doe_vida.jpg',
                    'assets/image/doe_regularmente.png',
                  ]
                      .map(
                        (item) => Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            margin: EdgeInsets.only(
                              top: 8.0,
                              bottom: 7.0,
                            ),
                            elevation: 6.0,
                            shadowColor: Color.fromARGB(255, 111, 43, 43),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                              child: Stack(
                                children: <Widget>[
                                  Image.asset(item,
                                      fit: BoxFit.fill, width: double.infinity),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
                SizedBox(
                  height: 40,
                  width: 400,
                  child: Text(
                    'Opções do usúario:',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                      fontFamily: "Roboto",
                    ),
                  ),
                ),
                SizedBox(
                  height: 130,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.only(right: 60),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushReplacementNamed('/formtriagem');
                              },
                              child: Icon(
                                Icons.assignment_outlined,
                                color: Colors.white,
                                size: 35.0,
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(25.0),
                                primary: Color(0xFF900000),
                                onPrimary: Colors.red,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(right: 60),
                            child: Text("   Fazer \r\nTriagem"),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushReplacementNamed('/invite');
                              },
                              child: Icon(
                                Icons.person_add_alt_1_outlined,
                                color: Colors.white,
                                size: 35.0,
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(25.0),
                                primary: Color(0xFF900000),
                                onPrimary: Colors.red,
                              ),
                            ),
                          ),
                          Text("    Convidar \r\n     Amigos!"),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 60),
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Icon(
                                Icons.handshake_outlined,
                                color: Colors.white,
                                size: 35.0,
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(25.0),
                                primary: Color(0xFF900000),
                                onPrimary: Colors.red,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 60),
                            child: Text("    Minhas \r\n   Doações"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                        child: Divider(
                      color: Colors.grey.withAlpha(90),
                      thickness: 2,
                    )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        "Curiosidades",
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                    Expanded(
                        child: Divider(
                      color: Colors.grey.withAlpha(90),
                      thickness: 2,
                    )),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                SizedBox(
                  width: 400,
                  child: Text(
                    'Você sabia que a doação de sangue também traz benefícios para o doador?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromARGB(214, 145, 0, 0),
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                      fontFamily: "Roboto",
                    ),
                  ),
                ),
                SizedBox(
                  child: Padding(
                    padding: EdgeInsets.only(left: 30, right: 30, top: 30),
                    child: Text(
                      "• Uma doação de sangue pode salvar até 4 vidas.\r\n\r\n• O doador tem direito a um dia de folga no trabalho.\r\n\r\n• Não há risco de contrair doenças na doação.\r\n\r\n• Seu organismo repõe rapidamente o sangue doado.\r\n\r\n• A doação de sangue não engorda ou emagrece.\r\n\r\n• Meia-entrada em cinemas, teatros e eventos culturais.\r\n\r\n• Check-up completo gratuito.\r\n\r\n• A doação não altera a densidade do seu sangue.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        fontFamily: "Roboto",
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                          child: Divider(
                        color: Colors.grey.withAlpha(90),
                        thickness: 2,
                      )),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          "Redes Sociais",
                          style: TextStyle(color: Colors.black54),
                        ),
                      ),
                      Expanded(
                          child: Divider(
                        color: Colors.grey.withAlpha(90),
                        thickness: 2,
                      )),
                    ],
                  ),
                ),
                SizedBox(
                  width: 60,
                ),
                SizedBox(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 60,
                      ),
                      Container(
                        padding: EdgeInsets.all(0),
                        alignment: Alignment.center,
                        child: IconButton(
                          icon: Icon(
                            FontAwesome.youtube,
                          ),
                          iconSize: 38,
                          color: Color(0xFF900000),
                          splashColor: Color.fromARGB(255, 255, 255, 255),
                          onPressed: () => _launchLink(
                              'https://www.youtube.com/watch?v=siH2D6jrG3I'),
                        ),
                      ),
                      SizedBox(
                        width: 60,
                      ),
                      Container(
                        padding: EdgeInsets.all(0),
                        alignment: Alignment.center,
                        child: IconButton(
                          icon: Icon(
                            FontAwesome.instagram,
                          ),
                          iconSize: 40,
                          color: Color(0xFF900000),
                          splashColor: Color.fromARGB(255, 255, 255, 255),
                          onPressed: () => _launchLink(
                              'https://www.instagram.com/msangue_pa/'),
                        ),
                      ),
                      SizedBox(
                        width: 60,
                      ),
                      Container(
                        padding: EdgeInsets.all(0),
                        alignment: Alignment.center,
                        child: IconButton(
                          icon: Icon(FontAwesome.globe),
                          iconSize: 40,
                          color: Color(0xFF900000),
                          splashColor: Color.fromARGB(255, 255, 255, 255),
                          onPressed: () => _launchLink(
                              'https://www.gov.br/saude/pt-br/composicao/saes/sangue'),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

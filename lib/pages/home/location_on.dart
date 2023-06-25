import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Location extends StatelessWidget {
  const Location({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushReplacementNamed('/home');
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title:
              Text("Hemonúcleos", style: TextStyle(color: Color(0xFF900000))),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Color(0xFF900000),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/home');
            },
          ),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: <Widget>[
                        Positioned(
                          top: 20,
                          left: 50,
                          child: SizedBox(
                            width: 80,
                            height: 80,
                            child: Image.asset("assets/coracao.png"),
                          ),
                        ),
                        Positioned(
                            top: 40,
                            left: 150,
                            child: const Text(
                              'Uma bolsa de sangue, pode ajudar \r\na salvar até quatro vidas!',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            )),
                      ]),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black45.withOpacity(0.7),
                        spreadRadius: 1,
                        blurRadius: 8,
                        offset: Offset(0, 3),
                      )
                    ]),
                height: 220,
                child: Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: <Widget>[
                        Positioned(
                          top: 30,
                          right: 270,
                          child: Icon(
                            Icons.location_city_outlined,
                            size: 80.0,
                            color: Color(0XFFDC143C),
                          ),
                        ),
                        Positioned(
                            top: 60,
                            right: 30,
                            child: const Text(
                              '   HEMOPA \r\nBanco de Sangue de Marabá-PA',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black38),
                            )),
                        Positioned(
                            top: 120,
                            right: 230,
                            child: const Text(
                              'Rod. Transamazônica \r\nQuadra 12, S/N\r\nAgrópole do INCRA',
                              style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black38),
                            )),
                        Positioned(
                          top: 170,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(200, 35),
                                maximumSize: const Size(200, 35),
                                shape: const StadiumBorder(),
                                primary: Color(0XFFDC143C),
                              ),
                              onPressed: () {},
                              child: const Text(
                                'Agendar',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 255, 255, 255)),
                              )),
                        ),
                      ]),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black45.withOpacity(0.7),
                        spreadRadius: 1,
                        blurRadius: 8,
                        offset: Offset(0, 3),
                      )
                    ]),
                height: 220,
                child: Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: <Widget>[
                        Positioned(
                          top: 30,
                          right: 270,
                          child: Icon(
                            Icons.location_city_outlined,
                            size: 80.0,
                            color: Color(0XFFDC143C),
                          ),
                        ),
                        Positioned(
                            top: 60,
                            right: 30,
                            child: const Text(
                              '   HEMOPA \r\nBanco de Sangue de Marabá-PA',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black38),
                            )),
                        Positioned(
                            top: 120,
                            right: 230,
                            child: const Text(
                              'Rod. Transamazônica \r\nQuadra 12, S/N\r\nAgrópole do INCRA',
                              style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black38),
                            )),
                        Positioned(
                          top: 170,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(200, 35),
                                maximumSize: const Size(200, 35),
                                shape: const StadiumBorder(),
                                primary: Color(0XFFDC143C),
                              ),
                              onPressed: () {},
                              child: const Text(
                                'Agendar',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 255, 255, 255)),
                              )),
                        ),
                      ]),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black45.withOpacity(0.7),
                        spreadRadius: 1,
                        blurRadius: 8,
                        offset: Offset(0, 3),
                      )
                    ]),
                height: 220,
                child: Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: <Widget>[
                        Positioned(
                          top: 30,
                          right: 270,
                          child: Icon(
                            Icons.location_city_outlined,
                            size: 80.0,
                            color: Color(0XFFDC143C),
                          ),
                        ),
                        Positioned(
                            top: 60,
                            right: 30,
                            child: const Text(
                              '   HEMOPA \r\nBanco de Sangue de Marabá-PA',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black38),
                            )),
                        Positioned(
                            top: 120,
                            right: 230,
                            child: const Text(
                              'Rod. Transamazônica \r\nQuadra 12, S/N\r\nAgrópole do INCRA',
                              style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black38),
                            )),
                        Positioned(
                          top: 170,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(200, 35),
                                maximumSize: const Size(200, 35),
                                shape: const StadiumBorder(),
                                primary: Color(0XFFDC143C),
                              ),
                              onPressed: () {},
                              child: const Text(
                                'Agendar',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 255, 255, 255)),
                              )),
                        ),
                      ]),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black45.withOpacity(0.7),
                        spreadRadius: 1,
                        blurRadius: 8,
                        offset: Offset(0, 3),
                      )
                    ]),
                height: 220,
                child: Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: <Widget>[
                        Positioned(
                          top: 30,
                          right: 270,
                          child: Icon(
                            Icons.location_city_outlined,
                            size: 80.0,
                            color: Color(0XFFDC143C),
                          ),
                        ),
                        Positioned(
                            top: 60,
                            right: 30,
                            child: const Text(
                              '   HEMOPA \r\nBanco de Sangue de Marabá-PA',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black38),
                            )),
                        Positioned(
                            top: 120,
                            right: 230,
                            child: const Text(
                              'Rod. Transamazônica \r\nQuadra 12, S/N\r\nAgrópole do INCRA',
                              style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black38),
                            )),
                        Positioned(
                          top: 170,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(200, 35),
                                maximumSize: const Size(200, 35),
                                shape: const StadiumBorder(),
                                primary: Color(0XFFDC143C),
                              ),
                              onPressed: () {},
                              child: const Text(
                                'Agendar',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 255, 255, 255)),
                              )),
                        ),
                      ]),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black45.withOpacity(0.7),
                        spreadRadius: 1,
                        blurRadius: 8,
                        offset: Offset(0, 3),
                      )
                    ]),
                height: 220,
                child: Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: <Widget>[
                        Positioned(
                          top: 30,
                          right: 270,
                          child: Icon(
                            Icons.location_city_outlined,
                            size: 80.0,
                            color: Color(0XFFDC143C),
                          ),
                        ),
                        Positioned(
                            top: 60,
                            right: 30,
                            child: const Text(
                              '   HEMOPA \r\nBanco de Sangue de Marabá-PA',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black38),
                            )),
                        Positioned(
                            top: 120,
                            right: 230,
                            child: const Text(
                              'Rod. Transamazônica \r\nQuadra 12, S/N\r\nAgrópole do INCRA',
                              style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black38),
                            )),
                        Positioned(
                          top: 170,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(200, 35),
                                maximumSize: const Size(200, 35),
                                shape: const StadiumBorder(),
                                primary: Color(0XFFDC143C),
                              ),
                              onPressed: () {},
                              child: const Text(
                                'Agendar',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 255, 255, 255)),
                              )),
                        ),
                      ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

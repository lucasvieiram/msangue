import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:validatorless/validatorless.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:app_teste/pages/forms/validator.dart';

class FormTriagem extends StatefulWidget {
  FormTriagem({Key? key}) : super(key: key);
  @override
  _FormTriagem createState() => _FormTriagem();
}

class _FormTriagem extends State<FormTriagem> {
  final _formKey = GlobalKey<FormState>();
  final PageController _pageController = PageController();

  TextEditingController _cpfEC = new TextEditingController();

  String get cpf => _cpfEC.text;

  @override
  void dispose() {
    _cpfEC.dispose();

    super.dispose();
  }

  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;
  bool isChecked5 = false;
  bool isChecked6 = false;
  bool isChecked7 = false;
  bool isChecked8 = false;
  bool isChecked9 = false;

  var items = [
    'Há 1 mês',
    'Há 2 mês',
    'Há 3 mês',
    'Há 4 mês',
    'Há 5 mês',
    'Há 6 mês',
    'Há 7 mês',
    'Há 8 mês',
    'Há 9 mês',
    'Há 10 mês',
    'Há 11 mês',
    'Há 12 mês',
  ];

  Future passMethod1() async {
    if (isChecked1 == true && _pageController.hasClients == true) {
      _pageController.animateToPage(2,
          duration: Duration(milliseconds: 400), curve: Curves.easeInOut);
    } else {
      Fluttertoast.showToast(
          msg: "Marcar box de declaração!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 14.0);
    }
  }

  Future passMethod2() async {
    if (isChecked2 == true && _pageController.hasClients == true) {
      _pageController.animateToPage(3,
          duration: Duration(milliseconds: 400), curve: Curves.easeInOut);
    } else {
      Fluttertoast.showToast(
          msg: "Marcar box de declaração!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 14.0);
    }
  }

  Future passMethod3() async {
    if (isChecked3 == true && _pageController.hasClients == true) {
      _pageController.animateToPage(4,
          duration: Duration(milliseconds: 400), curve: Curves.easeInOut);
    } else {
      Fluttertoast.showToast(
          msg: "Marcar box de declaração!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 14.0);
    }
  }

  Future passMethod4() async {
    var formValid = _formKey.currentState?.validate() ?? false;
    if (formValid) {
      if (isChecked4 == false &&
          isChecked5 == false &&
          isChecked6 == false &&
          isChecked7 == false &&
          isChecked8 == false &&
          isChecked9 == false &&
          _pageController.hasClients == true) {
        Fluttertoast.showToast(
            msg: "Sua pré-triagem foi enviado! Aguarde o resultado por e-mail.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 14.0);
        Navigator.of(context).pushReplacementNamed('/home');
        var response = await http.post(
            Uri.parse(
                "https://www.adsparauapebas.com/starlink/projeto/code_php/mail_aprov.php"),
            body: {
              "cpf": cpf,
            });
        var data = jsonDecode(response.body);
      } else {
        Navigator.of(context).pushReplacementNamed('/home');
        Fluttertoast.showToast(
            msg: "Sua pré-triagem foi enviada! Aguarde o resultado por e-mail.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 14.0);
        var response = await http.post(
            Uri.parse(
                "https://www.adsparauapebas.com/starlink/projeto/code_php/mail_reprov.php"),
            body: {
              "cpf": cpf,
            });
        var data = jsonDecode(response.body);
      }
    }
  }

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushReplacementNamed('/home');
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Image.asset('assets/cruzlogin.png', width: 30),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Color.fromARGB(0, 255, 255, 255),
        ),
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: <Widget>[
            Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      child: Padding(
                        padding: EdgeInsets.only(top: 0),
                        child: Image.asset(
                          "assets/doacao6.png",
                          width: 330,
                        ),
                      ),
                    ),
                    SizedBox(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0.0, 15.0, 280, 0.0),
                        child: Text(
                          "Olá!",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF900000),
                            fontSize: 40,
                            fontFamily: "Roboto",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      child: Padding(
                        padding: EdgeInsets.only(left: 30, right: 30, top: 15),
                        child: Text(
                          "Antes de começarmos temos que esclarecer alguns pontos.",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Color(0xFF900000),
                            fontWeight: FontWeight.w300,
                            fontSize: 22,
                            fontFamily: "Roboto",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      child: Padding(
                        padding: EdgeInsets.only(left: 30, right: 30, top: 30),
                        child: Text(
                          "Nas próximas etapas você irá responder algumas perguntas, portanto pedimos sua atenção as informações  que  serão repassadas durante o processo.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.w300,
                            fontSize: 22,
                            fontFamily: "Roboto",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      child: Padding(
                        padding: EdgeInsets.only(left: 0, right: 30, top: 30),
                        child: Text(
                          "Pedimos sua honestidade ao responder.",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Color(0xFF900000),
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            fontFamily: "Roboto",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      child: Padding(
                        padding: EdgeInsets.only(left: 30, right: 30, top: 30),
                        child: Text(
                          "Desde já a equipe +Sangue agradece :)",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.w300,
                            fontSize: 20.7,
                            fontFamily: "Roboto",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 110,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              width: 150,
                              child: SizedBox(
                                  width: 160,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pushReplacementNamed('/home');
                                      },
                                      child: Text(
                                        'VOLTAR',
                                        style: TextStyle(
                                          color: Color(0xFFFFFFFF),
                                          fontSize: 18,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          minimumSize: const Size(100, 45),
                                          maximumSize: const Size(100, 45),
                                          shape: const StadiumBorder(),
                                          primary: Color(0XFFDC143C))))),
                          SizedBox(
                            width: 50,
                          ),
                          SizedBox(
                              width: 160,
                              child: ElevatedButton(
                                  onPressed: () {
                                    _pageController.animateToPage(1,
                                        duration: Duration(milliseconds: 400),
                                        curve: Curves.easeInOut);
                                  },
                                  child: Text(
                                    'PRÓXIMO',
                                    style: TextStyle(
                                      color: Color(0xFFFFFFFF),
                                      fontSize: 18,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      minimumSize: const Size(100, 45),
                                      maximumSize: const Size(100, 45),
                                      shape: const StadiumBorder(),
                                      primary: Color(0XFFDC143C)))),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      child: Padding(
                        padding: EdgeInsets.only(top: 0),
                        child: Image.asset(
                          "assets/form_doacao.png",
                          width: 250,
                        ),
                      ),
                    ),
                    SizedBox(
                      child: Padding(
                        padding: EdgeInsets.only(left: 30, right: 30, top: 15),
                        child: Text(
                          "Requisitos necessários para a doação de sangue:",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontFamily: "Roboto",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      child: Padding(
                        padding: EdgeInsets.only(left: 30, right: 30, top: 30),
                        child: Text(
                          "°Estar em boas condições de saúde;\r\n\r\n°Ter até 50 anos e pesar no minímo 50Kg;\r\n\r\n°Estar descansado (ter dormido pelo menos 6 horas nas ultimas 24 horas);\r\n\r\n°Estar alimentado (evitar alimentação gordurosa nas 4 horas que antecedem a doação);\r\n\r\n°Homens - 60 dias (máximo de 04 doações nos últimos 12 meses);\r\n\r\n°Mulheres - 90 dias (máximo de 03 doações nos últimos 12 meses).",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.w300,
                            fontSize: 18,
                            fontFamily: "Roboto",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      child: Padding(
                        padding: EdgeInsets.only(left: 18, right: 0, top: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(
                              activeColor: Color(0XFFDC143C),
                              checkColor: Color(0xFFFFFFFF),
                              value: isChecked1,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked1 = value!;
                                });
                              },
                            ),
                            Text("Declaro que li e estou ciente."),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      child: Padding(
                        padding: EdgeInsets.only(left: 15, right: 15, top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                width: 150,
                                child: SizedBox(
                                    width: 160,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          if (_pageController.hasClients) {
                                            _pageController.animateToPage(0,
                                                duration:
                                                    Duration(milliseconds: 400),
                                                curve: Curves.easeInOut);
                                          }
                                        },
                                        child: Text(
                                          'VOLTAR',
                                          style: TextStyle(
                                            color: Color(0xFFFFFFFF),
                                            fontSize: 18,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            minimumSize: const Size(100, 45),
                                            maximumSize: const Size(100, 45),
                                            shape: const StadiumBorder(),
                                            primary: Color(0XFFDC143C))))),
                            SizedBox(
                              width: 50,
                            ),
                            SizedBox(
                                width: 160,
                                child: ElevatedButton(
                                    onPressed: () {
                                      passMethod1();
                                    },
                                    child: Text(
                                      'PRÓXIMO',
                                      style: TextStyle(
                                        color: Color(0xFFFFFFFF),
                                        fontSize: 18,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    style: ElevatedButton.styleFrom(
                                        minimumSize: const Size(100, 45),
                                        maximumSize: const Size(100, 45),
                                        shape: const StadiumBorder(),
                                        primary: Color(0XFFDC143C)))),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      child: Padding(
                        padding: EdgeInsets.only(top: 50),
                        child: Image.asset(
                          "assets/doacao3.png",
                          width: 250,
                        ),
                      ),
                    ),
                    SizedBox(
                      child: Padding(
                        padding: EdgeInsets.only(left: 30, right: 30, top: 25),
                        child: Text(
                          "Requisitos que impedem a doação de sangue:",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontFamily: "Roboto",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      child: Padding(
                        padding: EdgeInsets.only(left: 30, right: 30, top: 40),
                        child: Text(
                          "°Gravidez;\r\n\r\n°Amamentando (somente após os 24 meses da criança);\r\n\r\n°90 dias após parto normal e 180 dias após cesariana;\r\n\r\n°Mal de Parkison.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.w300,
                            fontSize: 18,
                            fontFamily: "Roboto",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      child: Padding(
                        padding: EdgeInsets.only(left: 18, right: 0, top: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(
                              activeColor: Color(0XFFDC143C),
                              checkColor: Color(0xFFFFFFFF),
                              value: isChecked2,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked2 = value!;
                                });
                              },
                            ),
                            Text("Declaro que li e estou ciente."),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 140,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              width: 150,
                              child: SizedBox(
                                  width: 160,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        if (_pageController.hasClients) {
                                          _pageController.animateToPage(1,
                                              duration:
                                                  Duration(milliseconds: 400),
                                              curve: Curves.easeInOut);
                                        }
                                      },
                                      child: Text(
                                        'VOLTAR',
                                        style: TextStyle(
                                          color: Color(0xFFFFFFFF),
                                          fontSize: 18,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          minimumSize: const Size(100, 45),
                                          maximumSize: const Size(100, 45),
                                          shape: const StadiumBorder(),
                                          primary: Color(0XFFDC143C))))),
                          SizedBox(
                            width: 50,
                          ),
                          SizedBox(
                              width: 160,
                              child: ElevatedButton(
                                  onPressed: () {
                                    passMethod2();
                                  },
                                  child: Text(
                                    'PRÓXIMO',
                                    style: TextStyle(
                                      color: Color(0xFFFFFFFF),
                                      fontSize: 18,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      minimumSize: const Size(100, 45),
                                      maximumSize: const Size(100, 45),
                                      shape: const StadiumBorder(),
                                      primary: Color(0XFFDC143C)))),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      child: Padding(
                        padding: EdgeInsets.only(top: 0),
                        child: Image.asset(
                          "assets/doacao4.png",
                          width: 200,
                        ),
                      ),
                    ),
                    SizedBox(
                      child: Padding(
                        padding: EdgeInsets.only(left: 30, right: 30, top: 15),
                        child: Text(
                          "Requisitos que impedem a doação de sangue:",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontFamily: "Roboto",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      child: Padding(
                        padding: EdgeInsets.only(left: 30, right: 30, top: 15),
                        child: Text(
                          "°Uso de drogas ilícitas não injetáveis (Apto somente com 30/60 dias de abstinência);\r\n\r\n°Malária: quem esteve em países com alta prevalência de malária deve aguardar 12 meses após o retorno para doar. (critério semelhante ao dos estados brasileiros com prevalência elevada de malária);\r\n\r\n°Febre Amarela: quem esteve em região onde há surto da doença deve aguardar 30 dias para doar, após o retorno; se tomou a vacina, deve aguardar 04 semanas; se contraiu a doença, deve aguardar 6 meses após recuperação completa (clínica e laboratorial).",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.w300,
                            fontSize: 18,
                            fontFamily: "Roboto",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      child: Padding(
                        padding: EdgeInsets.only(left: 18, right: 0, top: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(
                              activeColor: Color(0XFFDC143C),
                              checkColor: Color(0xFFFFFFFF),
                              value: isChecked3,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked3 = value!;
                                });
                              },
                            ),
                            Text("Declaro que li e estou ciente."),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 110,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              width: 150,
                              child: SizedBox(
                                  width: 160,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        if (_pageController.hasClients) {
                                          _pageController.animateToPage(2,
                                              duration:
                                                  Duration(milliseconds: 400),
                                              curve: Curves.easeInOut);
                                        }
                                      },
                                      child: Text(
                                        'VOLTAR',
                                        style: TextStyle(
                                          color: Color(0xFFFFFFFF),
                                          fontSize: 18,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          minimumSize: const Size(100, 45),
                                          maximumSize: const Size(100, 45),
                                          shape: const StadiumBorder(),
                                          primary: Color(0XFFDC143C))))),
                          SizedBox(
                            width: 50,
                          ),
                          SizedBox(
                              width: 160,
                              child: ElevatedButton(
                                  onPressed: () {
                                    passMethod3();
                                  },
                                  child: Text(
                                    'PRÓXIMO',
                                    style: TextStyle(
                                      color: Color(0xFFFFFFFF),
                                      fontSize: 18,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      minimumSize: const Size(100, 45),
                                      maximumSize: const Size(100, 45),
                                      shape: const StadiumBorder(),
                                      primary: Color(0XFFDC143C)))),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        child: Padding(
                          padding: EdgeInsets.only(top: 0),
                          child: Image.asset(
                            "assets/doacao5.png",
                            width: 200,
                          ),
                        ),
                      ),
                      SizedBox(
                        child: Padding(
                          padding: EdgeInsets.only(left: 0, right: 50, top: 15),
                          child: Text(
                            "Responda o questionário abaixo:",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              fontFamily: "Roboto",
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        child: Padding(
                          padding: EdgeInsets.only(left: 0, right: 70, top: 5),
                          child: Text(
                            "*Marque apenas as opções que você se adequa:",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.w300,
                              fontSize: 15,
                              fontFamily: "Roboto",
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        child: Padding(
                          padding: EdgeInsets.only(left: 18, right: 0, top: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Checkbox(
                                activeColor: Color(0XFFDC143C),
                                checkColor: Color(0xFFFFFFFF),
                                value: isChecked4,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isChecked4 = value!;
                                  });
                                },
                              ),
                              Text(
                                "Você faz o uso de drogas ilícitas \r\n injetáveis?",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontWeight: FontWeight.w300,
                                  fontSize: 17,
                                  fontFamily: "Roboto",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        child: Padding(
                          padding: EdgeInsets.only(left: 18, right: 0, top: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Checkbox(
                                activeColor: Color(0XFFDC143C),
                                checkColor: Color(0xFFFFFFFF),
                                value: isChecked5,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isChecked5 = value!;
                                  });
                                },
                              ),
                              Text(
                                "Você contraiu coronavírus nos últimos \r\nanos?",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontWeight: FontWeight.w300,
                                  fontSize: 17,
                                  fontFamily: "Roboto",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        child: Padding(
                          padding: EdgeInsets.only(left: 18, right: 0, top: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Checkbox(
                                activeColor: Color(0XFFDC143C),
                                checkColor: Color(0xFFFFFFFF),
                                value: isChecked6,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isChecked6 = value!;
                                  });
                                },
                              ),
                              Text(
                                "Você já contraiu hepatite?",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontWeight: FontWeight.w300,
                                  fontSize: 17,
                                  fontFamily: "Roboto",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        child: Padding(
                          padding: EdgeInsets.only(left: 18, right: 0, top: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Checkbox(
                                activeColor: Color(0XFFDC143C),
                                checkColor: Color(0xFFFFFFFF),
                                value: isChecked7,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isChecked7 = value!;
                                  });
                                },
                              ),
                              Text(
                                "Você contraiu Herpes Zoster(Herpes) \r\nnos últimos 6 meses?",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontWeight: FontWeight.w300,
                                  fontSize: 17,
                                  fontFamily: "Roboto",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        child: Padding(
                          padding: EdgeInsets.only(left: 18, right: 0, top: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Checkbox(
                                activeColor: Color(0XFFDC143C),
                                checkColor: Color(0xFFFFFFFF),
                                value: isChecked8,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isChecked8 = value!;
                                  });
                                },
                              ),
                              Text(
                                "Você fez tatuagem nos últimos 6/12 \r\nmeses?",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontWeight: FontWeight.w300,
                                  fontSize: 17,
                                  fontFamily: "Roboto",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        child: Padding(
                          padding: EdgeInsets.only(left: 18, right: 0, top: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Checkbox(
                                activeColor: Color(0XFFDC143C),
                                checkColor: Color(0xFFFFFFFF),
                                value: isChecked9,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isChecked9 = value!;
                                  });
                                },
                              ),
                              Text(
                                "Você fez qualquer procedimento \r\nendoscópico nos últimos 6 meses?",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontWeight: FontWeight.w300,
                                  fontSize: 17,
                                  fontFamily: "Roboto",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: 370,
                        child: TextFormField(
                          controller: _cpfEC,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            CpfInputFormatter()
                          ],
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromARGB(255, 226, 217, 217),
                            labelStyle: const TextStyle(
                                color: Color.fromARGB(255, 144, 0, 0)),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 3,
                                  color: Color.fromARGB(150, 255, 255, 255)),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 3,
                                  color: Color.fromARGB(159, 164, 53, 53)),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            border: const OutlineInputBorder(),
                            labelText: 'CPF',
                            hintText: 'Digite seu CPF',
                          ),
                          validator: Validatorless.required(
                              'Este campo é obrigatório!'),
                        ),
                      ),
                      SizedBox(
                        height: 110,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                width: 150,
                                child: SizedBox(
                                    width: 160,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          if (_pageController.hasClients) {
                                            _pageController.animateToPage(3,
                                                duration:
                                                    Duration(milliseconds: 400),
                                                curve: Curves.easeInOut);
                                          }
                                        },
                                        child: Text(
                                          'VOLTAR',
                                          style: TextStyle(
                                            color: Color(0xFFFFFFFF),
                                            fontSize: 18,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            minimumSize: const Size(100, 45),
                                            maximumSize: const Size(100, 45),
                                            shape: const StadiumBorder(),
                                            primary: Color(0XFFDC143C))))),
                            SizedBox(
                              width: 50,
                            ),
                            SizedBox(
                                width: 160,
                                child: ElevatedButton(
                                    onPressed: () {
                                      passMethod4();
                                    },
                                    child: Text(
                                      'CONCLUIR',
                                      style: TextStyle(
                                        color: Color(0xFFFFFFFF),
                                        fontSize: 18,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    style: ElevatedButton.styleFrom(
                                        minimumSize: const Size(100, 45),
                                        maximumSize: const Size(100, 45),
                                        shape: const StadiumBorder(),
                                        primary: Color(0XFFDC143C)))),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

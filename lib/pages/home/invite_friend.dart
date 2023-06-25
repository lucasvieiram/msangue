import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:validatorless/validatorless.dart';

class InviteFriend extends StatefulWidget {
  InviteFriend({Key? key}) : super(key: key);
  @override
  _InviteFriend createState() => _InviteFriend();
}

class _InviteFriend extends State<InviteFriend> {
  final _messageEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _nameEC = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _messageEC.dispose();
    _emailEC.dispose();
    _nameEC.dispose();
    super.dispose();
  }

  Future sendEmail({
    required String name,
    required String email,
    required String message,
  }) async {
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    const serviceId = 'service_maissangue';
    const templateId = 'template_czt94wp';
    const userId = 'PjyGo4t0J3xw-Ddsj';

    final response = await http.post(
      url,
      headers: {
        'origin': 'http://localhost',
        'Content-Type': 'application/json',
      },
      body: json.encode(
        {
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': userId,
          'template_params': {
            'user_name': _nameEC.text,
            'user_email': _emailEC.text,
            'to_email': 'other.email@gmail.com',
            'subject': '+Sangue - Convite',
            'user_message': _messageEC.text,
          }
        },
      ),
    );

    print(response.body);
  }

  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pushReplacementNamed('/home');
          return false;
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Convide seus amigos",
              style: TextStyle(
                color: Color(0xFF900000),
                fontSize: 20,
              ),
            ),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Color.fromARGB(0, 255, 255, 255),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              color: Color(0xFF900000),
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/home');
              },
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 40,
              right: 40,
            ),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      width: 200,
                      height: 220,
                      child: Image.asset("assets/coracao.png"),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    SizedBox(
                      width: 300,
                      height: 30,
                      child: Text(
                        "Convide um amigo!",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      width: 450,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 0, right: 0, top: 10, bottom: 15),
                        child: Text(
                          "Nesse espaço você pode convidar seus amigos, basta informar o nome, e-mail e ainda poderá enviar uma mensagem para ele. Somos todos +Sangue.",
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
                    TextFormField(
                      controller: _nameEC,
                      decoration: InputDecoration(
                        labelText: 'Nome',
                        hintText: 'Digite o nome do seu amigo :)',
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
                      ),
                      validator: Validatorless.multiple([
                        Validatorless.required('Este campo é obrigatório!')
                      ]),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      controller: _emailEC,
                      decoration: InputDecoration(
                        labelText: 'E-mail',
                        hintText: 'Digite o E-mail do seu amigo :)',
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
                      ),
                      validator: Validatorless.multiple([
                        Validatorless.required('Este campo é obrigatório!'),
                        Validatorless.email('E-mail Inválido!')
                      ]),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    TextFormField(
                      controller: _messageEC,
                      maxLines: null,
                      decoration: InputDecoration(
                        labelText: 'Mensagem',
                        hintText: 'Sua mensagem :)',
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
                      ),
                      validator: Validatorless.multiple([
                        Validatorless.required('Este campo é obrigatório!'),
                      ]),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(260, 50),
                        maximumSize: const Size(260, 50),
                        elevation: 20,
                        shadowColor: Colors.black,
                        shape: const StadiumBorder(),
                        primary: const Color.fromARGB(255, 144, 0, 0),
                      ),
                      child: Text(
                        "Enviar",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFFFFFF),
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      onPressed: () {
                        var formValid =
                            _formKey.currentState?.validate() ?? false;
                        if (formValid) {
                          Navigator.of(context).pushReplacementNamed('/home');
                          sendEmail(
                            name: _nameEC.text,
                            email: _emailEC.text,
                            message: _messageEC.text,
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

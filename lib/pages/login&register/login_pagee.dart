import 'dart:convert';
import 'package:app_teste/pages/home/home.dart';
import 'package:app_teste/pages/services/prefs_service.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:app_teste/pages/forms/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:validatorless/validatorless.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);
  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  final PrefService _prefService = PrefService();
  bool _isObscure = true;

  String get cpf => _cpfEC.text;
  String get senha => _passwordEC.text;

  TextEditingController _cpfEC = new TextEditingController();
  TextEditingController _passwordEC = new TextEditingController();

  Future login() async {
    if (_cpfEC.text == "" || _passwordEC.text == "") {
      Fluttertoast.showToast(
          msg: "Todos os campos devem ser preenchidos!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      var response = await http.post(
          Uri.parse(
              "https://www.adsparauapebas.com/starlink/projeto/code_php/LoginData.php"),
          // https://www.adsparauapebas.com/starlink/code_php/LoginData.php
          body: {
            "cpf": cpf,
            "senha": senha,
          });
      var data = jsonDecode(response.body);

      if (data["result"] == true) {
        _prefService.createCache(_cpfEC.text).whenComplete(() {
          if (_passwordEC.text.isNotEmpty && _cpfEC.text.isNotEmpty) {
            Navigator.of(context).pushNamed('/home');
          }
        });
      } else {
        Fluttertoast.showToast(
            msg: "CPF ou Senha incorretos!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        print("bad");
      }
    }
  }

  bool _obscureText = true;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  var color1 = Color.fromARGB(209, 41, 35, 35);

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushReplacementNamed('/primary');
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              floating: true,
              backgroundColor: Color.fromARGB(241, 255, 255, 255),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back,
                    size: 38, color: Color.fromARGB(214, 145, 0, 0)),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/primary');
                },
              ),
              elevation: 0,
            )
          ],
          body: Padding(
            padding: const EdgeInsets.only(
              top: 2,
              left: 5,
              right: 5,
            ),
            child: SingleChildScrollView(
              child: Form(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, .0),
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icon.png',
                        width: 140,
                      ),
                      const Padding(padding: EdgeInsets.all(10)),
                      SizedBox(
                        child: Text(
                          '+Sangue',
                          style: TextStyle(
                              fontSize: 35.0,
                              color: Color.fromARGB(255, 144, 0, 0)),
                        ),
                      ),
                      const Padding(padding: EdgeInsets.all(10)),

//CPF

                      TextFormField(
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
                        validator:
                            Validatorless.required('Este campo é obrigatório!'),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
//SENHA
                      TextFormField(
                        obscureText: _isObscure,
                        controller: _passwordEC,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            color: Color.fromARGB(255, 144, 0, 0),
                            hoverColor: color1,
                            icon: Icon(
                              _isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            },
                          ),
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
                          labelText: 'Senha',
                          hintText: 'Digite sua Senha',
                          border: const OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 0.0,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(),
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed('/resetpass');
                        },
                        child: const Text(
                          'Esqueceu sua senha',
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Color.fromARGB(255, 144, 0, 0)),
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(210, 50),
                          maximumSize: const Size(210, 50),
                          elevation: 20,
                          shadowColor: Colors.black,
                          shape: const StadiumBorder(),
                          primary: const Color.fromARGB(255, 144, 0, 0),
                        ),
                        child: Text(
                          "Acessar",
                          style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        onPressed: () {
                          login();
                        },
                      ),
                      SizedBox(
                        height: 25.0,
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                "Não possui cadastro?",
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
                        height: 20.0,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(),
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed('/formfild');
                        },
                        child: const Text(
                          'Cadastre-se agora',
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Color.fromARGB(255, 144, 0, 0)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

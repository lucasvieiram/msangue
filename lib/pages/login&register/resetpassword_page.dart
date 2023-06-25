import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:validatorless/validatorless.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app_teste/pages/forms/validator.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class ResetPassword extends StatefulWidget {
  ResetPassword({Key? key}) : super(key: key);
  @override
  _ResetPassword createState() => _ResetPassword();
}

class _ResetPassword extends State<ResetPassword> {
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();
  final PageController _pageController = PageController();

  TextEditingController _cpfEC = new TextEditingController();
  TextEditingController _dataEC = new TextEditingController();
  TextEditingController _emailEC = new TextEditingController();
  TextEditingController _passwordEC = new TextEditingController();
  TextEditingController _otpController = new TextEditingController();
  TextEditingController _confirmPasswordEC = new TextEditingController();

  String get cpf => _cpfEC.text;
  String get email => _emailEC.text;
  String get otp => _otpController.text;
  String get nascimento => _dataEC.text;
  String get senha => _confirmPasswordEC.text;

  @override
  void dispose() {
    _otpController.dispose();
    _cpfEC.dispose();
    _dataEC.dispose();
    _emailEC.dispose();
    _passwordEC.dispose();
    _confirmPasswordEC.dispose();

    super.dispose();
  }

  Future insertMethod1() async {
    var formValid1 = _formKey1.currentState?.validate() ?? false;
    if (formValid1 && _pageController.hasClients == true) {
      _pageController.animateToPage(1,
          duration: Duration(milliseconds: 400), curve: Curves.easeInOut);
      var response = await http.post(
          Uri.parse(
              "https://www.adsparauapebas.com/starlink/projeto/code_php/otp_valid.php"),
          body: {
            "cpf": cpf,
          });
    }
  }

  Future insertMethod2() async {
    var formValid2 = _formKey2.currentState?.validate() ?? false;
    if (formValid2) {
      var response = await http.post(
          Uri.parse(
              "https://www.adsparauapebas.com/starlink/projeto/code_php/reset_valid.php"),
          body: {
            "otp": otp,
          });
      var data = jsonDecode(response.body);
      if (data["result"] == true && _pageController.hasClients == true) {
        _pageController.animateToPage(2,
            duration: Duration(milliseconds: 400), curve: Curves.easeInOut);
      } else {
        Fluttertoast.showToast(
            msg: "Código incorreto!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 14.0);
      }
    }
  }

  Future insertMethod3() async {
    var formValid3 = _formKey3.currentState?.validate() ?? false;
    if (formValid3) {
      var response = await http.post(
          Uri.parse(
              "https://www.adsparauapebas.com/starlink/projeto/code_php/reset_update.php"),
          body: {
            "cpf": cpf,
            "senha": senha,
          });
      var data = jsonDecode(response.body);
      Fluttertoast.showToast(
          msg: "Senha cadastrada com sucesso!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 14.0);
      Navigator.of(context).pushReplacementNamed('/login');
    } else {
      Fluttertoast.showToast(
          msg: "Falha ao atualizar senha :(",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 14.0);
    }
  }

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushReplacementNamed('/login');
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromARGB(0, 255, 255, 255),
          title: Text("Recuperar Senha",
              style: TextStyle(color: Color(0xFF900000))),
          centerTitle: true,
        ),
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: [
            Center(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey1,
                  child: Column(
                    children: [
                      SizedBox(
                        width: 200,
                        height: 250,
                        child: Image.asset("assets/logo_cadeado.png"),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: 300,
                        height: 40,
                        child: Text(
                          "Esqueceu sua senha?",
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        width: 300,
                        height: 70,
                        child: Text(
                          "Por favor, informe seu CPF associado a conta para a restauração de sua senha.",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      SizedBox(
                        height: 10,
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
                            hintText: 'Confirme seu CPF',
                          ),
                          validator: Validatorless.required(
                              'Este campo é obrigatório!'),
                        ),
                      ),
                      SizedBox(
                        height: 25,
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
                                              .pushReplacementNamed('/login');
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
                                            primary: Color(0xFF900000))))),
                            SizedBox(
                              width: 50,
                            ),
                            SizedBox(
                                width: 160,
                                child: ElevatedButton(
                                    onPressed: () {
                                      insertMethod1();
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
                                        primary: Color(0xFF900000)))),
                          ],
                        ),
                      ),
                      //
                      SizedBox(
                        height: 35,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey2,
                  child: Column(
                    children: [
                      SizedBox(
                        width: 200,
                        height: 250,
                        child: Image.asset("assets/logo_cadeado.png"),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: 300,
                        height: 70,
                        child: Text(
                          "Um código foi enviado para o E-mail cadastrado no seu CPF, por favor, informe abaixo:",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: 370,
                        child: TextFormField(
                          controller: _otpController,
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
                            labelText: 'Código',
                            hintText: 'Digite o código',
                            border: const OutlineInputBorder(),
                          ),
                          validator: Validatorless.multiple(
                            [
                              Validatorless.min(
                                  6, 'O código deverá ter ao menos 6 digitos'),
                              Validatorless.required(
                                  'Este campo é obrigatório!'),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      //
                      SizedBox(
                        height: 35,
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
                                            primary: Color(0xFF900000))))),
                            SizedBox(
                              width: 50,
                            ),
                            SizedBox(
                                width: 160,
                                child: ElevatedButton(
                                    onPressed: () {
                                      insertMethod2();
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
                                        primary: Color(0xFF900000)))),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey3,
                  child: Column(
                    children: [
                      SizedBox(
                        width: 200,
                        height: 250,
                        child: Image.asset("assets/logo_cadeado.png"),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        width: 300,
                        height: 70,
                        child: Text(
                          "Por favor, informe a nova senha que será utilizada.",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 10,
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
                        height: 35,
                      ),
                      SizedBox(
                        width: 370,
                        child: TextFormField(
                          controller: _passwordEC,
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
                            labelText: 'Senha',
                            hintText: 'Digite sua Senha',
                            border: const OutlineInputBorder(),
                          ),
                          validator: Validatorless.multiple([
                            Validatorless.min(
                                6, 'Senha deverá ter ao menos 6 digitos'),
                            Validatorless.required('Este campo é obrigatório!'),
                          ]),
                        ),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      SizedBox(
                        width: 370,
                        child: TextFormField(
                          controller: _confirmPasswordEC,
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
                            labelText: 'Cornfimar senha',
                            hintText: 'Confirme sua Senha',
                            border: const OutlineInputBorder(),
                          ),
                          validator: Validatorless.multiple([
                            Validatorless.min(6,
                                'Confirmar senha deverá ter ao menos 6 digitos'),
                            Validatorless.required('Este campo é obrigatório!'),
                            Validators.compare(_passwordEC, 'Senhas diferentes')
                          ]),
                        ),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(200, 50),
                          maximumSize: const Size(200, 50),
                          onSurface: Colors.black38,
                          elevation: 20,
                          shadowColor: Colors.black,
                          shape: const StadiumBorder(),
                          primary: Color(0xFF900000),
                        ),
                        onPressed: () {
                          insertMethod3();
                        },
                        child: Text(
                          'CONFIRMAR',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFFFFFFF),
                            fontSize: 20,
                          ),
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

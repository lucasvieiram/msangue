import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:validatorless/validatorless.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:app_teste/pages/forms/validator.dart';
import 'package:page_transition/page_transition.dart';
import 'package:app_teste/pages/login&register/login_pagee.dart';
import 'package:estados_municipios/estados_municipios.dart';
import 'package:search_cep/search_cep.dart';

class FormFild extends StatefulWidget {
  FormFild({Key? key}) : super(key: key);
  @override
  _FormFild createState() => _FormFild();
}

class _FormFild extends State<FormFild> {
  bool _isObscure1 = true;
  bool _isObscure2 = true;
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final PageController _pageController = PageController();

  final _cepController = TextEditingController(); // CEP
  final _cidadeContoller = TextEditingController(); // Cidade / Localidade
  final _ufController = TextEditingController(); //  Unidade federativa Estado.

  TextEditingController _cpfEC = new TextEditingController();
  TextEditingController _nameEC = new TextEditingController();
  TextEditingController _dataEC = new TextEditingController();
  TextEditingController _emailEC = new TextEditingController();
  TextEditingController _cidadeEC = new TextEditingController();
  TextEditingController _estadoEC = new TextEditingController();
  TextEditingController _passwordEC = new TextEditingController();
  TextEditingController _telefoneEC = new TextEditingController();
  TextEditingController _tiposangueEC = new TextEditingController();
  TextEditingController _confirmPasswordEC = new TextEditingController();

  String get cpf => _cpfEC.text;
  String get nome => _nameEC.text;
  String get email => _emailEC.text;
  String get estado => _estadoEC.text;
  String get cidade => _cidadeEC.text;
  String get nascimento => _dataEC.text;
  String get sangue => _tiposangueEC.text;
  String get telefone => _telefoneEC.text;
  String get senha => _confirmPasswordEC.text;

  bool get _showPassword => true;

  @override
  void dispose() {
    _cpfEC.dispose();
    _nameEC.dispose();
    _dataEC.dispose();
    _emailEC.dispose();
    _estadoEC.dispose();
    _cidadeEC.dispose();
    _telefoneEC.dispose();
    _passwordEC.dispose();
    _tiposangueEC.dispose();
    _pageController.dispose();
    _confirmPasswordEC.dispose();

    super.dispose();
  }

  var items = [
    'Não sei meu tipo sanguíneo',
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    '0-'
  ];

  Future insertMethod1() async {
    var formValid1 = _formKey1.currentState?.validate() ?? false;
    if (formValid1 == true && _pageController.hasClients == true) {
      _pageController.animateToPage(1,
          duration: Duration(milliseconds: 400), curve: Curves.easeInOut);
    }
  }

  Future insertMethod2() async {
    var formValid2 = _formKey2.currentState?.validate() ?? false;
    if (formValid2) {
      var response = await http.post(
          Uri.parse(
              "https://www.adsparauapebas.com/starlink/projeto/code_php/InsertData.php"),
          body: {
            "cpf": cpf,
            "nome": nome,
            "email": email,
            "senha": senha,
            "estado": estado,
            "cidade": cidade,
            "telefone": telefone,
            "nascimento": nascimento,
            "sangue": sangue,
          });
      var data = jsonDecode(response.body);
      Navigator.of(context).pushReplacementNamed('/login');
    } else {
      Fluttertoast.showToast(
          msg: "Todos os campos devem ser preenchidos!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  void main() async {
    final controller = EstadosMunicipiosController();
    final estados = await controller.buscaTodosEstados();
    print(estados);

    void main() async {
      final controller = EstadosMunicipiosController();
      final municipios = await controller.buscaMunicipiosPorEstado('CE1');
      print(municipios);
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
              title: Image.asset('assets/logo_pequena.png', width: 98),
              centerTitle: true,
              backgroundColor: Color.fromARGB(241, 255, 255, 255),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back,
                    size: 20, color: Color.fromARGB(214, 145, 0, 0)),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/primary');
                },
              ),
              elevation: 0,
            )
          ],
          body: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: _pageController,
            children: <Widget>[
              Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey1,
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/form4.png",
                          width: 240,
                        ),
                        SizedBox(
                          child: const Text(
                            'Preencha o formulário',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Color.fromARGB(255, 144, 0, 0)),
                          ),
                        ),

                        //ESPAÇAMENTOS

                        SizedBox(
                          height: 10,
                        ),

                        //NOME
                        SizedBox(
                          width: 370,
                          child: TextFormField(
                            controller: _nameEC,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(255, 226, 217, 217),
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
                              labelText: 'Nome',
                              hintText: 'Digite seu nome',
                              border: const OutlineInputBorder(),
                            ),
                            validator: Validatorless.required(
                                'Este campo é obrigatório!'),
                          ),
                        ),

                        //ESPAÇAMENTO

                        const SizedBox(
                          height: 40,
                        ),

                        //E-MAIL

                        SizedBox(
                          width: 370,
                          child: TextFormField(
                            controller: _emailEC,
                            decoration: InputDecoration(
                              labelText: 'E-mail',
                              hintText: 'Digite seu E-mail',
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(255, 226, 217, 217),
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
                            ),
                            validator: Validatorless.multiple([
                              Validatorless.required(
                                  'Este campo é obrigatório!'),
                              Validatorless.email('E-mail Inválido!')
                            ]),
                          ),
                        ),

                        //ESPAÇAMENTO

                        const SizedBox(
                          height: 40,
                        ),

                        //CPF

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
                              fillColor:
                                  const Color.fromARGB(255, 226, 217, 217),
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

                        //ESPAÇAMENTO

                        const SizedBox(
                          height: 40,
                        ),

                        //SENHA

                        SizedBox(
                          width: 370,
                          child: TextFormField(
                            obscureText: _isObscure1,
                            keyboardType: TextInputType.number,
                            controller: _passwordEC,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                color: Color.fromARGB(255, 144, 0, 0),
                                hoverColor: color1,
                                icon: Icon(
                                  _isObscure1
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isObscure1 = !_isObscure1;
                                  });
                                },
                              ),
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(255, 226, 217, 217),
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
                              Validatorless.required(
                                  'Este campo é obrigatório!'),
                            ]),
                          ),
                        ),

                        //ESPAÇAMENTO

                        const SizedBox(
                          height: 40,
                        ),

                        //CONFIRMAR SENHA

                        SizedBox(
                          width: 370,
                          child: TextFormField(
                            obscureText: _isObscure2,
                            keyboardType: TextInputType.number,
                            controller: _confirmPasswordEC,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                color: Color.fromARGB(255, 144, 0, 0),
                                icon: Icon(
                                  _isObscure2
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isObscure2 = !_isObscure2;
                                  });
                                },
                              ),
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(255, 226, 217, 217),
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
                              Validatorless.required(
                                  'Este campo é obrigatório!'),
                              Validators.compare(
                                  _passwordEC, 'Senhas diferentes')
                            ]),
                          ),
                        ),

                        //ESPAÇAMENTO

                        const SizedBox(
                          height: 50,
                        ),

                        //BOTAO PROSSEGUIR

                        SizedBox(
                          width: 330,
                          height: 50,
                          child: ElevatedButton.icon(
                              onPressed: () {
                                insertMethod1();
                              },
                              icon: Icon(Icons.next_plan_sharp),
                              label: Text(
                                'PROSSEGUIR',
                                style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  fontSize: 17,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(100, 50),
                                  maximumSize: const Size(100, 50),
                                  onSurface: Colors.black38,
                                  elevation: 1,
                                  shadowColor: Color.fromARGB(255, 180, 37, 37),
                                  shape: const StadiumBorder(),
                                  primary:
                                      const Color.fromARGB(255, 144, 0, 0))),
                        ),
                        const SizedBox(
                          height: 50,
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
                                  "Já possui cadastro?",
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
                        Padding(
                            padding: const EdgeInsets.only(
                              left: 0,
                              right: 0,
                              top: 0,
                            ),
                            child: SizedBox(
                              height: 14,
                            )),
                        Padding(
                          padding: EdgeInsets.only(top: 0, bottom: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "",
                                style: TextStyle(color: Colors.black54),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Login()));
                                },
                                child: Text(
                                  "Entre agora",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 144, 0, 0),
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Center(
                child: SingleChildScrollView(
                    child: Form(
                  key: _formKey2,
                  child: Column(children: [
                    Image.asset(
                      "assets/pessoa_computador.png",
                      width: 240,
                    ),
                    SizedBox(
                      child: const Text(
                        'Estamos quase lá',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Color.fromARGB(255, 144, 0, 0)),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),

                    //formulário

                    SizedBox(
                      width: 370,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: _telefoneEC,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          TelefoneInputFormatter()
                        ],
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
                          labelText: 'Telefone',
                          hintText: 'Digite seu telefone',
                          border: const OutlineInputBorder(),
                        ),
                        validator:
                            Validatorless.required('Este campo é Obrigatorio!'),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),

                    SizedBox(
                      width: 370,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: _dataEC,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          DataInputFormatter()
                        ],
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
                          labelText: 'Data de nascimento',
                          hintText: 'Digite sua data de nascimento',
                          border: const OutlineInputBorder(),
                        ),
                        validator:
                            Validatorless.required('Este campo é Obrigatorio!'),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),

                    SizedBox(
                      width: 370,
                      child: TextFormField(
                        // adc controller <<----------------------------------------------

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
                          labelText: 'Estado',
                          hintText: 'Digite o nome do seu estado',
                          border: const OutlineInputBorder(),
                        ),
                        validator:
                            Validatorless.required('Este campo é Obrigatorio!'),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),

                    SizedBox(
                      width: 370,
                      child: TextFormField(
                        // adc controller <<----------------------------------------------

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
                          labelText: 'Cidade',
                          hintText: 'Digite o nome da sua cidade',
                          border: const OutlineInputBorder(),
                        ),
                        validator:
                            Validatorless.required('Este campo é Obrigatorio!'),
                      ),
                    ),

                    SizedBox(
                      height: 40,
                    ),

                    SizedBox(
                      width: 370,
                      child: TextFormField(
                        controller: _tiposangueEC,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromARGB(255, 226, 217, 217),
                          labelStyle: const TextStyle(color: Color(0xFF900000)),
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
                          labelText: 'Tipo sanguíneo',
                          hintText: 'Clique no ícone ao lado para escolher',
                          border: const OutlineInputBorder(),
                          suffixIcon: PopupMenuButton<String>(
                            icon: const Icon(
                              Icons.bloodtype,
                              color: Color(0xFF900000),
                            ),
                            onSelected: (String value) {
                              _tiposangueEC.text = value;
                            },
                            itemBuilder: (BuildContext context) {
                              return items
                                  .map<PopupMenuItem<String>>((String value) {
                                return new PopupMenuItem(
                                    child: new Text(value), value: value);
                              }).toList();
                            },
                          ),
                        ),
                        validator:
                            Validatorless.required('Este campo é Obrigatorio!'),
                      ),
                    ),

                    SizedBox(
                      height: 30,
                    ),

                    SizedBox(
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              width: 170,
                              child: ElevatedButton.icon(
                                  onPressed: () {
                                    if (_pageController.hasClients) {
                                      _pageController.animateToPage(0,
                                          duration: Duration(milliseconds: 400),
                                          curve: Curves.easeInOut);
                                    }
                                  },
                                  icon: Icon(Icons.next_plan_sharp),
                                  label: Text(
                                    'VOLTAR',
                                    style: TextStyle(
                                      color: Color(0xFFFFFFFF),
                                      fontSize: 17,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      minimumSize: const Size(100, 50),
                                      maximumSize: const Size(100, 50),
                                      onSurface: Colors.black38,
                                      elevation: 10,
                                      shadowColor:
                                          Color.fromARGB(255, 180, 37, 37),
                                      shape: const StadiumBorder(),
                                      primary: const Color.fromARGB(
                                          255, 144, 0, 0)))),
                          SizedBox(
                            width: 40,
                          ),
                          SizedBox(
                              width: 170,
                              child: ElevatedButton(
                                  onPressed: () {
                                    insertMethod2();
                                  },
                                  child: Text(
                                    'CONCLUIR',
                                    style: TextStyle(
                                      color: Color(0xFFFFFFFF),
                                      fontSize: 17,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      minimumSize: const Size(100, 50),
                                      maximumSize: const Size(100, 50),
                                      onSurface: Colors.black38,
                                      elevation: 10,
                                      shadowColor:
                                          Color.fromARGB(255, 180, 37, 37),
                                      shape: const StadiumBorder(),
                                      primary: const Color.fromARGB(
                                          255, 144, 0, 0)))),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                  ]),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

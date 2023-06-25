import 'dart:async';

import 'package:app_teste/pages/services/prefs_service.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final PrefService _prefService = PrefService();

  @override
  void initState() {
    _prefService.readCache("cpf").then((value) {
      print(value.toString());
      if (value != null) {
        return Timer(Duration(seconds: 5),
            () => Navigator.of(context).pushNamed('/home'));
      } else {
        return Timer(Duration(seconds: 5),
            () => Navigator.of(context).pushNamed('/primary'));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      width: 309,
                      height: 170,
                      child: TextLiquidFill(
                        boxHeight: 91.0,
                        textStyle: const TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 55,
                            fontWeight: FontWeight.bold),
                        boxBackgroundColor: Color.fromARGB(255, 255, 255, 255),
                        text: '+Sangue',
                        waveColor: Color.fromARGB(255, 158, 32, 32),
                      )),
                ]),
          ),
        ),
      ),
    );
  }
}

// @dart=2..0
import 'package:app_teste/pages/forms/form.dart';
import 'package:app_teste/pages/forms/form_triagem.dart';
import 'package:app_teste/pages/home/home.dart';
import 'package:app_teste/pages/home/invite_friend.dart';
import 'package:app_teste/pages/home/location_on.dart';
import 'package:app_teste/pages/login&register/login_pagee.dart';
import 'package:app_teste/pages/login&register/primary_page.dart';
import 'package:app_teste/pages/login&register/resetpassword_page.dart';
import 'package:app_teste/pages/login&register/splash_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '+Sangue Demo',
      initialRoute: '/splash',
      routes: {
        '/login': (_) => Login(),
        '/formfild': (_) => FormFild(),
        '/splash': (_) => const SplashPage(),
        '/primary': (_) => const PrimaryPage(),
        '/home': (_) => Home(),
        '/invite': (_) => InviteFriend(),
        '/resetpass': (_) => ResetPassword(),
        '/locais': (_) => const Location(),
        '/formtriagem': (_) => FormTriagem(),
      },
    );
  }
}

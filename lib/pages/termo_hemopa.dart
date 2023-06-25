import 'dart:ui';

import 'package:flutter/material.dart';

class TermoHemopa extends StatelessWidget {
  const TermoHemopa({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(10),
      child: Center(
      child: Text.rich(
        TextSpan(
          text: ' ', style: TextStyle(
          fontSize: 16, color: Color.fromARGB(255, 170, 7, 7)
        )
        ),
      ),
      )
    );
    //pagina termo
  }
}
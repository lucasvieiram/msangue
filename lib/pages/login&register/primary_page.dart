import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class PrimaryPage extends StatelessWidget {
  const PrimaryPage({Key? key}) : super(key: key);

  Future<void> _launchLink(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: false, forceSafariVC: false);
    } else {
      print('Não foi possível executar o link');
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          SystemNavigator.pop();
          return false;
        },
        child: Scaffold(
            body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 35,
                      ),
                      const Text(
                        "Seja bem-vindo(a)",
                        style: TextStyle(
                          color: Color(0xFF900000),
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          fontFamily: "Roboto",
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    child: Image.asset(
                      "assets/logo_grande.png",
                      width: 150,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed('/login');
                        },
                        child: Text("Já tenho uma conta"),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.minPositive, 45),
                          primary: Color.fromARGB(255, 144, 0, 0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          textStyle: TextStyle(
                            fontSize: 16,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600,
                          ),
                          elevation: 0,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed('/formfild');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 8,
                            ),
                            Text("Cadastrar uma conta"),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.minPositive, 45),
                          primary: Color.fromARGB(255, 144, 0, 0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          side: BorderSide(
                              width: 1, color: Color.fromARGB(255, 144, 0, 0)),
                          textStyle: TextStyle(
                            fontSize: 16,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600,
                          ),
                          elevation: 0,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Ao clicar você concorda com os ",
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: "Poppins",
                            ),
                          ),
                          TextButton(
                            onPressed: () => _launchLink(
                                'https://www.adsparauapebas.com/starlink/projetos/StarlinkSite/starlink/TERMOS.htm'),
                            child: Text(
                              "Termos",
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            style: TextButton.styleFrom(
                              primary: Color.fromARGB(255, 255, 1, 1),
                              minimumSize: Size(0, 0),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )));
  }
}

import 'package:flutter/material.dart';
import '../components/text_field.dart';

void main() {
  runApp(const MaterialApp(
    home: UiHome(),
  ));
}

class UiHome extends StatefulWidget {
  const UiHome({Key? key}) : super(key: key);

  @override
  State<UiHome> createState() => _UiHomeState();
}

double dolar = 0.0;
double euroServer = 0.0;
double bitcoin = 0.0;

class _UiHomeState extends State<UiHome> {
  final realController = TextEditingController();
  final dolarController = TextEditingController();
  final euroController = TextEditingController();
  final bitcoinController = TextEditingController();

  void _clearAll() {
    realController.text = "";
    dolarController.text = "";
    euroController.text = "";
    bitcoinController.text = "";
  }

  void _realChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double real = double.parse(text);
    dolarController.text = (real / dolar).toStringAsFixed(2);
    euroController.text = (real / euroServer).toStringAsFixed(2);
    bitcoinController.text = (real / bitcoin).toStringAsFixed(5);
  }

  void _dolarChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }

    double dollar = double.parse(text);
    realController.text = (dolar * dollar).toStringAsFixed(2);
    euroController.text = (dolar * dollar / euroServer).toStringAsFixed(2);
    bitcoinController.text = (dolar * dollar / bitcoin).toStringAsFixed(5);
  }

  void _euroChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }

    double euro = double.parse(text);
    realController.text = (euro * euroServer).toStringAsFixed(2);
    dolarController.text = (euro * euroServer / dolar).toStringAsFixed(2);
    bitcoinController.text = (euro * euroServer / bitcoin).toStringAsFixed(5);
  }

  void _bitcoinChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double bitcoin = double.parse(text);
    realController.text = (bitcoin * bitcoin).toStringAsFixed(2);
    dolarController.text = ((bitcoin * bitcoin) / dolar).toStringAsFixed(2);
    euroController.text = ((bitcoin * bitcoin) / euroServer).toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: null,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 35.0, bottom: 20.0),
              child: Row(
                children: [
                  const Icon(Icons.monetization_on_outlined,
                      color: Colors.white, size: 100.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 1.0, right: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text.rich(
                          style: TextStyle(fontSize: 19.0),
                          textAlign: TextAlign.start,
                          TextSpan(
                              style: TextStyle(color: Colors.white),
                              children: [
                                TextSpan(text: "Conversor de"),
                                TextSpan(
                                    text: " moedas",
                                    style: TextStyle(
                                        color: Colors.cyan,
                                        fontWeight: FontWeight.bold)),
                              ]),
                        ),
                        Text(
                          "Toodoo - Desenvolvimento de Software",
                          style: TextStyle(color: Colors.white, fontSize: 12.0),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/logo_dinheiro.png")),
                  borderRadius:
                      BorderRadiusDirectional.all(Radius.circular(25.0)),
                  color: Colors.white54,
                ),
                alignment: Alignment.center,
                height: 450.0,
                width: 400.0,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      buildTextField("Real", realController, _realChanged),
                      const Divider(color: Colors.grey, thickness: 1),
                      buildTextField("Dolar", dolarController, _dolarChanged),
                      const Divider(color: Colors.grey, thickness: 1),
                      buildTextField("Euro", euroController, _euroChanged),
                      const Divider(color: Colors.grey, thickness: 1),
                      buildTextField(
                          "Bitcoin", bitcoinController, _bitcoinChanged),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

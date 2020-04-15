import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de IMC',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: Calculadora(),
    ); 
  }
}

class Calculadora extends StatefulWidget {
  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  final TextEditingController _valorMassa = TextEditingController();
  final TextEditingController _valorAltura = TextEditingController();

  var _texto = "";

  void _calculaIMC() {
    setState(() {
      double _massa = double.tryParse(_valorMassa.text);
      double _altura = double.tryParse(_valorAltura.text) / 100;
      double _imc = (_massa / (_altura * _altura));
      if (_imc < 17) {
        _texto = "Muito abaixo do peso";
      } else if (_imc < 18) {
        _texto = "Abaixo do peso";
      } else if (_imc < 24) {
        _texto = "Peso normal";
      } else if (_imc < 29) {
        _texto = "Acima do peso";
      } else if (_imc < 34) {
        _texto = "Obesidade I";
      } else if (_imc < 39) {
        _texto = "Obesidade II (severa)";
      } else {
        _texto = "Obesidade III (mórbida)";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        title: Center(
          child: Text('Calculadora de IMC', textAlign: TextAlign.center),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _valorMassa,
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.white, fontSize: 20),
                decoration: InputDecoration(
                  labelText: "Massa",
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ),
              Divider(),
              TextField(
                controller: _valorAltura,
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.white, fontSize: 20),
                decoration: InputDecoration(
                  labelText: "Altura",
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ),
              Divider(),
              ButtonTheme(
                height: 60.0,
                child: RaisedButton(
                  onPressed: _calculaIMC,
                  child: Text(
                    "Calcular",
                    style: TextStyle(color: Colors.deepPurple),
                  ),
                  color: Colors.white,
                ),
              ),
              Divider(),
              Text(
                '$_texto',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:firstapp/alert.dart';
import 'package:flutter/material.dart';

class Calculo extends StatelessWidget {

  GlobalKey<FormState> _key = new GlobalKey();
  bool validate = false;
  final campo1 = new TextEditingController();
  final campo2 = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cálculo Tela"),
      ),
      body: new SingleChildScrollView(
        child: new Container(
          margin: new EdgeInsets.all(15),
          child: new Form(
            key: _key,
            autovalidate: validate,
            child: buildScreen(context),            
          ),
        ),
      ),
    );
  }

  Widget buildScreen(BuildContext context){
    return new Column(
      children: <Widget>[
        new TextFormField(
          decoration: new InputDecoration(hintText: 'Campo 1'),
          maxLength: 10,
          keyboardType: TextInputType.number,
          validator: validateField,
          controller: campo1,
        ), 
        new TextFormField(
          decoration: new InputDecoration(hintText: 'Campo 2'),
          keyboardType: TextInputType.number,
          maxLength: 10,
          validator: validateField,
          controller: campo2,
        ), 
        new RaisedButton(
          onPressed: () {calcular(context); },
          child: Text('Calcular'),
        ),
        new RaisedButton(
          onPressed: () {Navigator.pop(context); },
          child: Text('Voltar'),
        ) 
      ],
    );
  }

  String validateField(String value){
    if (value.length == 0){
      return "Informe campo!";
    }
    return null;
  }

  void calcular(BuildContext context) {
    if (_key.currentState.validate()){
      double result = double.parse(campo1.text) * 
      double.parse(campo1.text);
      new Alert().showAlertDialog(context, "Resultado "+result.toString());
    }
  }

}

import 'package:flutter/material.dart';

class Tela extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Segunda Tela"),
      ),
      body: new SingleChildScrollView(
        child: new Container(
          margin: new EdgeInsets.all(15),
          child: new Form(
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
          decoration: new InputDecoration(hintText: 'Nome'),
          maxLength: 50,
        ), 
        new TextFormField(
          decoration: new InputDecoration(hintText: 'Email'),
          keyboardType: TextInputType.emailAddress,
          maxLength: 70,
        ), 
        new RaisedButton(
          onPressed: () {Navigator.pop(context); },
          child: Text('Voltar'),
        ) 
      ],
    );
  }


}

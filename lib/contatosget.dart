import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class ContatoGet extends StatefulWidget {

  @override
  _ContatoGetState createState() => new _ContatoGetState();
}

class _ContatoGetState extends State<ContatoGet> {
  String url = 'https://randomuser.me/api/?results=50';
  List data;

  @override
  void initState() {  
    super.initState();
    callContacts();
  }

  Future<String> callContacts() async {
    var response = await http.get(Uri.encodeFull(url), 
            headers: {"Accept": "application/json"});
    setState(() {
      var dados = json.decode(response.body);
      data = dados["results"];
      print(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Get Contatos'),
        ),
        body: new ListView.builder(
            itemCount: data == null ? 0 : data.length,
            itemBuilder: (BuildContext context, i) {
              return new ListTile(
                title: new Text(data[i]["name"]["first"]),
                subtitle: new Text(data[i]["phone"]),
                leading: new CircleAvatar(
                  backgroundImage:
                      new NetworkImage(data[i]["picture"]["thumbnail"]),
                )
              );
            }, 
          ),
        );
  }

}
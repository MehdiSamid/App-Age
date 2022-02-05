import 'package:app_age/details.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.deepPurple,
      primarySwatch: Colors.blue
    ),
    home:homepage() ,
  ));
}

class homepage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text("Age Calculator"),
        centerTitle: true,
      ),
      body:Details(),

    );
  }
}
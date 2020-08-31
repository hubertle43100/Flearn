import 'package:flutter/material.dart';

//The main function is the starting point for all of our Flutter apps
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[100],
        body: Center(
          child: Image(
            image: AssetImage('images/diamond(2).png'),
          ),
        ),
        appBar: AppBar(
          title: Text('I Am Rich'),
          backgroundColor: Colors.blueGrey[900],
        ),
      ),
    ),
  );
}

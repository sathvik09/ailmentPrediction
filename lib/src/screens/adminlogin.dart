import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AdminLogin extends StatelessWidget{
  void pressed() async{
    print('yep');
  }
  Widget build(BuildContext context){
    return Container(
    //  color: Colors.blueAccent,
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: [
           RaisedButton(
        color: Colors.brown,
        onPressed: pressed,
        child: Text('click me'),
      ),
      Image(image: AssetImage('assets/tree.jpg')),
      // child: Text('A new Page'),
        ],
      ));
  }
}
import 'package:flutter/material.dart';


import './screens/home.dart';
import './navigation.dart';

class App extends StatelessWidget{

  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Home Page',
      home: Scaffold(
        body: Home(),
        bottomNavigationBar: Navigation(), 
    )
    );
  }
}
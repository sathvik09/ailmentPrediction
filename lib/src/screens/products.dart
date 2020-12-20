import 'package:flutter/material.dart';


// bloc import
import '../block/bloc.dart';
class Products extends StatelessWidget{


  Widget build(BuildContext context){
    return StreamBuilder( 
      stream: bloc.colorMode,
      builder: (context,snap){
        bloc.backgroundColor =  bloc.currentColor()?Colors.black:Colors.amber;
        bloc.textColor =  bloc.currentColor()?Colors.white:Colors.black;
        return  SizedBox.expand(
      child: Container(
        color: bloc.backgroundColor,
      child: Container(
        color: bloc.backgroundColor,
       // decoration: BoxDecoration(border: Border.all(color: Colors.grey[300])),
        padding: EdgeInsets.all(20.0),
        margin: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            flipSwitch(),
            buildProduct(),
          ],
        )
      ),
      // child: Text('A new Page'),
    )
    );
      }
    );
  }

  void invertColor(val){
    bloc.updateColor(val);
  }

  Widget flipSwitch(){
    return StreamBuilder(
      stream: bloc.colorMode,
      builder: (context, snapshot) {
        return Row(
              children: <Widget>[
                Text('Flip the colors!?',
                style: TextStyle(color: bloc.textColor),
                ),
                Switch(
                  value: snapshot.hasData?snapshot.data:false,
                   onChanged: invertColor,
                   activeColor: Color.fromRGBO(211, 255, 21,1),
                   ),
              ],
            );
      },    
    ); 
  }

  Widget buildProduct(){
    return Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.grey[300])),
        padding: EdgeInsets.all(20.0),
        margin: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: Text('dummy'),
            ),
          ],
        ));
  }
}
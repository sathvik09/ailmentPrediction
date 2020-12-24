import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:pharma/src/models/datamodel.dart';

// bloc import
import '../block/bloc.dart';

class Products extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ProductState();
  }
}

class ProductState extends State<Products>{
  List<DataModel> elements = [];
  Future<dynamic> part =  get('http://10.0.2.2:3000/data/getData');


     Widget build(BuildContext context){
      // fetchData();
    return FutureBuilder(
      future: part,
      builder: (context,sn){
        List<Widget> children;
        if(sn.hasData){
          children = <Widget>[
            flipSwitch(),
            Expanded(child:
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: formatData(json.decode(sn.data.body))
                ),
            ),
            ];
        }else {
            children = <Widget>[
              SizedBox(
                child: CircularProgressIndicator(),
                width: 60,
                height: 60,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Awaiting result...'),
              )
            ];
            }

            return  StreamBuilder( 
      stream: bloc.colorMode,
      builder: (context,snap){
        bloc.backgroundColor =  bloc.currentColor()?Colors.black:Colors.amber;
        bloc.textColor =  bloc.currentColor()?Colors.white:Colors.black;
        return  streamComponent(children);
      }
    );
      },
    );
  }

  Widget streamComponent(List<Widget> children){
    return SizedBox.expand(
      child: Container(
        color: bloc.backgroundColor,
      child: Container(
        color: bloc.backgroundColor,
       // decoration: BoxDecoration(border: Border.all(color: Colors.grey[300])),
        padding: EdgeInsets.all(20.0),
        margin: EdgeInsets.all(20.0),
        child: Column(
          children: children,
        )
      ),
      // child: Text('A new Page'),
    )
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

  Widget formatData(List<dynamic> jsonArr){
    for(int i=0;i<jsonArr.length;i++){
     elements.add(DataModel(jsonArr[i])); 
    }
    return ListView.builder(
      // scrollDirection: Axis.vertical,
      // shrinkWrap: true,
      itemCount:elements.length,
      itemBuilder: (context,int index) {
        print(elements[index]);
       return buildComponent(elements[index]);
      },
    );
  }

  Widget buildComponent(DataModel instanceOfData){
    print(instanceOfData.id);
    return Container(
     decoration: BoxDecoration(border: Border.all(color:Colors.grey)),
     padding: EdgeInsets.all(20.0),
     margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
        //  Image(image: AssetImage(instanceOfData.url)),
         Padding(
             padding: EdgeInsets.only(top: 5.0),
             child: Text(instanceOfData.desc),
           ),
       ],
     ),
    );
  }
}
import 'dart:async';
import 'package:flutter/material.dart';

class NavBloc {
  final clickPage = StreamTransformer<int,int>.fromHandlers(
    handleData: (page,sink){
      sink.add(page);
    }
  );

  final changeColor = StreamTransformer<bool,bool>.fromHandlers(
    handleData: (payload,sink){
      sink.add(payload);
    }
  );
}
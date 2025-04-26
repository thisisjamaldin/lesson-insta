import 'package:flutter/material.dart';

class MRoute{
  static void push(context, page){
    Navigator.push(context, MaterialPageRoute(builder: (contetx)=>page));
  }
  static void replace(context, page){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (contetx)=>page));
  }
  static void pop(context, {data}){
    Navigator.pop(context, data);
  }
}
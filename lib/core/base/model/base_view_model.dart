import 'package:flutter/material.dart';

abstract class BaseViewModel {
  late BuildContext context;
  void setContext(BuildContext context){
     this.context = context;
  }
  void init(){}
}

import 'package:flutter/material.dart';

class LoginModel {
  String username;
  String password;

  LoginModel({
    @required this.username,
    @required this.password
  });

  void debug(){
    print(this.username);
    print(this.password);
  }
}
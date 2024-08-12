import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/api/api.dart';
import 'package:todo/pages/home_screen.dart';
import 'package:todo/pages/login_screen.dart';

class AuthCkecker extends StatefulWidget {
  const AuthCkecker({super.key});

  @override
  State<AuthCkecker> createState() => _AuthCkeckerState();
}

class _AuthCkeckerState extends State<AuthCkecker> {
  // ---------------------------------------------------------
  User? user;
  getUser()async{
    User usr = APIs.user;
    setState(() {
      user = usr;
    });
  }
  // ---------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    if(user != null){
      return HomeScreen();
    }else{
      return LoginScreen();
    }
  }
}
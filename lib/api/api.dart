import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/pages/auth_check.dart';
class APIs {
  // authentication
  static FirebaseAuth auth = FirebaseAuth.instance;
  // firebase database
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  // current user
  static User get user => auth.currentUser!;

  // logout user
  static void logout(BuildContext context)async{
    await auth.signOut().then((_){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => AuthCkecker()));
    });
  }
  
}

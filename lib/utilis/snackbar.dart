import 'package:flutter/material.dart';

class Snackbars{
    static void snackBarSuccess(BuildContext context, String message){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Color.fromARGB(255, 26, 138, 84),
        content: Center(
          child: Text(message, style: TextStyle(
            color: Colors.white
          ),),
        )
      )
    );
  }

  static void snackBarError(BuildContext context, String message){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.redAccent,
        content: Center(
          child: Text(message, style: TextStyle(
            color: Colors.white
          ),),
        )
      )
    );
  }
}
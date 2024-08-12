import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/api/api.dart';
import 'package:todo/pages/home_screen.dart';
import 'package:todo/utilis/snackbar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // -----------------------------------------------------------
  bool isSending = false;
  bool isLogin = true;
  bool isSignup = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // login user
  void loginOrSignup() async {
    setState(() {
      isSending = true;
    });
    try {
      if (emailController.text.isNotEmpty &&
          passwordController.text.isNotEmpty) {
        isLogin
            ? await APIs.auth
                .signInWithEmailAndPassword(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim())
                .then((_) {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => HomeScreen()));
                emailController.clear();
                passwordController.clear();
              })
            : await APIs.auth
                .createUserWithEmailAndPassword(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim())
                .then((_) {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => HomeScreen()));
                emailController.clear();
                passwordController.clear();
              });
      } else {
        setState(() {
          isSending = false;
        });
        Snackbars.snackBarError(context, 'Email and password are required');
      }
    } on FirebaseAuthException catch (e) {
      // ignore: use_build_context_synchronously
      setState(() {
        isSending = false;
      });
      Snackbars.snackBarError(context, e.code);
    }
  }

  // -----------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 24, 122, 167),
      body: SizedBox(
        width: screenWidth,
        height: screenHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 280,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 24, 122, 167),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5.0),
                  topRight: Radius.circular(5.0)
                )
              ),
              child: Row(
                children: [
                  Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isLogin = true;
                            isSignup = false;
                          });
                        },
                        child: Container(
                            width: double.infinity,
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(10.0),
                             decoration: isLogin ? BoxDecoration(
                                color: Color.fromARGB(255, 85, 194, 245),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5.0),
                                    topRight: Radius.circular(5.0))) : null,
                            child: Text('LOGIN', style: TextStyle(fontWeight: FontWeight.bold),)),
                      )),
                  Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isLogin = false;
                            isSignup = true;
                          });
                        },
                        child: Container(
                            width: double.infinity,
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(10.0),
                             decoration: isSignup ? BoxDecoration(
                                color: Color.fromARGB(255, 85, 194, 245),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5.0),
                                    topRight: Radius.circular(5.0))) : null,
                            child: Text('REGISTER', style: TextStyle(fontWeight: FontWeight.bold),)),
                      )),
                ],
              ),
            ),
            Container(
              width: 280.0,
              padding: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 85, 194, 245),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5.0),
                      bottomRight: Radius.circular(5.0))),
              child: Column(
                children: [
                  TextField(
                    controller: emailController,
                    cursorWidth: 1,
                    decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(fontSize: 13.0),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 0.0)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: passwordController,
                    cursorWidth: 1,
                    decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(fontSize: 13.0),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 0.0)),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  InkWell(
                    onTap: () {
                      loginOrSignup();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.0),
                          color: Color.fromARGB(255, 13, 111, 156)),
                      child: isSending 
                        ? Container(
                          alignment: Alignment.center,
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.0,
                            color: Colors.white,
                          ),
                        )
                        :Text(
                        isLogin ? 'LOGIN' : 'REGISTER',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

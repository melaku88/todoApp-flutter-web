import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
              width: 280.0,
              padding: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 85, 194, 245),
                  borderRadius: BorderRadius.circular(3.0)),
              child: Column(
                children: [
                  TextField(
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
                    onTap: (){},
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.0),
                        color: Color.fromARGB(255, 13, 111, 156)
                      ),
                      child: Text('LOGIN', style: TextStyle(color: Colors.white),),
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

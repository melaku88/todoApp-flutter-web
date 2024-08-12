import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo/pages/home_screen.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: FirebaseOptions(
    apiKey: "AIzaSyCzXmjX8Ojygs_W53WclyC9jdUVaT15DeY",
      authDomain: "todo-cd512.firebaseapp.com",
      projectId: "todo-cd512",
      storageBucket: "todo-cd512.appspot.com",
      messagingSenderId: "494513512729",
      appId: "1:494513512729:web:1651c504f942b8591fe588",
      measurementId: "G-VPF8PZ7CPE"
    )
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'todoAPP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(
        useMaterial3: true
      ),
      home: HomeScreen(),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:todo/constants/device.dart';
import 'package:todo/widgets/header_desktop.dart';
import 'package:todo/widgets/header_mobile.dart';
import 'package:todo/widgets/main_desktop.dart';
import 'package:todo/widgets/main_mobile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //* -----------------------------------------------------------------------------
  List<String> todoLists= [];
  final TextEditingController todoController = TextEditingController();
  //* -----------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Container(
          height: screenHeight,
          width: screenWidth,
          color: Color.fromARGB(255, 24, 122, 167),
          child: Column(
            children: [
              // header section
              constraints.maxWidth >= kDeviceWidth 
                ? HeaderDesktop()
                : HeaderMobile(),

              // main section
              constraints.maxWidth >= kDeviceWidth 
                ? MainDesktop(listDDatas: todoLists, controller: todoController,)
                : MainMobile(listMDatas: todoLists,),
            ],
          ),
        ),
      );
    });
  }
}

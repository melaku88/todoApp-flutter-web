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
  List<dynamic> todoLists = [];
  final TextEditingController activityController = TextEditingController();
  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();

  void addTodo() async {
    String activity = activityController.text.trim();
    String from = fromController.text.trim();
    String to = toController.text.trim();
    if (activity.isNotEmpty && from.isNotEmpty && to.isNotEmpty) {
      setState(() {
        todoLists.add({'activity': activity, 'from': from, 'to': to});
      });
      activityController.clear();
      fromController.clear();
      toController.clear();
    }
  }

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
                  : HeaderMobile(
                      onTap: addTodo,
                      activityController: activityController,
                      fromController: fromController,
                      toController: toController,
                    ),

              // main section
              constraints.maxWidth >= kDeviceWidth
                  ? MainDesktop(
                      listDDatas: todoLists,
                      onTap: addTodo,
                      activityController: activityController,
                      fromController: fromController,
                      toController: toController,
                    )
                  : MainMobile(
                      listMDatas: todoLists,
                    ),
            ],
          ),
        ),
      );
    });
  }
}

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/constants/device.dart';
import 'package:todo/widgets/header_desktop.dart';
import 'package:todo/widgets/header_mobile.dart';
import 'package:todo/widgets/main_desktop.dart';
import 'package:todo/widgets/main_mobile.dart';
import 'package:todo/widgets/text_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //* -----------------------------------------------------------------------------
  List<String> todoLists = [];
  bool isSending = false;
  final TextEditingController activityController = TextEditingController();

  void addTodo() async {
    if (activityController.text.trim().isNotEmpty) {
      setState(() {
        todoLists.add(activityController.text.trim());
      });
      // Obtain shared preferences.
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setStringList('todos', todoLists);

      activityController.clear();
    }
  }

  getTodos()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? todos = prefs.getStringList('todos');
    setState(() {
      todoLists = todos ?? [];
    });
  }

  @override
  void initState() {
    getTodos();
    super.initState();
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
                      isSending: isSending,
                    ),

              // main section
              constraints.maxWidth >= kDeviceWidth
                  ? MainDesktop(
                      listDDatas: todoLists,
                      onTap: addTodo,
                      activityController: activityController,
                      isSending: isSending,
                    )
                  : MainMobile(
                      listMDatas: todoLists,
                    ),
            ],
          ),
        ),
        floatingActionButton: constraints.maxWidth <= kDeviceWidth
            ? FloatingActionButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          height: 285,
                          padding: EdgeInsets.only(
                              top: 20.0,
                              left: 15.0,
                              right: 15.0,
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: MyTextField(
                            onTap: addTodo,
                            activityController: activityController,
                            isSending: isSending,
                          ),
                        );
                      });
                },
                shape: CircleBorder(),
                backgroundColor: Color.fromARGB(255, 18, 116, 162),
                child: Icon(Icons.add, color: Colors.white),
              )
            : null,
      );
    });
  }
}
